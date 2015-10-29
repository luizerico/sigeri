<?php

namespace Risk\Controller;

define('TITLE', 'Threat Type');
define('ROUTER', 'threattype');
define('ENTITY', 'Risk\Entity\ThreatType');

use Risk\Entity\ThreatType;
use Risk\Controller\GenericController;

class ThreatTypeController extends GenericController {

    public function __construct() {
        $this->object = new ThreatType();
    }

}
