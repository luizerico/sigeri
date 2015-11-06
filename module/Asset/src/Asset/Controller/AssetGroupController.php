<?php

namespace Asset\Controller;

use Asset\Entity\AssetGroup;
use Asset\Controller\GenericController;

class AssetGroupController extends GenericController {

    public function __construct() {
        $this->object = new AssetGroup();
        $this->entity = 'Asset\Entity\AssetGroup';
        $this->title = 'Asset Group';
        $this->route = 'assetgroup';
        
        parent::__construct();
    }

}
