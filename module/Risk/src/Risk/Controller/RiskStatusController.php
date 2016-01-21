<?php

namespace Risk\Controller;

use Risk\Entity\RiskStatus;
use Risk\Controller\GenericController;

class RiskStatusController extends GenericController {

   public function __construct() {
        $this->object = new RiskStatus();
        $this->entity = 'Risk\Entity\RiskStatus';
        $this->title = 'Risk Status';
        $this->route = 'riskstatus';
        
        parent::__construct();
    }    
}
