<?php

namespace Asset\Controller;

use Asset\Entity\LocationAsset;
use Asset\Controller\AssetController;

class LocationAssetController extends AssetController {

    public function __construct() {
        $this->object = new LocationAsset();
        $this->entity = 'Asset\Entity\LocationAsset';
        $this->title = 'Location Asset';
        $this->route = 'locationasset';
    }    

}
