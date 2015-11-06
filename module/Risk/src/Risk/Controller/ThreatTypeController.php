<?php

namespace Risk\Controller;

use Risk\Entity\ThreatType;
use Risk\Controller\GenericController;

class ThreatTypeController extends GenericController {

    public function __construct() {
        $this->object = new ThreatType();
        $this->entity = 'Risk\Entity\ThreatType';
        $this->title = 'Threat Type';
        $this->route = 'threattype';
        
        parent::__construct();
    }

}
