<?php

namespace Risk\Controller;

use Risk\Entity\Impact;
use Risk\Controller\GenericController;

class ImpactController extends GenericController {

    public function __construct() {
        $this->object = new Impact();
        $this->entity = 'Risk\Entity\Impact';
        $this->title = 'Impact';
        $this->route = 'impact';

        parent::__construct();
    }

}
