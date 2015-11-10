<?php

namespace Risk\Controller;

use Risk\Entity\PlanStrategy;

class PlanStrategyController extends GenericController {
    
    public function __construct() {
        $this->object = new PlanStrategy();
        $this->entity = 'Risk\Entity\PlanStrategy';
        $this->title = 'Plan Strategy';
        $this->route = 'planstrategy';
        
        parent::__construct();
    }
}