<?php

namespace Risk\Controller;

use Risk\Entity\ThreatLevel;
use Risk\Controller\GenericController;

class ThreatLevelController extends GenericController {

    public function __construct() {
        $this->object = new ThreatLevel();
        $this->entity = 'Risk\Entity\ThreatLevel';
        $this->title = 'Threat Level';
        $this->route = 'threatlevel';
        
        parent::__construct();
    }

}
