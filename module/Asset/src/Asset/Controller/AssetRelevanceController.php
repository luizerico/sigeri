<?php

namespace Asset\Controller;

use Asset\Entity\AssetRelevance;
use Asset\Controller\GenericController;

class AssetRelevanceController extends GenericController {

    public function __construct() {
        $this->object = new AssetRelevance();
        $this->entity = 'Asset\Entity\AssetRelevance';
        $this->title = 'Asset Relevance';
        $this->route = 'assetrelevance';
    }

}
