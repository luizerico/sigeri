<?php

namespace Risk\Controller;

use Risk\Entity\ControlStatus;
use Risk\Controller\GenericController;

class ControlStatusController extends GenericController {

    public function __construct() {
        $this->object = new ControlStatus();
        $this->entity = 'Risk\Entity\ControlStatus';
        $this->title = 'Control Status';
        $this->route = 'controlstatus';
        
        parent::__construct();
    }

}