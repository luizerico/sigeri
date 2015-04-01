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
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\ThreatLevel")
	 * @ORM\JoinColumn(name="level_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Level:"})
	 *
	 * @var \Risk\Entity\ThreatLevel
	 * @access protected
	 */
	protected $level;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\ThreatType")
	 * @ORM\JoinColumn(name="type_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Type:"})
	 *
	 * @var \Risk\Entity\ThreatType
	 * @access protected
	 */
	protected $type;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Risk\Entity\ThreatSource")
	 * @ORM\JoinColumn(name="source_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Source:"})
	 *
	 * @var \Risk\Entity\ThreatSource
	 * @access protected
	 */
	protected $source;
	
	/**
	 * @ORM\ManyToOne(targetEntity="User\Entity\User")
	 * @ORM\JoinColumn(name="analyst_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Analyst:"})
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
	 * @Annotation\Options({"label":"Registry Date:"})
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
	 * @Annotation\Options({"label":"Annotations:"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $annotations;
	
	/**
	 * @Annotation\Type("Zend\Form\Element\Submit")
	 * @Annotation\Attributes({"value":"Submit"})
	 */
	protected $submit;
	public function exchangeArray($data) {
		$this->id = (isset ( $data ['id'] )) ? $data ['id'] : null;
		$this->name = (isset ( $data ['name'] )) ? $data ['name'] : null;
		$this->description = (isset ( $data ['description'] )) ? $data ['description'] : null;
		$this->level = (isset ( $data ['level'] )) ? $data ['level'] : null;
		$this->type = (isset ( $data ['type'] )) ? $data ['type'] : null;
		$this->source = (isset ( $data ['source'] )) ? $data ['source'] : null;
		$this->analyst = (isset ( $data ['analyst'] )) ? $data ['analyst'] : null;
		$this->date = (isset ( $data ['date'] )) ? $data ['date'] : null;
		$this->annotations = (isset ( $data ['annotations'] )) ? $data ['annotations'] : null;
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
	public function getSource() {
		return $this->source;
	}
	public function setSource(\Risk\Entity\ThreatSource $source) {
		$this->source = $source;
		return $this;
	}
	public function getAnalyst() {
		return $this->analyst;
	}
	public function setAnalyst(\User\Entity\User $analyst) {
		$this->analyst = $analyst;
		return $this;
	}
	public function getDate() {
		return $this->date;
	}
	public function getFormatedDate() {
		return $this->date->format('d/m/Y');
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
}
	
