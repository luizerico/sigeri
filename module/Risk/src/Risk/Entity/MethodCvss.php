<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="methodcvss")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("MethodCvss")
 */
class MethodCvss {

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
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Description"})
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $description;

    /**
     * @ORM\Column(type="date")
     * @Annotation\Type("Zend\Form\Element\Date")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength"})
     * @Annotation\Options({"label":"Registered"})
     * @Annotation\Attributes({"style":"width:50%"})
     *
     * @var string
     * @access protected
     */
    protected $date;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;
    

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;        
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->date = (isset($data ['date'])) ? $data ['date'] : null;
        $this->risk = (isset($data ['risk'])) ? $data ['risk'] : null;
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

    public function getDescription() {
        return $this->description;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function getFormatedDate() {
        return $this->date->format('d/m/Y');
    }

    public function getDate() {
        return $this->date;
    }

    public function setDate($date) {
        $this->date = $date;
        return $this;
    }
    
    public function getRisk() {
        return $this->risk;
    }
    
    public function setRisk(\Risk\Entity\Risk $risk) {
        $this->risk = $risk;
        return $this;
    }

}
