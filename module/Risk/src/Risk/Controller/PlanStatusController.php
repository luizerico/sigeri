<?php

namespace Risk\Controller;

use Risk\Entity\PlanStatus;
use Risk\Controller\GenericController;

class PlanStatusController extends GenericController {
    
    public function __construct() {
        $this->object = new PlanStatus();
        $this->entity = 'Risk\Entity\PlanStatus';
        $this->title = 'Plan Status';
        $this->route = 'planstatus';
        
        parent::__construct();
    }
}