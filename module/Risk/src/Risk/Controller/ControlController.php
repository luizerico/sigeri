<?php

namespace Risk\Controller;

use Risk\Entity\Control;
use Risk\Controller\GenericController;

class ControlController extends GenericController {

    public function __construct() {
        $this->object = new Control();
        $this->entity = 'Risk\Entity\Control';
        $this->title = 'Control';
        $this->route = 'control';
        $this->entityversion = 'Risk\Entity\ControlVersion';
        
        parent::__construct();
    }

}
