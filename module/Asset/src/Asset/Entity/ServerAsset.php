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
    

    public function __construct() {
        
    }

    public function exchangeArray($data) {
        $this->ipaddress = (isset($data ['ipaddress'])) ? $data ['ipaddress'] : null;        
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
}
