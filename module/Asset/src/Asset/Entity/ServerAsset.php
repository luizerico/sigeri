<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

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
     * @ORM\ManyToMany(targetEntity="Asset\Entity\ServiceAsset")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Options({"label":"Service:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\ServiceAsset
     * @access protected
     */
    protected $services;

    public function __construct() {
         $this->services = new ArrayCollection();
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

    public function addServices(Collection $services) {
        foreach ($services as $dependency) {
            $this->services->add($dependency);
        }
    }

    public function removeServices(Collection $services) {
        foreach ($services as $dependency) {
            $this->services->removeElement($dependency);
        }
    }

    public function getServices() {
        return $this->services;
    }

}
