<?php

namespace Risk\Controller;

use Risk\Entity\Risk;
use Risk\Controller\GenericController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;

class RiskController extends GenericController {

    public function __construct() {
        $this->object = new Risk();
        $this->entity = 'Risk\Entity\Risk';
        $this->title = 'Risk';
        $this->route = 'risk';
        $this->entityversion = 'Risk\Entity\RiskVersion';

        parent::__construct();
    }

    public function xyriskAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/xyrisk.phtml');
    }

    public function pieriskAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/pierisk.phtml');
    }

    public function pieassetAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/pieasset.phtml');
    }

    public function barriskAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/barrisk.phtml');
    }

    public function lineriskversionAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/lineriskversion.phtml');
    }

    public function colriskAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/colrisk.phtml');
    }

    public function collikeximpactAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/collikeximpact.phtml');
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

        if (isset($limit)) {
            $limit = " LIMIT " . $limit;
        }

        $query = "SELECT risk.id as id,
                    risk.name AS name, 
                    impact.value AS impact, 
                    likelihood.value AS likelihood, 
                    (impact.value * likelihood.value) AS value 
                        FROM risk 
                        join impact 
                        join likelihood
                        WHERE
                                impact.id=risk.impact_id AND
                                likelihood.id=risk.likelihood_id "
                . $orderby
                . $limit;

        return new JsonModel($this->querysql($query));
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
                            left join risk_asset ON risk.id=risk_asset.entity_id 
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
        $query = "SELECT type as name, count(*) AS value, ROUND(sum(risk)/count(*),2) AS avgrisk, MAX(risk) AS maxrisk FROM (
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
        $query = "SELECT type as name, count(*) AS value, ROUND(sum(risk)/count(*),2) AS avgrisk, MAX(risk) AS maxrisk FROM (
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
        $entity_id = $this->params()->fromQuery('entity_id');
        $query = "SELECT * FROM riskversion where entity_id=" . $entity_id;

        return new JsonModel($this->querysql($query));
    }

    public function countRegisterAction() {
        $entity = $this->params()->fromQuery('entity');
        $query = "SELECT count(*) AS rowCount FROM " . $entity;

        return new JsonModel($this->querysql($query));
    }

}
