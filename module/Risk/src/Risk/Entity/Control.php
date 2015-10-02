<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;


/**
 * @ORM\Entity
 * @ORM\Table(name="control")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Control")
 */
class Control {
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
	 * @Annotation\Type("Zend\Form\Element\Select")
	 * @Annotation\Required({"required":"true" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Status"})
	 * @Annotation\Attributes({"options":{"Active","Inactive"}, "style":"width:100%"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $status;
        
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
        public function getStatus() {
		return $this->status;
	}
	public function setStatus($status) {
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
	