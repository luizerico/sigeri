<?php

namespace Asset\Controller;

use Asset\Entity\ServiceAsset;
use Asset\Controller\AssetController;

class ServiceAssetController extends AssetController {

    public function __construct() {
        $this->object = new ServiceAsset();
        $this->entity = 'Asset\Entity\ServiceAsset';
        $this->title = 'Service Asset';
        $this->route = 'asset';
        
        //parent::__construct();
    }    

}
