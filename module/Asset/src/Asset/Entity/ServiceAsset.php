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

    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\ProcessAsset")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Process:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\ProcessAsset
     * @access protected
     */
    protected $process;

    public function __construct() {
        
    }

    public function exchangeArray($data) {        
        $this->process = (isset($data ['process'])) ? $data ['process'] : null;
    }

    public function __toString() {
        return sprintf('%s', $this->getName());
    }   

    public function addProcess(Collection $process) {
        foreach ($process as $dependency) {
            $this->process->add($dependency);
        }
    }

    public function removeProcess(Collection $process) {
        foreach ($process as $dependency) {
            $this->process->removeElement($dependency);
        }
    }

    public function getProcess() {
        return $this->process;
    }

}
