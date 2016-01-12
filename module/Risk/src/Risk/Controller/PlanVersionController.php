<?php

namespace Risk\Controller;

use Risk\Entity\PlanVersion;
use Risk\Controller\GenericController;

class PlanVersionController extends GenericController {

    public function __construct() {
        $this->object = new PlanVersion();
        $this->entity = 'Risk\Entity\PlanVersion';
        $this->title = 'Plan Version';
        $this->route = 'planversion';
        
        parent::__construct();
    }
}
