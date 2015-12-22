<?php

namespace Document\Entity;

use Doctrine\ORM\Mapping as ORM;
use Zend\Form\Annotation;

/**
 * @ORM\Entity
 * @ORM\Table(name="document")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Document")
 */
class Document {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    public $id;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Exclude()
     */
    public $name;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Options({"label":"Description:"})
     */
    public $description;

    /**
     * @ORM\Column(type="string")
     * @Annotation\Exclude()
     */
    public $type;

    /**
     * @ORM\ManyToOne(targetEntity="Document\Entity\Folder")
     * @ORM\JoinColumn(name="folder_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Options({"label":"Folder:"})
     * 
     * @var \Document\Entity\Folder
     * @access protected
     */
//    public $folder;

    /*
     * @Annotation\Type("Zend\Form\Element\File")
     * @Annotation\Options({"label":"File:"})
     */

    //public $file;

    /**
     * @Annotation\Type("Zend\Form\Element\Submit")
     * @Annotation\Attributes({"value":"Submit"})
     */
    protected $submit;

    public function __toString() {
        return sprintf('%s', $this->getName());
    }

    public function getAbsolutePath() {
        return null === $this->path ? null : $this->getUploadRootDir();
    }

    public function getWebPath() {
        return  $this->getUploadDir() ;
    }

    protected function getUploadRootDir() {
        return __DIR__ . '/../../../../../public/' . $this->getUploadDir();
    }

    protected function getUploadDir() {
        return '/data/documents/';
    }

    public function uploadFile($file) {
        $this->name = $file['name'];
        $this->type = $file['type'];

        $filter = new \Zend\Filter\File\RenameUpload($this->getUploadRootDir());
        $filter->setUseUploadName(true);
        $filter->filter($file);
    }

    public function deleteFile() {
        return unlink($this->getUploadRootDir() . '/' . $this->name);
    }

    public function exchangeArray($data) {
        $this->id = (isset($data ['id'])) ? $data ['id'] : null;
        $this->description = (isset($data ['description'])) ? $data ['description'] : null;
//        $this->folder = (isset($data ['folder'])) ? $data ['folder'] : null;
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

    public function getType() {
        return $this->type;
    }

    public function setType($type) {
        $this->type = $type;
        return $this;
    }

//    public function getFolder() {
//        return $this->folder;
//    }
//
//    public function setFolder($folder) {
//        $this->folder = $folder;
//        return $this;
//    }

    public function getDescription() {
        return $this->description;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

}
