<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="compliancerule")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("ComplianceRule")
 */
class ComplianceRule {

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
     * @ORM\ManyToOne(targetEntity="Risk\Entity\Compliance")
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Compliance", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \Risk\Entity\Compliance
     * @access protected
     */
    protected $name;    

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Rule"})
     * @Annotation\Attributes({"style":"width:100%"}) // Define the size in html code
     *
     * @var string
     * @access protected
     */
    protected $rule;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\ComplianceType")
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Type", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \Risk\Entity\ComplianceType
     * @access protected
     */
    protected $type;    

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\TextArea")
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
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\TextArea")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Annotations"})
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $annotations;     

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;
    
    public function __construct() {
        $this->revisions = new ArrayCollection();
        $this->documents = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;        
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->rule = (isset($data ['rule'])) ? $data ['rule'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->annotations = (isset($data ['annotations'])) ? $data ['annotations'] : null; 
    }

    public function __toString() {
        return sprintf('%s', $this->getName());
    }

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function getName() {
        return $this->name;
    }

    public function setName($name) {
        $this->name = $name;
        return $this;
    }

    public function getRule() {
        return $this->rule;
    }

    public function setRule($rule) {
        $this->rule = $rule;
        return $this;
    }
    
     public function setType(\Risk\Entity\ComplianceType $type) {
        $this->type = $type;
        return $this;
    }

    public function getType() {
        return $this->type;
    }

    public function getDescription() {
        return $this->description;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }
    
    public function getAnnotations() {
        return $this->annotations;
    }

    public function setAnnotations($annotations) {
        $this->annotations = $annotations;
        return $this;
    }
    

}
