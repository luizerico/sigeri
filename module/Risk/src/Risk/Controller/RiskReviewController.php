<?php

namespace Risk\Controller;

use Risk\Entity\RiskReview;

class RiskReviewController extends GenericController {

    public function __construct() {
        $this->object = new RiskReview();
        $this->entity = 'Risk\Entity\RiskReview';
        $this->title = 'Risk Review';
        $this->route = 'riskreview';

        parent::__construct();
    }

}
