<?php
namespace User\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="unit")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Unit")
 */
class Unit {
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
	 * @Annotation\Options({"label":"Unit Name:"})
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
	 * @Annotation\Type("Zend\Form\Element\Submit")
	 * @Annotation\Attributes({"value":"Submit"})
	 */
	protected $submit;
	
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
	public function exchangeArray($data) {
		$this->id = (isset ( $data ['id'] )) ? $data ['id'] : null;
		$this->name = (isset ( $data ['name'] )) ? $data ['name'] : null;
		$this->description = (isset ( $data ['description'] )) ? $data ['description'] : null;
	}
	
	public function __toString(){
		return sprintf('%s', $this->getName());
	}
}