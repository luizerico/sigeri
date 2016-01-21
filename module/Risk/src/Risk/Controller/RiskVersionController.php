<?php

namespace Risk\Controller;

use Risk\Entity\RiskVersion;
use Risk\Controller\GenericController;
use Zend\View\Model\JsonModel;

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

}
