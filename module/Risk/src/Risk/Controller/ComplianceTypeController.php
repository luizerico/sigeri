<?php

namespace Risk\Controller;

use Risk\Entity\ComplianceType;
use Risk\Controller\GenericController;

class ComplianceTypeController extends GenericController {

    public function __construct() {
        $this->object = new ComplianceType();
        $this->entity = 'Risk\Entity\ComplianceType';
        $this->title = 'Compliance Type';
        $this->route = 'compliancetype';
        
        parent::__construct();
    }

}