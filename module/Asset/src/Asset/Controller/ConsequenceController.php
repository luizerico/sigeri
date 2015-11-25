<?php

namespace Asset\Controller;

use Asset\Entity\Consequence;
use Asset\Controller\GenericController;

class ConsequenceController extends GenericController {

    public function __construct() {
        $this->object = new Consequence();
        $this->entity = 'Asset\Entity\Consequence';
        $this->title = 'Consequence';
        $this->route = 'consequence';
    }

}
