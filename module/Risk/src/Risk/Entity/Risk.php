<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity
 * @ORM\Table(name="risk")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Risk") 
 * @ORM\HasLifecycleCallbacks
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

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\Likelihood")
     * @ORM\JoinColumn(name="likelihood_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Likelihood", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var \Risk\Entity\Likelihood
     * @access protected
     */
    protected $likelihood;

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
//    protected $date;

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
     * @ORM\ManyToMany(targetEntity="Risk\Entity\Vulnerability")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Vulnerabilities"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Vulnerability
     * @access protected
     */
    protected $vulnerabilities;

    /**
     * @ORM\ManyToMany(targetEntity="Risk\Entity\Threat")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Threaties"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Threat
     * @access protected
     */
    protected $threaties;

    /**
     * @ORM\ManyToMany(targetEntity="\Risk\Entity\Compliance")
     * @ORM\JoinColumn(name="compliance_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Compliance:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Control
     * @access protected
     */
    protected $compliance;

    /**
     * @ORM\ManyToMany(targetEntity="\Risk\Entity\Control")
     * @ORM\JoinColumn(name="control_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Control:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Control
     * @access protected
     */
    protected $controls;

    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\Asset")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Assets"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\Asset
     * @access protected
     */
    protected $assets;

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
     * @var \DateTime $created
     *
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $created;

    /**
     * @var \DateTime $updated
     *
     * @Gedmo\Timestampable(on="update")
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updated;

    /**
     * @var \DateTime $contentChanged
     *
     * @ORM\Column(name="content_changed", type="datetime", nullable=true)
     * @Gedmo\Timestampable(on="change", field={"name", "status", "type", "likelihood", "impact", "analyst"})
     */
    private $contentChanged;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;

    public function __construct() {
        $this->documents = new ArrayCollection();
        $this->controls = new ArrayCollection();
        $this->compliance = new ArrayCollection();
        $this->vulnerabilities = new ArrayCollection();
        $this->threaties = new ArrayCollection();
        $this->assets = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ["id"])) ? $data ["id"] : null;
        $this->name = (isset($data ["name"])) ? $data ["name"] : null;
        $this->status = (isset($data ["status"])) ? $data ["status"] : null;
        $this->description = (isset($data ["description"])) ? $data ["description"] : null;
        $this->likelihood = (isset($data ["likelihood"])) ? $data ["likelihood"] : null;
        $this->impact = (isset($data ["impact"])) ? $data ["impact"] : null;
        $this->detimpact = (isset($data ["detimpact"])) ? $data ["detimpact"] : null;
        $this->type = (isset($data ["type"])) ? $data ["type"] : null;
        $this->analyst = (isset($data ["analyst"])) ? $data ["analyst"] : null;
        $this->date = (isset($data ["date"])) ? $data ["date"] : null;
        $this->annotations = (isset($data ["annotations"])) ? $data ["annotations"] : null;
        $this->documents = (isset($data ["documents"])) ? $data ["documents"] : null;
        $this->controls = (isset($data ["controls"])) ? $data ["controls"] : null;
        $this->compliance = (isset($data ["compliance"])) ? $data ["compliance"] : null;
        $this->vulnerabilities = (isset($data ["vulnerabilities"])) ? $data ["vulnerabilities"] : null;
        $this->threaties = (isset($data ["threaties"])) ? $data ["threaties"] : null;
        $this->assets = (isset($data ["assets"])) ? $data ["assets"] : null;

        $this->method = (isset($data ["method"])) ? $data ["method"] : null;
    }

    public function __toString() {
        return sprintf("%s", $this->getName());
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

    public function getLikelihood() {
        return $this->likelihood;
    }

    public function setLikelihood(\Risk\Entity\Likelihood $likelihood) {
        $this->likelihood = $likelihood;
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
        return $this->date->format("d/m/Y");
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

//    public function addCompliance(Collection $compliance) {
//        foreach ($compliance as $regulation) {
//            $this->compliance->add($regulation);
//        }
//    }
//
//    public function removeCompliance(Collection $compliance) {
//        foreach ($compliance as $regulation) {
//            $this->compliance->removeElement($regulation);
//        }
//    }

    public function getCompliance() {
        return $this->compliance;
    }

    // TEMP FUNCTIONS
    public function setControls($controls) {
        $this->controls = $controls;
        return $this;
    }

    public function setCompliance($compliance) {
        $this->compliance = $compliance;
        return $this;
    }

    public function addVulnerabilities(Collection $vulnerabilities) {
        foreach ($vulnerabilities as $vulnerability) {
            $this->vulnerabilities->add($vulnerability);
        }
    }

    public function removeVulnerabilities(Collection $vulnerabilities) {
        foreach ($vulnerabilities as $vulnerability) {
            $this->vulnerabilities->removeElement($vulnerability);
        }
    }

    public function getVulnerabilities() {
        return $this->vulnerabilities;
    }

    public function addThreaties(Collection $threaties) {
        foreach ($threaties as $threat) {
            $this->threaties->add($threat);
        }
    }

    public function removeThreaties(Collection $threaties) {
        foreach ($threaties as $threat) {
            $this->threaties->removeElement($threat);
        }
    }

    public function getThreaties() {
        return $this->threaties;
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

    public function addAssets(Collection $assets) {
        foreach ($assets as $asset) {
            $this->assets->add($asset);
        }
    }

    public function removeAssets(Collection $assets) {
        foreach ($assets as $asset) {
            $this->assets->removeElement($asset);
        }
    }

    public function getAssets() {
        return $this->assets;
    }

    public function getAssetSumValue() {
        $sum = 0;
        foreach ($this->getAssets() as $asset) {
            $sum += $asset->getRelevance()->getValue();
        }
        return $sum;
    }

    public function getCreated() {
        return $this->created;
    }

    public function getUpdated() {
        return $this->updated;
    }

    public function getContentChanged() {
        return $this->contentChanged;
    }
    
    /** @ORM\PostUpdate */
    public function postUpdate(){
        
    }
    
    /** @ORM\PreUpdate */
    public function preUpdate(){
        
    }
}
