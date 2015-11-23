<?php

namespace Risk\Controller;

use Risk\Entity\Likelihood;

class LikelihoodController extends GenericController {
    
    public function __construct() {
        $this->object = new Likelihood();
        $this->entity = 'Risk\Entity\Likelihood';
        $this->title = 'Likelihood';
        $this->route = 'likelihood';
        
        parent::__construct();
    }
}
