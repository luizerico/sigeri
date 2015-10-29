<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="assetgroup")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("AssetGroup")
 */
class AssetGroup {

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
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"3"}})
     * @Annotation\Options({"label":"Name:"})
     *
     * @var string
     * @access protected
     */
    protected $name;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Textarea")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Description:"}) 
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $description;
    
    /**
     * @ORM\ManyToMany(targetEntity="Risk\Entity\Risk")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Risks:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Risk
     * @access protected
     */
    protected $risks;

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
     * @ORM\ManyToMany(targetEntity="Risk\Entity\Plan")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Plans"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Risk\Entity\Threat
     * @access protected
     */
    protected $plans;

    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\Asset")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Dependencies:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\Asset
     * @access protected
     */
    protected $dependencies;

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
        $this->risks = new ArrayCollection();
        $this->dependencies = new ArrayCollection();
        $this->documents = new ArrayCollection();
        $this->vulnerabilities = new ArrayCollection();
        $this->threaties = new ArrayCollection();
        $this->plans = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->risks = (isset($data ['risks'])) ? $data ['risks'] : null;
        $this->vulnerabilities = (isset($data ['vulnerabilities'])) ? $data ['vulnerabilities'] : null;
        $this->threaties = (isset($data ['threaties'])) ? $data ['threaties'] : null;
        $this->dependencies = (isset($data ['dependencies'])) ? $data ['dependencies'] : null;
        $this->documents = (isset($data ['documents'])) ? $data ['documents'] : null;
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

    public function addRisks(Collection $risks) {
        foreach ($risks as $risk) {
            $this->risks->add($risk);
        }
    }

    public function removeRisks(Collection $risks) {
        foreach ($risks as $risk) {
            $this->risks->removeElement($risk);
        }
    }

    public function getRisks() {
        return $this->risks;
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

    public function addDependencies(Collection $dependencies) {
        foreach ($dependencies as $dependency) {
            $this->dependencies->add($dependency);
        }
    }

    public function removeDependencies(Collection $dependencies) {
        foreach ($dependencies as $dependency) {
            $this->dependencies->removeElement($dependency);
        }
    }

    public function getDependencies() {
        return $this->dependencies;
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
