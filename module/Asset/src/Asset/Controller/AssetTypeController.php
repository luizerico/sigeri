<?php

namespace Asset\Controller;

use Asset\Entity\AssetType;
use Asset\Controller\GenericController;

class AssetTypeController extends GenericController {

    public function __construct() {
        $this->object = new AssetType();
        $this->entity = 'Asset\Entity\AssetType';
        $this->title = 'Asset Type';
        $this->route = 'assettype';
    }

}
