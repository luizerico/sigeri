<?php

namespace Asset\Controller;

define('TITLE', 'Server Asset');
define('ROUTER', 'serviceasset');
define('ENTITY', 'Asset\Entity\ServiceAsset');

use Asset\Entity\ServiceAsset;
use Asset\Controller\AssetController;


//use Zend\Log;
//use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
//use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
//use RecursiveIteratorIterator;

class ServiceAssetController extends AssetController {

    public function __construct() {
        $this->object = new ServiceAsset();
    }    

}
