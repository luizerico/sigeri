<?php
namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="planeffort")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("PlanEffort")
 */
class PlanEffort {
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
	 * @Annotation\Options({"label":"Effort"})
	 * @Annotation\Attributes({"style":"width:100%"}) // Define the size in html code
	 *
	 * @var string
	 * @access protected
	 */
	protected $name;
        
        /**
	 * @ORM\Column(type="integer")
	 * @Annotation\Type("Zend\Form\Element\Number")
	 * @Annotation\Required(true)
	 * @Annotation\Options({"label":"Value:"})
	 * 
	 * @var integer
	 * @access protected
	 */
	protected $value;
	
	/**
	 * @ORM\Column(type="string", nullable=true)
	 * @Annotation\Type("Zend\Form\Element\Text")
	 * @Annotation\Required(false)
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
	
	public function __toString(){
		return sprintf('%s - %s', $this->getValue(), $this->getName());
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
	public function getValue() {
		return $this->value;
	}
	public function setValue($value) {
		$this->value = $value;
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
		$this->value = (isset ( $data ['value'] )) ? $data ['value'] : null;
		$this->description = (isset ( $data ['description'] )) ? $data ['description'] : null;
	}
}