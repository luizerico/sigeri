<?php

namespace Risk\Controller;

define('TITLE', 'Threat');
define('ROUTER', 'threat');
define('ENTITY', 'Risk\Entity\Threat');

use Risk\Entity\Threat;
use Risk\Controller\GenericController;

class ThreatController extends GenericController {

    public function __construct() {
        $this->object = new Threat();
    }

}