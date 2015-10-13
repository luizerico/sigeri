<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="planreview")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("PlanReview")
 */
class PlanReview {

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
     * @ORM\ManyToOne(targetEntity="User\Entity\User")
     * @ORM\JoinColumn(name="analyst_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required({"required":"False" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Analyst"})
     * @Annotation\Attributes({"style":"width:50%"})
     *
     * @var \User\Entity\User
     * @access protected
     */
    protected $analyst;

    /**
     * @ORM\ManyToOne(targetEntity="Risk\Entity\PlanStatus")
     * @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Status"})
     * @Annotation\Attributes({"style":"width:100%"})
     *
     * @var string
     * @access protected
     */
    protected $status;

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
     * @ORM\ManyToMany(targetEntity="Risk\Entity\Plan", mappedBy="revisions")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Plans"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Plan
     * @access protected
     */
    protected $plans;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;
    
    public function __construct() {        
        $this->plans = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->analyst = (isset($data ['analyst'])) ? $data ['analyst'] : null;
        $this->status = (isset($data ['status'])) ? $data ['status'] : null;
        $this->date = (isset($data ['date'])) ? $data ['date'] : null;
        $this->plans = (isset($data ['plans'])) ? $data ['plans'] : null;
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
    
    public function addPlans(Collection $plans) {
        foreach ($plans as $plan) {
            $this->plans->add($plan);
        }
    }

    public function removePlans(Collection $plans) {
        foreach ($plans as $plan) {
            $this->plans->removeElement($plan);
        }
    }

    public function getPlans() {
        return $this->plans;
    }

}
