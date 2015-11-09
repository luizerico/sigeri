<?php

namespace Risk\Controller;

use Risk\Entity\RiskType;

class RiskTypeController extends GenericController {
    
    public function __construct() {
        $this->object = new RiskType();
        $this->entity = 'Risk\Entity\RiskType';
        $this->title = 'Risk Type';
        $this->route = 'risktype';
        
        parent::__construct();
    }
}
