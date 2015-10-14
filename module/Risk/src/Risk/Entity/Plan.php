<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="plan")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Plan")
 */
class Plan {

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
     * @ORM\ManyToOne(targetEntity="Risk\Entity\PlanStatus")
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
     * @ORM\ManyToOne(targetEntity="Risk\Entity\PlanStrategy")
     * @ORM\JoinColumn(name="strategy_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Strategy", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var string
     * @access protected
     */
    protected $strategy;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\PlanEffort")
     * @ORM\JoinColumn(name="effort_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Effort", "empty_option":"Please select..."})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var string
     * @access protected
     */
    protected $effort;

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
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Description"})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var string
     * @access protected
     */
    protected $description;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Annotations"})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var string
     * @access protected
     */
    protected $annotations;
    
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
     * @ORM\OneToMany(targetEntity="Risk\Entity\PlanReview", mappedBy="plan")
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
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->analyst = (isset($data ['analyst'])) ? $data ['analyst'] : null;
        $this->effort = (isset($data ['effort'])) ? $data ['effort'] : null;
        $this->strategy = (isset($data ['strategy'])) ? $data ['strategy'] : null;
        $this->status = (isset($data ['status'])) ? $data ['status'] : null;
        $this->date = (isset($data ['date'])) ? $data ['date'] : null;
        $this->annotations = (isset($data ['annotations'])) ? $data ['annotations'] : null;
        $this->revisions = (isset($data ['revisions'])) ? $data ['revisions'] : null;
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

    public function getAnalyst() {
        return $this->analyst;
    }

    public function setAnalyst(\User\Entity\User $analyst) {
        $this->analyst = $analyst;
        return $this;
    }

    public function getEffort() {
        return $this->effort;
    }

    public function setEffort(\Risk\Entity\PlanEffort $effort) {
        $this->effort = $effort;
        return $this;
    }

    public function getStrategy() {
        return $this->strategy;
    }

    public function setStrategy(\Risk\Entity\PlanStrategy $strategy) {
        $this->strategy = $strategy;
        return $this;
    }

    public function getStatus() {
        return $this->status;
    }

    public function setStatus(\Risk\Entity\PlanStatus $status) {
        $this->status = $status;
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

}
