<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="serviceasset")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("ServiceAsset")
 *  
 */
class ServiceAsset extends Asset {

    public function __construct() {        
    }

    public function exchangeArray($data) {        
        
    }

    public function __toString() {
        return sprintf('%s', $this->getName());
    }   
    
}
