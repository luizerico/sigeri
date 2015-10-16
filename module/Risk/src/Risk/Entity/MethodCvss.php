<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="methodcvss")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("MethodCvss")
 * 
 */
class MethodCvss extends Method {

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Number")
     * @Annotation\Required(true)
     * @Annotation\Options({"label":"Impact:"})
     * 
     * @var integer
     * @access protected
     */
    protected $impact;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Number")
     * @Annotation\Required(true)
     * @Annotation\Options({"label":"Likelihood"})
     * 
     * @var integer
     * @access protected
     */
    protected $likelihood;

    public function exchangeArray($data) {
        $this->likelihood = (isset($data ['likelihood'])) ? $data ['likelihood'] : null;
        $this->impact = (isset($data ['impact'])) ? $data ['impact'] : null;
    }

    public function getImpact() {
        return $this->impact;
    }

    public function setImpact($impact) {
        $this->impact = $impact;
        return $this;
    }

    public function getLikelihood() {
        return $this->likelihood;
    }

    public function setLikelihood($likelihood) {
        $this->likelihood = $likelihood;
        return $this;
    }

}
