<?php

namespace Risk\Controller;

use Risk\Entity\Probability;

class ProbabilityController extends GenericController {
    
    public function __construct() {
        $this->object = new Probability();
        $this->entity = 'Risk\Entity\Probability';
        $this->title = 'Probability';
        $this->route = 'probability';
        
        parent::__construct();
    }
}
