<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity
 * @ORM\Table(name="compliance")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Compliance")
 */
class Compliance {

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
     * @Annotation\Type("Zend\Form\Element\Textarea")
     * @Annotation\Required(false)
     * @Annotation\Validator({"name":"StringLength", "options":{"min":"5"}})
     * @Annotation\Options({"label":"Description"})
     * @Annotation\Attributes({"style":"width:100%", "class":"ckeditor"})
     *
     * @var string
     * @access protected
     */
    protected $description;

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
     * @ORM\OneToMany(targetEntity="Risk\Entity\ComplianceRule", mappedBy="compliance")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Rules"})
     *
     * @var \Risk\Entity\ComplianceRule
     * @access protected
     */
    protected $rules;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     * @Annotation\Attributes({"style":"width:150px", "class":"btn btn-default"})
     */
    protected $submit;

    public function __construct() {
        $this->documents = new ArrayCollection();
        $this->rules = new ArrayCollection();
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->name = (isset($data ['name'])) ? $data ['name'] : null;
        $this->rules = (isset($data ['rules'])) ? $data ['rules'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
        $this->documents = (isset($data ['documents'])) ? $data ['documents'] : null;
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

    public function addRules(Collection $rules) {
        foreach ($rules as $rule) {
            $this->rules->add($rule);
        }
    }

    public function removeRules(Collection $rules) {
        foreach ($rules as $rule) {
            $this->rules->removeElement($rule);
        }
    }

    public function getRules() {
        return $this->rules;
    }

}
