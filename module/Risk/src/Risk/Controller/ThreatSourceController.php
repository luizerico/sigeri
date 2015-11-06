<?php

namespace Risk\Controller;

use Risk\Entity\ThreatSource;
use Risk\Controller\GenericController;

class ThreatSourceController extends GenericController {

    public function __construct() {
        $this->object = new ThreatSource();
        $this->entity = 'Risk\Entity\ThreatSource';
        $this->title = 'Threat Source';
        $this->route = 'threatsource';
        
        parent::__construct();
    }

}
