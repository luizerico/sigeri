<?php

namespace Asset\Controller;

define('TITLE', 'Process Asset');
define('ROUTER', 'processasset');
define('ENTITY', 'Asset\Entity\ProcessAsset');

use Asset\Entity\ProcessAsset;
use Asset\Controller\AssetController;


//use Zend\Log;
//use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
//use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
//use RecursiveIteratorIterator;

class ProcessAssetController extends AssetController {

    public function __construct() {
        $this->object = new ProcessAsset();
    }    

}
