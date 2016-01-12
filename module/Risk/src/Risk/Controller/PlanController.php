<?php

namespace Risk\Controller;

use Risk\Entity\Plan;
use Risk\Controller\GenericController;

class PlanController extends GenericController {

    public function __construct() {
        $this->object = new Plan();
        $this->entity = 'Risk\Entity\Plan';
        $this->title = 'Plan';
        $this->route = 'plan';
        $this->entityversion = 'Risk\Entity\PlanVersion';

        parent::__construct();
    }
}
