<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="asset")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Asset")
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
	 * @Annotation\Required({"required":"true" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
	 * @Annotation\Options({"label":"Name:"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $name;
	
	/**
	 * @ORM\Column(type="text", nullable=true)
	 * @Annotation\Type("Zend\Form\Element\Text")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
	 * @Annotation\Options({"label":"Description:"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $description;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Asset\Entity\AssetType")
	 * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"true" })
	 * @Annotation\Attributes({"element.style":"width:100px"})
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Type:"})
	 *
	 * @var \Asset\Entity\AssetType
	 * @access protected
	 */
	protected $type;
		
	/**
	 * @ORM\ManyToOne(targetEntity="User\Entity\User")
	 * @ORM\JoinColumn(name="analyst_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Analyst:"})
	 *
	 * @var \User\Entity\User
	 * @access protected
	 */
	protected $analyst;
	
	/**
	 * @ORM\ManyToOne(targetEntity="User\Entity\Unit")
	 * @ORM\JoinColumn(name="unit_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Unit:"})
	 *
	 * @var \User\Entity\Unit
	 * @access protected
	 */
	protected $unit;
	
	/**
	 * @ORM\ManyToMany(targetEntity="Risk\Entity\Risk")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Risks:"})
	 * @Annotation\Attributes({"multiple":"multiple"})
	 *
	 * @var \Risk\Entity\Risk
	 * @access protected
	 */
	protected $risks;
	
	/**
	 * @ORM\ManyToMany(targetEntity="Asset\Entity\Asset")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
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
	 * @Annotation\Required({"required":"true" })
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
	 * @Annotation\Required({"required":"false" })
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
	
	public function __construct(){
		$this->risks = new ArrayCollection();
		$this->dependencies = new ArrayCollection();
		$this->documents = new ArrayCollection();
	}
	public function exchangeArray($data) {
		$this->id = (isset ( $data ['id'] )) ? $data ['id'] : null;
		$this->name = (isset ( $data ['name'] )) ? $data ['name'] : null;
		$this->description = (isset ( $data ['description'] )) ? $data ['description'] : null;
		$this->type = (isset ( $data ['type'] )) ? $data ['type'] : null;
		$this->manager = (isset ( $data ['manager'] )) ? $data ['manager'] : null;
		$this->analyst = (isset ( $data ['analyst'] )) ? $data ['analyst'] : null;
		$this->risks = (isset ( $data ['risks'] )) ? $data ['risks'] : null;
		$this->dependencies = (isset ( $data ['dependencies'] )) ? $data ['dependencies'] : null;
		$this->documents = (isset ( $data ['documents'] )) ? $data ['documents'] : null;
	}
	public function __toString() {
		return sprintf ( '%s', $this->getName () );
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
	}*/
	
	public function addRisks(Collection $risks) {
		foreach($risks as $risk){
			$this->risks->add($risk);
		}
	}
	public function removeRisks(Collection $risks) {
	foreach($risks as $risk){
			$this->risks->removeElement($risk);
		}
	}
	public function getRisks() {
		return $this->risks;
	}
	
	public function addDependencies(Collection $dependencies) {
		foreach($dependencies as $dependency){
			$this->dependencies->add($dependency);
		}
	}
	public function removeDependencies(Collection $dependencies) {
		foreach($dependencies as $dependency){
			$this->dependencies->removeElement($dependency);
		}
	}
	public function getDependencies() {
		return $this->dependencies;
	}	
	
	public function addDocuments(Collection $documents) {
		foreach($documents as $document){
			$this->documents->add($document);
		}
	}
	public function removeDocuments(Collection $documents) {
		foreach($documents as $document){
			$this->documents->removeElement($document);
		}
	}
	public function getDocuments() {
		return $this->documents;
	}	
}