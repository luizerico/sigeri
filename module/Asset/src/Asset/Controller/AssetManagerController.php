<?php

namespace Asset\Controller;

define ( 'ROUTER', 'assetmanager' );
define ( 'ENTITY', 'Asset\Entity\AssetManager' );

use Asset\Entity\AssetManager;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\Controller\Plugin\Redirect;
use Zend\View\Model\ViewModel;
use Zend\Form\Annotation\AnnotationBuilder;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use Exception;

use DoctrineModule\Persistence\ObjectManagerAwareInterface;
use Doctrine\Common\Persistence\ObjectManager;

class AssetManagerController extends AbstractActionController {
	
	/**
	 *
	 * @var Doctrine\ORM\EntityManager $dbArray - common object to send to Views
	 *      $addObject - common object to addAction
	 *      $editObject - common object to editAction
	 *     
	 */
	protected $em;
	public function setEntityManager(EntityManager $em) {
		$this->em = $em;
	}
	public function getEntityManager() {
		if (null == $this->em) {
			$this->em = $this->getServiceLocator ()->get ( 'Doctrine\ORM\EntityManager' );
		}
		return $this->em;
	}
	public function addAction() {
		$addObject = new AssetManager (); // To do: How to automate this...
		$builder = new AnnotationBuilder ();
		$form = $builder->createForm ( $addObject );
		
		$request = $this->getRequest ();
		if ($request->isPost ()) {
			// $form->bind($assetType);
			$form->setData ( $request->getPost () );
			if ($form->isValid ()) {
				// var_dump($form->getData());
				$addObject->exchangeArray ( $form->getData () );
				// Write de data to database using Doctrine
				$this->getEntityManager ()->persist ( $addObject );
				$this->getEntityManager ()->flush ();
				// Redirect to list assettype page
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		// define the submit label form to correspond to function name
		$form->get ( 'submit' )->setAttribute ( 'value', 'Add' );
		return array (
				'form' => $form 
		);
	}
	public function editAction() {
		$editObject = new AssetManager ();
		$builder = new AnnotationBuilder ();
		$form = $builder->createForm ( $editObject );
		
		$id = ( int ) $this->params ()->fromRoute ( 'id', 0 );
		if (! $id) {
			return $this->Redirect ()->toRoute ( ROUTER, array (
					'action' => 'list' 
			) );
		}
		
		/*
		 * Check if the requested Id is valid and 
		 * Exist in the database
		 * To do: Customize a page to report the request with a invalid Id
		 */
		try {
			$ORMRepository = $this->getEntityManager ()->getRepository ( ENTITY );
			$dbArray = $ORMRepository->find ( $id );
			if (! $dbArray) {
				throw new Exception ( 'Id invalido.' );
			}
		} catch ( Exception $ex ) {
			return $this->redirect ()->toRoute ( ROUTER, array (
					'action' => 'list' 
			) );
		}
		
		/*
		 * Prepare the form and the hydrator to process the data and
		 * bind to the form and
		 * change the Submit value button to edit
		 */
		$hydrator = new DoctrineHydrator ( $this->getEntityManager (), ENTITY );
		$form->setHydrator ( $hydrator );
		$form->bind ( $dbArray );
		$form->get ( 'submit' )->setAttribute ( 'value', 'Edit' );
		
		/*
		 * Check if request is a post from edit form and
		 * extract the data using de hydrator and
		 * flush to database using ORM and
		 * redirect to list page
		 */
		$request = $this->getRequest ();
		if ($request->isPost ()) {
			$form->setData ( $request->getPost () );
			if ($form->isValid ()) {
				$editObject->exchangeArray ( $hydrator->extract ( $form->getData () ) );
				$this->getEntityManager ()->flush ();
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		return array (
				'id' => $id,
				'form' => $form 
		);
	}
	public function listAction() {
		/*
		 * This function can be simplified. I prefer keep it in this way
		 * to make the reading easily.
		 */
		// Query Doctrine for all registers
		$ORMRepository = $this->getEntityManager ()->getRepository ( ENTITY );
		$dbArray = $ORMRepository->findAll ();
		
		/*
		 * Return de View on the long way...
		 * $viewModel = new ViewModel ();
		 * $viewModel->setVariable ( 'dbArray', $dbArray );
		 * return $viewModel;
		 */
		return new ViewModel ( array (
				'dbArray' => $dbArray 
		) );
	}
	public function deleteAction() {
		$id = ( int ) $this->params ()->fromRoute ( 'id', 0 );
		if (! $id) {
			return $this->redirect ()->toRoute ( ROUTER, array (
					'action' => 'list' 
			) );
		}
		
		/*
		 * Check if the requested Id is valid and 
		 * Exist in the database
		 * To do: Customize a page to report the request with a invalid Id
		 */
		try {
			$ORMRepository = $this->getEntityManager ();
			$dbArray = $ORMRepository->getRepository ( ENTITY )->find ( $id );
			
			if (! $dbArray) {
				throw new Exception ( 'Id invalido.' );
			}
		} catch ( Exception $ex ) {
			return $this->redirect ()->toRoute ( ROUTER, array (
					'action' => 'list' 
			) );
		}
		
		/*
		 * Check if the user press the Yes button and
		 * Process the delete request and 
		 * Redirect to the list page
		 */
		$request = $this->getRequest ();
		if ($request->isPost ()) {
			$del = $request->getPost ( 'del', 'No' );
			
			if ($del == 'Yes') {
				$id = $request->getPost ( 'id' );
				$ORMRepository->remove ( $dbArray );
				$ORMRepository->flush ();
			}
			
			return $this->redirect ()->toRoute ( ROUTER, array (
					'action' => 'list' 
			) );
		}
		
		return array (
				'id' => $id,
				'dbArray' => $this->getEntityManager ()->getRepository ( ENTITY )->find ( $id ) 
		);
	}
	public function IndexAction() {
		return new ViewModel ();
	}	
	
}
