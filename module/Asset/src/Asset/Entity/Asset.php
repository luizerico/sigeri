<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="asset")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Asset")
 * 
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="discr", type="string")
 * @ORM\DiscriminatorMap({"asset"="Asset" ,
 *                          "serverasset" = "ServerAsset", 
 *                          "locationasset" = "LocationAsset", 
 *                          "serviceasset"="ServiceAsset",
 *                          "processasset" = "ProcessAsset"})
 */
class Asset {

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
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Description:"}) 
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $description;

    /**
     * @ORM\ManyToOne(targetEntity="Asset\Entity\AssetType")
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Attributes({"element.style":"width:100px"})
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Type:", "empty_option":"Please select..."})
     *
     * @var \Asset\Entity\AssetType
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
     * @ORM\ManyToOne(targetEntity="User\Entity\Unit")
     * @ORM\JoinColumn(name="unit_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Unit:", "empty_option":"Please select..."})
     *
     * @var \User\Entity\Unit
     * @access protected
     */
    protected $unit;
    
    /**
     * @ORM\ManyToOne(targetEntity="Asset\Entity\AssetRelevance")
     * @ORM\JoinColumn(name="value_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Relevance:", "empty_option":"Please select..."})
     *
     * @var \Asset\Entity\AssetRelevance
     * @access protected
     */
    protected $relevance;
    
    
    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\Consequence")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Consequences:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @access protected
     */
    protected $consequences;

    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\AssetGroup")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Groups:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @access protected
     */
    protected $groups;

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
//    protected $risks;    

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

    /*
      /**
     * @ORM\ManyToOne(targetEntity="Asset\Entity\AssetType", cascade={"all"})
     * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(true)
     * @Annotation\Attributes({"element.style":"width:100px"})
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Relevance:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\AssetType
     * @access protected

      protected $relevance;
     */

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
        $this->groups = new ArrayCollection();
        $this->risks = new ArrayCollection();
        $this->dependencies = new ArrayCollection();
        $this->documents = new ArrayCollection();
        $this->plans = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->type = (isset($data ['type'])) ? $data ['type'] : null;
        $this->analyst = (isset($data ['analyst'])) ? $data ['analyst'] : null;        
        $this->unit = (isset($data ['unit'])) ? $data ['unit'] : null;
        $this->relevance = (isset($data ['relevance'])) ? $data ['relevance'] : null;
        $this->groups = (isset($data ['groups'])) ? $data ['groups'] : null;
        $this->risks = (isset($data ['risks'])) ? $data ['risks'] : null;
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

    public function getType() {
        return $this->type;
    }

    public function setType(\Asset\Entity\AssetType $type) {
        $this->type = $type;
        return $this;
    }

    public function getUnit() {
        return $this->unit;
    }

    public function setUnit(\User\Entity\Unit $unit) {
        $this->unit = $unit;
        return $this;
    }
    
    public function getRelevance() {
        return $this->relevance;
    }

    public function setRelevance(\Asset\Entity\AssetValue $relevance) {
        $this->relevance = $relevance;
        return $this;
    }

    public function getAnalyst() {
        return $this->analyst;
    }

    public function setAnalyst(\User\Entity\User $analyst) {
        $this->analyst = $analyst;
        return $this;
    }

    /*
      public function getRelevance() {
      return $this->relevance;
      }
      public function setRelevance($relevance) {
      $this->relevance = $relevance;
      return $this;
      } */

    public function addGroups(Collection $groups) {
        foreach ($groups as $group) {
            $this->groups->add($group);
        }
    }

    public function removeGroups(Collection $groups) {
        foreach ($groups as $group) {
            $this->groups->removeElement($group);
        }
    }

    public function getGroups() {
        return $this->groups;
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

    public function getDescr() {
        switch (get_class($this)) {
            case "Asset\Entity\ServerAsset":
                return "server";
            case "Asset\Entity\ServiceAsset":
                return "service";
            case "Asset\Entity\ProcessAsset":
                return "process";
            case "Asset\Entity\LocationAsset":
                return "location";
            case "Asset\Entity\Asset":
                return "Asset";
            default :
                return 'What is this?';
        }
    }

}
