<?php

namespace Risk\Form;

use Zend\Form\Form;
use DoctrineModule\Persistence\ObjectManagerAwareInterface;
use DoctrineORMModule\Options\EntityManager;
use Doctrine\Common\Persistence\ObjectManager;

class RiskForm extends Form implements ObjectManagerAwareInterface {
	protected $objectmanager;
	public function getObjectManager() {
		return $this->objectManager;
	}
	public function setObjectManager(ObjectManager $objectManager) {
		$this->objectManager = $objectManager;
		return $this;
	}
	public function __construct($name = null, $options = array()) {
		parent::__construct ( $name, $options );
	}
	public function init() {
		$this->add ( array (
				'type' => 'hidden',
				'name' => 'id' 
		) );
		$this->add ( array (
				'type' => 'Text',
				'name' => 'name',
				'options' => array (
						'label' => 'Name' 
				) 
		) );
		$this->add ( array (
				'type' => 'Text',
				'name' => 'description',
				'options' => array (
						'label' => 'Description' 
				) 
		) );
		$this->add ( array (
				'name' => 'type',
				'type' => 'DoctrineModule\Form\Element\ObjectSelect',
				'options' => array (
						'label' => "Type",
						// 'object_manager' => $em,
						'object_manager' => $this->getObjectManager (),
						'target_class' => 'Risk\Entity\RiskType',
						'property' => 'name' 
				) 
		) );
		
		$this->add ( array (
				'type' => 'Zend\Form\Element\Csrf',
				'name' => 'csrf' 
		) );
		
		$this->add ( array (
				'type' => 'submit',
				'name' => 'submit',
				'attributes' => array (
						'value' => 'Insert new risk' 
				) 
		) );
	}
}
