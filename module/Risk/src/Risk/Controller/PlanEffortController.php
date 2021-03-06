<?php

namespace Risk\Controller;

use Risk\Entity\PlanEffort;
use Risk\Controller\GenericController;

class PlanEffortController extends GenericController {
    
    public function __construct() {
        $this->object = new PlanEffort();
        $this->entity = 'Risk\Entity\PlanEffort';
        $this->title = 'Plan Effort';
        $this->route = 'planeffort';
        
        parent::__construct();
    }
}