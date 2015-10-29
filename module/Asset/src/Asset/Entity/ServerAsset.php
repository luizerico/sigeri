<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="serverasset")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("ServerAsset")
 *  
 */
class ServerAsset extends Asset {

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"IP"})
     * @Annotation\Options({"label":"IP Address:"})
     
     * @var string
     * @access protected
     */
    protected $ipaddress;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Services:"}) 
     *
     * @var string
     * @access protected
     */
    protected $services;

    public function __construct() {
        
    }

    public function exchangeArray($data) {
        $this->ipaddress = (isset($data ['ipaddress'])) ? $data ['ipaddress'] : null;
        $this->services = (isset($data ['services'])) ? $data ['services'] : null;
    }

    public function __toString() {
        return sprintf('%s', $this->getName());
    }

    public function getIpaddress() {
        return $this->ipaddress;
    }

    public function setIpaddress($ipaddress) {
        $this->ipaddress = $ipaddress;
        return $ipaddress;
    }

    public function getServices() {
        return $this->services;
    }

    public function setServices($services) {
        $this->services = $services;
        return $services;
    }

}
