<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="threat")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Threat")
 */
class Threat {

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
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"3"}})
     * @Annotation\Options({"label":"Name:"})
     *
     * @var string
     * @access protected
     */
    protected $name;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\ThreatLevel")
     * @ORM\JoinColumn(name="level_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Level:", "empty_option":"Please select..."})
     *
     * @var \Risk\Entity\ThreatLevel
     * @access protected
     */
    protected $level;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\ThreatType")
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Type:", "empty_option":"Please select..."})
     *
     * @var \Risk\Entity\ThreatType
     * @access protected
     */
    protected $type;

    /**
     * @ORM\ManyToOne(targetEntity="User\Entity\User")
     * @ORM\JoinColumn(name="analyst_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Analyst:", "empty_option":"Please select..."})
     *
     * @var \User\Entity\User
     * @access protected
     */
    protected $analyst;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Checkbox")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Deliberate:"})
     * 
     * @var boolean
     * @access protected
     * 
     */
    protected $deliberate;
    
    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Checkbox")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Accidental:"})
     * 
     * @var boolean
     * @access protected
     * 
     */
    protected $accidental;
    
    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Checkbox")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Environmental:"})
     * 
     * @var boolean
     * @access protected
     * 
     */
    protected $environmental;

    /**
     * @ORM\ManyToMany(targetEntity="Risk\Entity\ThreatSource")
     * @ORM\JoinColumn(name="source_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Source:"}) 
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\ThreatSource
     * @access protected
     */
    protected $sources;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Textarea")
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
     * @Annotation\Type("Zend\Form\Element\Textarea")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Annotations:"})     
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $annotations;

    /**
     * @ORM\ManyToMany(targetEntity="Document\Entity\Document")
     * @ORM\JoinColumn(name="documents_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Documents:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Document\Entity\Document
     * @access protected
     */
    protected $documents;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     */
    protected $submit;

    public function __construct() {
        $this->documents = new ArrayCollection();
        $this->sources = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->level = (isset($data ['level'])) ? $data ['level'] : null;
        $this->type = (isset($data ['type'])) ? $data ['type'] : null;
        $this->sources = (isset($data ['sources'])) ? $data ['sources'] : null;
        $this->analyst = (isset($data ['analyst'])) ? $data ['analyst'] : null;
        $this->deliberate = (isset($data ['deliberate'])) ? $data ['deliberate'] : null;
        $this->accidental = (isset($data ['accidental'])) ? $data ['accidental'] : null;
        $this->environmental = (isset($data ['environmental'])) ? $data ['environmental'] : null;
        $this->annotations = (isset($data ['annotations'])) ? $data ['annotations'] : null;
        $this->documents = (isset($data ['documents'])) ? $data ['documents'] : null;
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

    public function getDescription() {
        return $this->description;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function getLevel() {
        return $this->level;
    }

    public function setLevel(\Risk\Entity\ThreatLevel $level) {
        $this->level = $level;
        return $this;
    }

    public function getType() {
        return $this->type;
    }

    public function setType(\Risk\Entity\ThreatType $type) {
        $this->type = $type;
        return $this;
    }

    public function getAnalyst() {
        return $this->analyst;
    }

    public function setAnalyst(\User\Entity\User $analyst) {
        $this->analyst = $analyst;
        return $this;
    }
    
    public function getDeliberate() {
        return $this->deliberate;
    }

    public function setDeliberate($deliberate) {
        $this->deliberate = $deliberate;
        return $this;
    }
    
    public function getAccidental() {
        return $this->accidental;
    }

    public function setAccidental($accidental) {
        $this->accidental = $accidental;
        return $this;
    }
    
    public function getEnvironmental() {
        return $this->environmental;
    }

    public function setEnvironmental($environmental) {
        $this->environmental = $environmental;
        return $this;
    }

    public function getAnnotations() {
        return $this->annotations;
    }

    public function setAnnotations($annotations) {
        $this->annotations = $annotations;
        return $this;
    }

    public function addSources(Collection $sources) {
        foreach ($sources as $source) {
            $this->sources->add($source);
        }
    }

    public function removeSources(Collection $sources) {
        foreach ($sources as $source) {
            $this->sources->removeElement($source);
        }
    }

    public function getSources() {
        return $this->sources;
    }

    public function addDocuments(Collection $documents) {
        foreach ($documents as $document) {
            $this->documents->add($document);
        }
    }

    public function removeDocuments(Collection $documents) {
        foreach ($documents as $document) {
            $this->documents->removeElement($document);
        }
    }

    public function getDocuments() {
        return $this->documents;
    }

}
