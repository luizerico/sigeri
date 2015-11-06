<?php

namespace Asset\Controller;

use Asset\Entity\ProcessAsset;
use Asset\Controller\AssetController;

class ProcessAssetController extends AssetController {

    public function __construct() {
        $this->object = new ProcessAsset();        
        $this->entity = 'Asset\Entity\ProcessAsset';
        $this->title = 'Process Asset';
        $this->route = 'asset';
        
        //parent::__construct();
    }    

}
