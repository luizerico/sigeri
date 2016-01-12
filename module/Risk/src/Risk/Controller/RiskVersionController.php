<?php

namespace Risk\Controller;

use Risk\Entity\RiskVersion;
use Risk\Controller\GenericController;
use Zend\View\Model\JsonModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Exception;

class RiskVersionController extends GenericController {

    public function __construct() {
        $this->object = new RiskVersion();
        $this->entity = 'Risk\Entity\RiskVersion';
        $this->title = 'Risk Version';
        $this->route = 'riskversion';

        parent::__construct();
    }     
    
    public function jsonRiskDataAction() {
        $entity_id = $this->params()->fromQuery('entity_id');
        $orderby = $this->params()->fromQuery('orderby');
        $limit = $this->params()->fromQuery('limit');

        if (isset($entity_id)) {
            $entity_id = " WHERE u.entity_id=" . $entity_id . " ";
        }
        if (isset($orderby)) {
            $orderby = " ORDER BY " . $orderby . " DESC ";
        }

        $query = "SELECT 
                        u.id AS id, 
                        u.entity_id AS value_id,
                        u.name AS name,
                        u.created AS date,                        
                        i.value AS impact, 
                        p.value AS likelihood,
                        (i.value * p.value) AS value
                    FROM Risk\Entity\RiskVersion u                     
                    JOIN u.impact i 
                    JOIN u.likelihood p " . 
                    $entity_id . 
                    $orderby;

        $ORMRepository = $this->getEntityManager();
        $query = $ORMRepository->createQuery($query);

        if (isset($limit)) {
            $query->setMaxResults($limit);
        }

        $results = $query->getArrayResult(\Doctrine\ORM\AbstractQuery::HYDRATE_SCALAR);

        return new JsonModel($results);
    }
    
    
//    public function editAction() {
//        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
//        $form = $builder->createForm($this->object);
//        $hydrator = new DoctrineHydrator($this->getEntityManager(), $this->entity);
//        $form->setHydrator($hydrator);
//
//        $id = (int) $this->params()->fromRoute('id', 0);
//
//        if (!$id) {
//            return $this->Redirect()->toRoute($this->route, array(
//                        'action' => 'list'
//            ));
//        }
//
//        /*
//         * Check if the requested Id is valid and
//         * Exist in the database
//         * To do: Customize a page to report the request with a invalid Id
//         */
//        try {
//            $ORMRepository = $this->getEntityManager()->getRepository($this->entity);
//            $dbArray = $ORMRepository->find($id);
//            if (!$dbArray) {
//                throw new Exception('Id invalido.');
//            }
//        } catch (Exception $ex) {
//            return $this->redirect()->toRoute($this->route, array(
//                        'action' => 'list'
//            ));
//        }
//
//        $form->bind($dbArray);
//        $form->get('submit')->setAttribute('value', 'Edit');
//
//        $request = $this->getRequest();
//        if ($request->isPost()) {
//            $form->setData($request->getPost());
//            if ($form->isValid()) {
//
//                $this->object->exchangeArray($hydrator->extract($form->getData()));
//                $this->getEntityManager()->flush();
//                return $this->redirect()->toRoute($this->route, array(
//                            'action' => 'list'
//                ));
//            }
//        }
//
//        return array(
//            'title' => $this->title,
//            'id' => $id,
//            'form' => $form,
//            'dbArray' => $dbArray
//        );
//    }


}
