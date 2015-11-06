<?php

namespace Risk\Controller;

use Risk\Entity\Threat;
use Risk\Controller\GenericController;

class ThreatController extends GenericController {

    public function __construct() {
        $this->object = new Threat();
        $this->entity = 'Risk\Entity\Threat';
        $this->title = 'Threat';
        $this->route = 'threat';
        
        parent::__construct();
    }

}