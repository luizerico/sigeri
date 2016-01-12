<?php

namespace Risk\Controller;

use Risk\Entity\ControlVersion;
use Risk\Controller\GenericController;

class ControlVersionController extends GenericController {

    public function __construct() {
        $this->object = new ControlVersion();
        $this->entity = 'Risk\Entity\ControlVersion';
        $this->title = 'Control Version';
        $this->route = 'controlversion';

        parent::__construct();
    }

}
