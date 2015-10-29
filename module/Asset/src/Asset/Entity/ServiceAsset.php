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
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Process:"}) 
     *
     * @var string
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

    public function getProcess() {
        return $this->process;
    }

    public function setProcess($process) {
        $this->process = $process;
        return $process;
    }

}
