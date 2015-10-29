<?php

namespace Risk\Controller;

define('TITLE', 'Threat Source');
define('ROUTER', 'threatsource');
define('ENTITY', 'Risk\Entity\ThreatSource');

use Risk\Entity\ThreatSource;
use Risk\Controller\GenericController;

class ThreatSourceController extends GenericController {

    public function __construct() {
        $this->object = new ThreatSource();
    }

}
