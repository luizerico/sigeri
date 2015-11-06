<?php

namespace Asset\Controller;

use Asset\Entity\ServerAsset;
use Asset\Controller\AssetController;

class ServerAssetController extends AssetController {

    public function __construct() {
        $this->object = new ServerAsset();
        $this->entity = 'Asset\Entity\ServerAsset';
        $this->title = 'Server Asset';
        $this->route = 'asset';
        
        //parent::__construct();
    }    

}
