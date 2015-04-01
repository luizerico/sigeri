<?php

namespace Document\Entity;

use Doctrine\ORM\Mapping as ORM;
use Zend\Form\Annotation;

/**
 * @ORM\Entity
 * @ORM\Table(name="folder")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("Folder")
 */
class Folder {
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	public $id;
	
	/**
	 * @ORM\Column(type="string")
	 */
	public $name;
	
	
	public function __toString() {
		return sprintf ( '%s', $this->getName () );
	}
	public function getAbsolutePath() {
		return $this->getUploadRootDir () . '/' . $this->name;
	}
	public function getWebPath() {
		return $this->getUploadDir () . '/' . $this->name . '/';
	}
	protected function getUploadRootDir() {
		return __DIR__ . '/../../../../../public' . $this->getUploadDir ();
	}
	protected function getUploadDir() {
		return '/data/documents';
	}
	public function createFolder() {
		return mkdir ( $this->getAbsolutePath (), 0775 );
	}
	public function deleteFolder() {
		return rmdir ( $this->getAbsolutePath () );
	}
	public function renameFolder($oldname, $newname) {
		return rename ( $this->getUploadRootDir () . '/' . $oldname, $this->getUploadRootDir () . '/' . $newname );
	}
	public function exchangeArray($data) {
		$this->id = (isset ( $data ['id'] )) ? $data ['id'] : null;
		$this->name = (isset ( $data ['name'] )) ? $data ['name'] : null;
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
}