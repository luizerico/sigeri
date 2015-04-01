<?php

namespace Risk\Form;

use Zend\Form\Fieldset;
use Risk\Entity\Risk;
use Zend\Stdlib\Hydrator\ObjectProperty as ObjectPropertyHydrator;

class RiskFieldset extends Fieldset {
	public function __construct() {
		parent::__construct ('risk');
		$this->setHydrator ( new ObjectPropertyHydrator ( false ) )->setObject ( new Risk () );
		
		$this->add ( array (
				'type' => 'hidden',
				'name' => 'id' 
		) );
		$this->add ( array (
				'type' => 'text',
				'name' => 'name',
				'options' => array (
						'label' => 'Name' 
				) 
		) );
		$this->add ( array (
				'type' => 'text',
				'name' => 'description',
				'options' => array (
						'label' => 'Description' 
				) 
		) );
		$this->add ( array (
				'type' => 'text',
				'name' => 'type',
				'options' => array (
						'label' => 'Type' 
				) 
		) );
	}
}