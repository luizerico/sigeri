<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="locationasset")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("LocationAsset")
 *  
 */
class LocationAsset extends Asset {

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"3"}})
     * @Annotation\Options({"label":"Address:"})
     *
     * @var string
     * @access protected
     */
    protected $address;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Geo-Location:"}) 
     *
     * @var string
     * @access protected
     */
    protected $geolocation;

    public function __construct() {
        
    }

    public function exchangeArray($data) {
        $this->address = (isset($data ['address'])) ? $data ['address'] : null;
        $this->geolocation = (isset($data ['geolocation'])) ? $data ['geolocation'] : null;
    }

    public function __toString() {
        return sprintf('%s', $this->getName());
    }

    public function getAddress() {
        return $this->address;
    }

    public function setAddress($address) {
        $this->address = $address;
        return $address;
    }

    public function getGeolocation() {
        return $this->geolocation;
    }

    public function setGeolocation($geolocation) {
        $this->geolocation = $geolocation;
        return $geolocation;
    }

}
