<?php

namespace Asset\Controller;

define('TITLE', 'Asset Group');
define('ROUTER', 'assetgroup');
define('ENTITY', 'Asset\Entity\AssetGroup');

use Asset\Entity\AssetGroup;
use Asset\Controller\GenericController;

class AssetGroupController extends GenericController {

    public function __construct() {
        $this->object = new AssetGroup();
//        $this->listview = 'listview';
    }

}
