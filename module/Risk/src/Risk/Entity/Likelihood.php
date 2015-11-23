<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="likelihood")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Likelihood")
 */
class Likelihood {

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
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Options({"label":"Value:"})
     * 
     * @var integer
     * @access protected
     */
    protected $value;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Description"})
     * @Annotation\Attributes({"style":"width:100%"})
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

    public function __toString() {
        return sprintf('%s - %s', $this->getValue(), $this->getDescription());
    }

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
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
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->value = (isset($data ['value'])) ? $data ['value'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
    }

}
