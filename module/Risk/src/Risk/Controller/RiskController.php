<?php

namespace Risk\Controller;

use Risk\Entity\Risk;
use Risk\Entity\RiskVersion;
use Risk\Controller\GenericController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Exception;

class RiskController extends GenericController {

    public function __construct() {
        $this->object = new Risk();
        $this->entity = 'Risk\Entity\Risk';
        $this->title = 'Risk';
        $this->route = 'risk';

        parent::__construct();
    }

    public function xychartAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/xychart.phtml');
    }

    public function barchartAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/barchart.phtml');
    }

    public function columnchartAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/columnchart.phtml');
    }

    public function chartAction() {
        return new ViewModel();
    }

    public function jsonRiskDataAction() {
        $orderby = $this->params()->fromQuery('orderby');
        $limit = $this->params()->fromQuery('limit');

        if (isset($orderby)) {
            $orderby = " ORDER BY " . $orderby . " DESC ";
        }

        $query = "SELECT u.id AS id, u.name AS name, i.value AS impact, p.value AS likelihood,
                    (i.value * p.value) AS risk
                    FROM Risk\Entity\Risk u                     
                    JOIN u.impact i 
                    JOIN u.likelihood p " . $orderby;

        $ORMRepository = $this->getEntityManager();
        $query = $ORMRepository->createQuery($query);

        if (isset($limit)) {
            $query->setMaxResults($limit);
        }

        $results = $query->getArrayResult(\Doctrine\ORM\AbstractQuery::HYDRATE_SCALAR);

        $json2 = \Zend\Json\Json::encode($results, true);

        return new JsonModel($results);
    }

    public function riskcountAction() {
        $where = $this->params()->fromQuery('where');
        if (isset($where)) {
            $where = " WHERE " . $where;
        }

        $query = "SELECT COUNT(*) AS count_risk FROM (
                    SELECT
                        impact.value AS impact, 
                        likelihood.value AS likelihood,
                        (impact.value * likelihood.value) AS risk
                        FROM risk
                        JOIN impact 
                        JOIN likelihood 
                        WHERE risk.impact_id=impact.id AND risk.likelihood_id=likelihood.id
                        ) as x " . $where;

        $con = $this->getEntityManager()->getConnection();
        $stmt = $con->prepare($query);
        $stmt->execute();
        $data = $stmt->fetch();

        return new JsonModel($data);
    }

    public function assetcountAction() {
        $where = $this->params()->fromQuery('where');
        if (isset($where)) {
            $where = " " . $where . " AND ";
        }

        $query = "SELECT COUNT(*) AS assetcount FROM (
                        SELECT asset.name AS asset, risk.name AS name, impact.value AS impact, likelihood.value AS likelihood, (impact.value * likelihood.value) AS risk 
                            FROM risk 
                            left join risk_asset ON risk.id=risk_asset.risk_id 
                            left join asset ON risk_asset.asset_id=asset.id 
                            join impact 
                            join likelihood
                            WHERE
                                    impact.id=risk.impact_id AND
                                    likelihood.id=risk.likelihood_id
                            GROUP BY asset) 
                    AS risk_asset 
                    WHERE " . $where . " asset<>'NULL'";

        $con = $this->getEntityManager()->getConnection();
        $stmt = $con->prepare($query);
        $stmt->execute();
        $data = $stmt->fetchAll();

        return new JsonModel($data);
    }

    public function typeAssetListAction() {
        $query = "SELECT type as assettype, count(*) AS number, ROUND(sum(risk)/count(*),2) AS avgrisk, MAX(risk) AS maxrisk FROM (
                    SELECT asset.name AS asset, assettype.name AS type, impact.value AS impact, likelihood.value AS likelihood, (impact.value * likelihood.value) AS risk 
                    FROM risk 
                    LEFT JOIN risk_asset ON risk.id=risk_asset.risk_id 
                    LEFT JOIN asset ON risk_asset.asset_id=asset.id 
                    JOIN impact 
                    JOIN likelihood
                    JOIN assettype
                    WHERE   asset.type_id=assettype.id AND
                            impact.id=risk.impact_id AND
                            likelihood.id=risk.likelihood_id		
                    GROUP BY asset) AS risk_asset 
                WHERE asset<>'NULL'
                GROUP by type";

        return new JsonModel($this->querysql($query));
    }

    public function typeRiskListAction() {
        $query = "SELECT type as risktype, count(*) AS number, ROUND(sum(risk)/count(*),2) AS avgrisk, MAX(risk) AS maxrisk FROM (
                    SELECT risktype.name AS type, impact.value AS impact, likelihood.value AS likelihood, (impact.value * likelihood.value) AS risk 
                        FROM risk
                        join impact 
                        join likelihood
                        join risktype
                        WHERE	risk.type_id=risktype.id AND
                                impact.id=risk.impact_id AND
                                likelihood.id=risk.likelihood_id		
                        ) AS risk_asset 
                GROUP by type";

        return new JsonModel($this->querysql($query));
    }

    public function versionListAction() {
        $risk_id = $this->params()->fromQuery('risk_id');
        $query = "SELECT * FROM riskversion where risk_id=" . $risk_id;

        return new JsonModel($this->querysql($query));
    }

    public function addAction() {
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($this->object);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), $this->entity);
        $form->setHydrator($hydrator);
        $form->get('submit')->setAttribute('value', 'Add');

        $form->bind($this->object);

        // Get the asset informations send by the import code
        $form->populateValues(array('name' => $this->params()->fromQuery('assetname')));

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->persist($this->object);
                $this->getEntityManager()->flush();

                /*
                 *  This method is strange and poor but is more simple that
                 *  use the clone or copy to copy an entirely entity and all
                 *  relations.
                 */
                $riskversion = new RiskVersion();
                $riskversion->exchangeArray($hydrator->extract($form->getData()));
                $riskversion->setRiskId($this->object->getId());
                $this->getEntityManager()->persist($riskversion);
                $this->getEntityManager()->flush();

                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => $this->title,
            'router' => $this->route,
            'form' => $form
        );
    }

    public function editAction() {
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($this->object);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), $this->entity);
        $form->setHydrator($hydrator);

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->Redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

        /*
         * Check if the requested Id is valid and
         * Exist in the database
         * To do: Customize a page to report the request with a invalid Id
         */
        try {
            $ORMRepository = $this->getEntityManager()->getRepository($this->entity);
            $dbArray = $ORMRepository->find($id);
            if (!$dbArray) {
                throw new Exception('Id invalido.');
            }
        } catch (Exception $ex) {
            return $this->redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

        $form->bind($dbArray);
        $form->get('submit')->setAttribute('value', 'Edit');

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {

                $riskversion = new RiskVersion();
                $riskversion->exchangeArray($hydrator->extract($form->getData()));
                $riskversion->setRiskId($id);
                $this->getEntityManager()->persist($riskversion);

                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }
        
        $versionArray = $this->getEntityManager()
                ->getRepository('\Risk\Entity\RiskVersion')->findBy(array('risk_id'=>$id));
        echo $versionArray;


        return array(
            'title' => $this->title,
            'id' => $id,
            'form' => $form,
            'dbArray' => $dbArray,
            'vsArray' => $versionArray,
        );
    }

}
