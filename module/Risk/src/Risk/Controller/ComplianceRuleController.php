<?php

namespace Risk\Controller;

use Risk\Entity\ComplianceRule;
use Risk\Controller\GenericController;

class ComplianceRuleController extends GenericController {

    public function __construct() {
        $this->object = new ComplianceRule();
        $this->entity = 'Risk\Entity\ComplianceRule';
        $this->title = 'Compliance Rule';
        $this->route = 'compliancerule';
        
        parent::__construct();
    }

}