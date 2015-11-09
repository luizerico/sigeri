<?php

namespace Risk\Controller;

use Risk\Entity\Impact;

class ImpactController extends GenericController {

    public function __construct() {
        $this->object = new Impact();
        $this->entity = 'Risk\Entity\Impact';
        $this->title = 'Impact';
        $this->route = 'impact';

        parent::__construct();
    }

}
