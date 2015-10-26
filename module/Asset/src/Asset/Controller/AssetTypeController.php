<?php

namespace Asset\Controller;

define('TITLE', 'Asset Type');
define('ROUTER', 'assettype');
define('ENTITY', 'Asset\Entity\AssetType');

use Asset\Entity\AssetType;
use Asset\Controller\GenericController;

class AssetTypeController extends GenericController {

    public function __construct() {
        $this->object = new AssetType();
//        $this->listview = 'listview';
    }

}
