<?php

namespace Risk\Controller;

use Risk\Entity\ControlType;
use Risk\Controller\GenericController;

class ControlTypeController extends GenericController {

    public function __construct() {
        $this->object = new ControlType();
        $this->entity = 'Risk\Entity\ControlType';
        $this->title = 'Control Type';
        $this->route = 'controltype';
        
        parent::__construct();
    }

}