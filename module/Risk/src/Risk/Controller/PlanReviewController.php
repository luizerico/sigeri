<?php

namespace Risk\Controller;

use Risk\Entity\PlanReview;
use Risk\Controller\GenericController;

class PlanReviewController extends GenericController {

    public function __construct() {
        $this->object = new PlanReview();
        $this->entity = 'Risk\Entity\PlanReview';
        $this->title = 'Plan Review';
        $this->route = 'planreview';

        parent::__construct();
    }

}
