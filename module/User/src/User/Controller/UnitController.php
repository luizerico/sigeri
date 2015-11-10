<?php

namespace User\Controller;

use User\Entity\Unit;
use User\Controller\GenericController;

class UnitController extends GenericController {

    public function __construct() {
        $this->object = new Unit();
        $this->entity = 'User\Entity\Unit';
        $this->title = 'Unit';
        $this->route = 'unit';
        
        parent::__construct();
    }

}