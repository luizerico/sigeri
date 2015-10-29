<?php

namespace Asset\Controller;

define('TITLE', 'Server Asset');
define('ROUTER', 'serverasset');
define('ENTITY', 'Asset\Entity\ServerAsset');

use Asset\Entity\ServerAsset;
use Asset\Controller\AssetController;


//use Zend\Log;
//use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
//use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
//use RecursiveIteratorIterator;

class ServerAssetController extends AssetController {

    public function __construct() {
        $this->object = new ServerAsset();
    }    

}
