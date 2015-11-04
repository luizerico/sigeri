<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="risk")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Risk")
 */
class Risk {

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
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Name"})
     * @Annotation\Attributes({"style":"width:100%"}) // Define the size in html code
     *
     * @var string
     * @access protected
     */
    protected $name;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\RiskStatus")
     * @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Status", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var string
     * @access protected
     */
    protected $status;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\RiskType")
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Type", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \Risk\Entity\RiskType
     * @access protected
     */
    protected $type;
    
    /**
     * @ORM\OneToMany(targetEntity="Risk\Entity\Method", mappedBy="risk")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Method"})
     *
     * @var \Risk\Entity\Method
     * @access protected
     */
    protected $method;

//    /**
//     * @ORM\OneToOne(targetEntity="Risk\Entity\Method", inversedBy="risk", cascade={"persist"})
//     * @ORM\JoinColumn(name="method_id", referencedColumnName="id", unique=false, nullable=true)
//     * @Annotation\Required(false)
//     */
//    protected $method;

//    /**
//     * @ORM\ManyToOne(targetEntity="Risk\Entity\RiskMethod")
//     * @ORM\JoinColumn(name="method_id", referencedColumnName="id")
//     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
//     * @Annotation\Required(true)
//     * @Annotation\Filter({"name":"StripTags"})
//     * @Annotation\Options({"label":"Method", "empty_option":"Please select..."})
//     * @Annotation\Attributes({"style":"width:100%", "id":"method"})
//     *
//     * @var string
//     * @access protected
//     *
//     * @var type 
//     */
//    protected $method;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\Probability")
     * @ORM\JoinColumn(name="probability_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Probability", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \Risk\Entity\Probability
     * @access protected
     */
    protected $probability;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\Impact")
     * @ORM\JoinColumn(name="impact_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Impact", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \Risk\Entity\Impact
     * @access protected
     */
    protected $impact;

    /**
     * @ORM\ManyToOne(targetEntity="User\Entity\User")
     * @ORM\JoinColumn(name="analyst_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Analyst", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \User\Entity\User
     * @access protected
     */
    protected $analyst;

    /**
     * @ORM\Column(type="date")
     * @Annotation\Type("Zend\Form\Element\DateTime")
     * @Annotation\Required(true)
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
     * @Annotation\Options({"label":"Annotations"})
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $annotations;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Textarea")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Impact Detail"})
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $detimpact;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Textarea")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Control Regulation"})
     *
     * @var string
     * @access protected
     */
    protected $regulations;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Controls"})
     *
     * @var string
     * @access protected
     */
    protected $controls;

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
     * @ORM\OneToMany(targetEntity="Risk\Entity\RiskReview", mappedBy="risk")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Revisions"})
     *
     * @var \Risk\Entity\PlanReview
     * @access protected
     */
    protected $revisions;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;

    public function __construct() {
        $this->revisions = new ArrayCollection();
        $this->documents = new ArrayCollection();
        $this->controls = new ArrayCollection();
        $this->regulations = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->status = (isset($data ['status'])) ? $data ['status'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->probability = (isset($data ['probability'])) ? $data ['probability'] : null;
        $this->impact = (isset($data ['impact'])) ? $data ['impact'] : null;
        $this->detimpact = (isset($data ['detimpact'])) ? $data ['detimpact'] : null;
        $this->type = (isset($data ['type'])) ? $data ['type'] : null;
        $this->analyst = (isset($data ['analyst'])) ? $data ['analyst'] : null;
        $this->date = (isset($data ['date'])) ? $data ['date'] : null;
        $this->annotations = (isset($data ['annotations'])) ? $data ['annotations'] : null;
        $this->revisions = (isset($data ['revisions'])) ? $data ['revisions'] : null;
        $this->documents = (isset($data ['documents'])) ? $data ['documents'] : null;
        $this->controls = (isset($data ['controls'])) ? $data ['controls'] : null;
        $this->regulations = (isset($data ['regulations'])) ? $data ['regulations'] : null;

        $this->method = (isset($data ['method'])) ? $data ['method'] : null;
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

    public function getStatus() {
        return $this->status;
    }

    public function setStatus(\Risk\Entity\RiskStatus $status) {
        $this->status = $status;
        return $this;
    }

    public function getDescription() {
        return $this->description;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function getProbability() {
        return $this->probability;
    }

    public function setProbability(\Risk\Entity\Probability $probability) {
        $this->probability = $probability;
        return $this;
    }

    public function getImpact() {
        return $this->impact;
    }

    public function setImpact(\Risk\Entity\Impact $impact) {
        $this->impact = $impact;
        return $this;
    }

    public function getType() {
        return $this->type;
    }

    public function setType(\Risk\Entity\RiskType $type) {
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

    public function getAnnotations() {
        return $this->annotations;
    }

    public function setAnnotations($annotations) {
        $this->annotations = $annotations;
        return $this;
    }

    public function getDetimpact() {
        return $this->detimpact;
    }

    public function setDetimpact($detimpact) {
        $this->detimpact = $detimpact;
        return $this;
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

    public function addRevisions(Collection $revisions) {
        foreach ($revisions as $revision) {
            $this->revisions->add($revision);
        }
    }

    public function removeRevisions(Collection $revisions) {
        foreach ($revisions as $revision) {
            $this->revisions->removeElement($revision);
        }
    }

    public function getRevisions() {
        return $this->revisions;
    }

    public function addControls(Collection $controls) {
        foreach ($controls as $control) {
            $this->acontrols->add($control);
        }
    }

    public function removeControls(Collection $controls) {
        foreach ($controls as $control) {
            $this->controls->removeElement($control);
        }
    }

    public function getControls() {
        return $this->controls;
    }

//    public function addRegulations(Collection $regulations) {
//        foreach ($regulations as $regulation) {
//            $this->regulations->add($regulation);
//        }
//    }
//
//    public function removeRegulations(Collection $regulations) {
//        foreach ($regulations as $regulation) {
//            $this->regulations->removeElement($regulation);
//        }
//    }

    public function getRegulations() {
        return $this->regulations;
    }

    // TEMP FUNCTIONS
    public function setControls($controls) {
        $this->controls = $controls;
        return $this;
    }

    public function setRegulations($regulations) {
        $this->regulations = $regulations;
        return $this;
    }

//    public function addMethod(Collection $methods) {
//        foreach ($methods as $method) {
//            $this->method->add($method);
//        }
//    }
//
//    public function removeMethod(Collection $methods) {
//        foreach ($methods as $method) {
//            $this->method->removeElement($method);
//        }
//    }

    public function getMethod() {
        return $this->method;
    }

}
