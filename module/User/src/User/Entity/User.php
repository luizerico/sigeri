<?php

namespace User\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

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
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"3"}})
     * @Annotation\Options({"label":"Username:"})
     *
     * @var string
     * @access protected
     */
    protected $username;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Password")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Password:"})
     * 
     * @var string
     * @access protected
     */
    protected $password;

    /**
     * @ORM\Column(type="string")
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
     * @ORM\Column(type="string")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Display Name:"})
     *
     * @var string
     * @access protected
     */
    protected $name;

    /**
     * @ORM\ManyToOne(targetEntity="User\Entity\Unit")
     * @ORM\JoinColumn(name="unit_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required({"required":"False" })
     * @Annotation\Attributes({"element.style":"width:100px"})
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Unit:", "empty_option":"Please select..."})
     *
     * @var \User\Entity\Unit
     * @access protected
     */
    protected $unit;

    /**
     * @ORM\ManyToOne(targetEntity="User\Entity\User")
     * @ORM\JoinColumn(name="manager_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Attributes({"element.style":"width:100px"})
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Manager:", "empty_option":"Please select..."})
     *
     * @var \User\Entity\User
     * @access protected
     */
    protected $manager;

    /**
     * @ORM\ManyToMany(targetEntity="User\Entity\Group")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
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
     * @Annotation\Type("Zend\Form\Element\Textarea")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
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
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->username = (isset($data ['username'])) ? $data ['username'] : null;
        $this->password = (isset($data ['password'])) ? $data ['password'] : null;
        $this->email = (isset($data ['email'])) ? $data ['email'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->unit = (isset($data ['unit'])) ? $data ['unit'] : null;
        $this->manager = (isset($data ['manager'])) ? $data ['manager'] : null;
        $this->groups = (isset($data ['groups'])) ? $data ['groups'] : null;
        $this->detail = (isset($data ['detail'])) ? $data ['detail'] : null;
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

    public function getUsername() {
        return $this->username;
    }

    public function setUsername($username) {
        $this->username = $username;
        return $this;
    }
    
    public function getPassword() {
        return $this->password;
    }
    
    public function setPassword($password) {
        $this->password = $password;
        return $this;
    }   

    public function getEmail() {
        return $this->email;
    }

    public function setEmail($email) {
        $this->email = $email;
        return $this;
    }
    
    public function getName() {
        return $this->name;
    }

    public function setName($name) {
        $this->name = $name;
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

}
