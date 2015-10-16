<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="method")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Method")
 * 
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="discr", type="string")
 * @ORM\DiscriminatorMap({"cvss" = "MethodCvss", "owasp" = "MethodOwasp"})
 */
class Method {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     * @Annotation\Options({"label":"Id:"})
     * @Annotation\Exclude()
     *
     * @var integer
     * @access protected
     */
    protected $id;
         

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\Risk", inversedBy="revisions")
     * @ORM\JoinColumn(name="risk_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Risk", "empty_option":"Please select..."})  
     *
     * @var string
     * @access protected
     */
    protected $risk;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Number")
     * @Annotation\Required(true)
     * @Annotation\Options({"label":"Value:"})
     * 
     * @var integer
     * @access protected
     */
    protected $value;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->risk = (isset($data ['risk'])) ? $data ['risk'] : null;
        $this->value = (isset ( $data ['value'] )) ? $data ['value'] : null;
        $this->discr = (isset ( $data ['discr'] )) ? $data ['discr'] : null;
    }

    public function __toString() {
        return sprintf('%s', $this->getDescription());
    }

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function getRisk() {
        return $this->risk;
    }

    public function setRisk(\Risk\Entity\Risk $risk) {
        $this->risk = $risk;
        return $this;
    }

    public function getValue() {
        return $this->value;
    }

    public function setValue($value) {
        $this->value = $value;
        return $this;
    }
    
    public function getDiscr() {
        return $this->discr;
    }

    public function setDiscr($discr) {
        $this->discr = $discr;
        return $this;
    }

}
