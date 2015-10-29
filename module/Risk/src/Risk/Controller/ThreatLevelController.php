<?php

namespace Risk\Controller;

define('TITLE', 'Threat Level');
define('ROUTER', 'threatlevel');
define('ENTITY', 'Risk\Entity\ThreatLevel');

use Risk\Entity\ThreatLevel;
use Risk\Controller\GenericController;

class ThreatLevelController extends GenericController {

    public function __construct() {
        $this->object = new ThreatLevel();
    }

}
