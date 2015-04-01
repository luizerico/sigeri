<?php

namespace User\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\Collections\Collection;
use User\Entity\Group;
use User\Entity\Unit;

/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("User")
 */
class User {
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
	 * @Annotation\Attributes({"size":"50px"}) // Define the size in html code
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
	 * @Annotation\Options({"label":"Name:"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $name;
	
	/**
	 * @ORM\Column(type="string", length=250, nullable=false)
	 * @Annotation\Type("Zend\Form\Element\Email")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Validator({"name":"EmailAddress", "options": {"unique":"true"}})
	 * @Annotation\Options({"label":"Email:"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $email;
	
	/**
	 * @ORM\ManyToOne(targetEntity="User\Entity\Unit")
	 * @ORM\JoinColumn(name="unit_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Attributes({"element.style":"width:100px"})
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Unit:"})
	 *
	 * @var \User\Entity\Unit
	 * @access protected
	 */
	protected $unit;
	
	/**
	 * @ORM\ManyToOne(targetEntity="User\Entity\User")
	 * @ORM\JoinColumn(name="manager_id", referencedColumnName="id")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"False" })
	 * @Annotation\Attributes({"element.style":"width:100px"})
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Manager:"})
	 *
	 * @var \User\Entity\User
	 * @access protected
	 */
	protected $manager;
	
	/**
	 * @ORM\ManyToMany(targetEntity="User\Entity\Group")
	 * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Options({"label":"Groups:"})
	 * @Annotation\Attributes({"multiple":"multiple", "id":"my-select"})
	 *
	 * @var \Risk\Entity\Risk
	 * @access protected
	 */
	protected $groups;
	
	/**
	 * @ORM\Column(type="text", nullable=true)
	 * @Annotation\Type("Zend\Form\Element\Text")
	 * @Annotation\Required({"required":"false" })
	 * @Annotation\Attributes({"style":"width:415px; height:50px", "class":"user.css"})
	 * @Annotation\Filter({"name":"StripTags"})
	 * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
	 * @Annotation\Options({"label":"Details:"})
	 *
	 * @var string
	 * @access protected
	 */
	protected $detail;
	
	/**
	 * @Annotation\Type("Zend\Form\Element\Submit")
	 * @Annotation\Attributes({"value":"Submit"})
	 */
	protected $submit;
	public function __construct() {
		$this->groups = new ArrayCollection ();
	}
	public function exchangeArray($data) {
		$this->id = (isset ( $data ['id'] )) ? $data ['id'] : null;
		$this->name = (isset ( $data ['name'] )) ? $data ['name'] : null;
		$this->email = (isset ( $data ['email'] )) ? $data ['email'] : null;
		$this->unit = (isset ( $data ['unit'] )) ? $data ['unit'] : null;
		$this->manager = (isset ( $data ['manager'] )) ? $data ['manager'] : null;
		$this->groups = (isset ( $data ['groups'] )) ? $data ['groups'] : null;
		$this->detail = (isset ( $data ['detail'] )) ? $data ['detail'] : null;
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
	public function getEmail() {
		return $this->email;
	}
	public function setEmail($email) {
		$this->email = $email;
		return $this;
	}
	public function getManager() {
		return $this->manager;
	}
	public function setManager(\User\Entity\User $manager) {
		$this->manager = $manager;
		return $this;
	}
	public function getUnit() {
		return $this->unit;
	}
	public function setUnit(\User\Entity\Unit $unit) {
		$this->unit = $unit;
		return $this;
	}
	public function getDetail() {
		return $this->detail;
	}
	public function setDetail($detail) {
		$this->detail = $detail;
		return $this;
	}
	public function addGroups(Collection $groups) {
		foreach ( $groups as $group ) {
			$this->groups->add ( $group );
		}
	}
	public function removeGroups(Collection $groups) {
		foreach ( $groups as $group ) {
			$this->groups->removeElement ( $group );
		}
	}
	public function getGroups() {
		return $this->groups;
	}
}