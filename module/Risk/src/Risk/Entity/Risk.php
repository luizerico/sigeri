<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterInterface;
use Zend\InputFilter\InputFilterAwareInterface;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Persistence\ObjectManager;


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
	 * @Annotation\Required({"required":"true" })
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
	 * @ORM\Column(type="text", nullable=true)
	 * @Annotation\Type("Zend\Form\Element\Text")
	 * @Annotation\Required({"required":"false" })
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
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\Probability")
	 * @ORM\JoinColumn(name="probability_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Probability"})
	 * @Annotation\Attributes({"style":"width:50%"})
	 *
	 * @var \Risk\Entity\Probability
	 * @access protected
	 */
	protected $probability;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\Impact")
	 * @ORM\JoinColumn(name="impact_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Impact"})
	 * @Annotation\Attributes({"style":"width:50%"})
	 *
	 * @var \Risk\Entity\Impact
	 * @access protected
	 */
	protected $impact;
	
	/**
	 * @ORM\Column(type="text", nullable=true)
	 * @Annotation\Type("Zend\Form\Element\Text")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
	 * @Annotation\Options({"label":"Impact Detail"})
	 * @Annotation\Attributes({"style":"width:100%"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $detimpact;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\Vulnerability")
	 * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Vulnerability"})
	 * @Annotation\Attributes({"style":"width:50%"})
	 *
	 * @var \Risk\Entity\Vulnerability
	 * @access protected
	 */
	protected $vulnerability;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\Threat")
	 * @ORM\JoinColumn(name="threat_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Threat"})
	 * @Annotation\Attributes({"style":"width:50%"})
	 *
	 * @var \Risk\Entity\Threat
	 * @access protected
	 */
	protected $threat;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\RiskType")
	 * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Type"})
	 * @Annotation\Attributes({"style":"width:50%"})
	 *
	 * @var \Risk\Entity\RiskType
	 * @access protected
	 */	
	protected $type;
	
	protected $controls;
	
	protected $actions;
	
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
	 * @ORM\Column(type="date")
	 * @Annotation\Type("Zend\Form\Element\Date")
	 * @Annotation\Required({"required":"false" })
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
	 * @Annotation\Type("Zend\Form\Element\Text")
	 * @Annotation\Required({"required":"false" })
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
	 * @Annotation\Type("Zend\Form\Element\Submit")
	 * @Annotation\Attributes({"value":"Submit"})
	 * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
	 */
	protected $submit;
	
	public function exchangeArray($data) {
		$this->id = (isset ( $data ['id'] )) ? $data ['id'] : null;
		$this->name = (isset ( $data ['name'] )) ? $data ['name'] : null;
		$this->description = (isset ( $data ['description'] )) ? $data ['description'] : null;
		$this->probability = (isset ( $data ['probability'] )) ? $data ['probability'] : null;
		$this->impact = (isset ( $data ['impact'] )) ? $data ['impact'] : null;
		$this->detimpact = (isset ( $data ['detimpact'] )) ? $data ['detimpact'] : null;
		$this->vulnerability = (isset ( $data ['vulnerability'] )) ? $data ['vulnerability'] : null;
		$this->threat = (isset ( $data ['threat'] )) ? $data ['threat'] : null;
		$this->type = (isset ( $data ['type'] )) ? $data ['type'] : null;
		$this->analyst = (isset ( $data ['analyst'] )) ? $data ['analyst'] : null;
		$this->date = (isset ( $data ['date'] )) ? $data ['date'] : null;
		$this->annotations = (isset ( $data ['annotations'] )) ? $data ['annotations'] : null;
		}
	public function __toString(){
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
	public function getVulnerability() {
		return $this->vulnerability;
	}
	public function setVulnerability(\Risk\Entity\Vulnerability $vulnerability) {
		$this->vulnerability = $vulnerability;
		return $this;
	}
	public function getThreat() {
		return $this->threat;
	}
	public function setThreat(\Risk\Entity\Threat $threat) {
		$this->threat = $threat;
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
	
}
	
