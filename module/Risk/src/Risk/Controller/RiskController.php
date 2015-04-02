<?php

namespace Risk\Controller;

define ( 'TITLE', 'Risk');
define ( 'ROUTER', 'risk' );
define ( 'ENTITY', 'Risk\Entity\Risk' );

use Risk\Entity\Risk;
use Risk\Form\RiskForm;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\Controller\Plugin\Redirect;
use Zend\View\Model\ViewModel;
use Zend\Form\Annotation\AnnotationBuilder;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use Exception;
use Doctrine\Common\Annotations\Annotation;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Zend\Json\Json;

class RiskController extends AbstractActionController {
	
	/*
	 *
	 * DRAFT Controller - Improve and clean the code ASAP ...
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
			$this->em = $this->getServiceLocator ()->get ( 'doctrine.entitymanager.orm_default' );
		}
		return $this->em;
	}
	
	public function reportAction(){
		$json = \Zend\Json\Json::encode(array(
						'ass'=>8,
						'bss'=>2, 
						'css'=>5, 
						'dss'=>100));
		return array (
				'title' => TITLE,
				'data' => $json
				 );	
	}
	
	public function addAction() {
		/*
		 * $addObject = new Risk ();
		 * // To do: How to automate this...
		 * // $builder = new AnnotationBuilder ();
		 * // $form = $builder->createForm ( $addObject );
		 * //
		 * // $form = new RiskForm ( $this->getEntityManager () );
		 * // $form->get ( 'submit' )->setValue ( 'Add' );
		 * $forms = $this->getServiceLocator()->get('FormElementManager');
		 * $form = $forms->get('RiskForm', array('name' => 'formName', 'options' => array()));
		 *
		 * $form->setHydrator ( new DoctrineHydrator ( $this->getEntityManager (), ENTITY ) );
		 *
		 * $request = $this->getRequest ();
		 * if ($request->isPost ()) {
		 * // $form->bind($riskType);
		 * $form->setData ( $request->getPost () );
		 * if ($form->isValid ()) {
		 * // var_dump($form->getData());
		 * $addObject->exchangeArray ( $form->getData () );
		 * // Write de data to database using Doctrine
		 * $this->getEntityManager ()->persist ( $addObject );
		 * $this->getEntityManager ()->flush ();
		 * // Redirect to list risktype page
		 * return $this->redirect ()->toRoute ( ROUTER, array (
		 * 'action' => 'list'
		 * ) );
		 * }
		 * }
		 *
		 * // define the submit label form to correspond to function name
		 * $form->get ( 'submit' )->setAttribute ( 'value', 'Add' );
		 */
		$addObject = new Risk ();
		$builder = new DoctrineAnnotationBuilder ( $this->getEntityManager () );
		$form = $builder->createForm ( $addObject );
		$hydrator = new DoctrineHydrator ( $this->getEntityManager (), ENTITY );
		$form->setHydrator ( $hydrator );
		$form->get ( 'submit' )->setAttribute ( 'value', 'Add' );
		
		$form->bind ( $addObject );
		
		$request = $this->getRequest ();
		if ($request->isPost ()) {
			$form->setData ( $request->getPost () );
			if ($form->isValid ()) {
				$addObject->exchangeArray ( $hydrator->extract ( $form->getData () ) );
				$this->getEntityManager ()->persist ( $addObject );
				$this->getEntityManager ()->flush ();
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		return array (
				'title' => TITLE,
				'form' => $form 
		);
	}
	public function editAction() {
		/*
		 *
		 * $editObject = new Risk ();
		 * // $builder = new AnnotationBuilder ();
		 * // $form = $builder->createForm ( $editObject );
		 *
		 * $form = new RiskForm ();
		 *
		 * $id = ( int ) $this->params ()->fromRoute ( 'id', 0 );
		 * if (! $id) {
		 * return $this->Redirect ()->toRoute ( ROUTER, array (
		 * 'action' => 'list'
		 * ) );
		 * }
		 *
		 * /*
		 * Check if the requested Id is valid and
		 * Exist in the database
		 * To do: Customize a page to report the request with a invalid Id
		 */
		/*
		 * try {
		 * $ORMRepository = $this->getEntityManager ()->getRepository ( ENTITY );
		 * $dbArray = $ORMRepository->find ( $id );
		 * if (! $dbArray) {
		 * throw new Exception ( 'Id invalido.' );
		 * }
		 * } catch ( Exception $ex ) {
		 * return $this->redirect ()->toRoute ( ROUTER, array (
		 * 'action' => 'list'
		 * ) );
		 * }
		 *
		 * /*
		 * Prepare the form and the hydrator to process the data and
		 * bind to the form and
		 * change the Submit value button to edit
		 */
		/*
		 * $hydrator = new DoctrineHydrator ( $this->getEntityManager (), ENTITY );
		 * $form->setHydrator ( $hydrator );
		 * $form->bind ( $dbArray );
		 * $form->get ( 'submit' )->setAttribute ( 'value', 'Edit' );
		 *
		 * /*
		 * Check if request is a post from edit form and
		 * extract the data using de hydrator and
		 * flush to database using ORM and
		 * redirect to list page
		 */
		/*
		 * $request = $this->getRequest ();
		 * if ($request->isPost ()) {
		 * $form->setData ( $request->getPost () );
		 * if ($form->isValid ()) {
		 * $editObject->exchangeArray ( $hydrator->extract ( $form->getData () ) );
		 * print $editObject;
		 * $this->getEntityManager ()->flush ();
		 * return $this->redirect ()->toRoute ( ROUTER, array (
		 * 'action' => 'list'
		 * ) );
		 * }
		 * }
		 */
		
		/*
		 * $editObject = new Asset ();
		 * $builder = new AnnotationBuilder ();
		 * $form = $builder->createForm ( $editObject );
		 * $entityManager = $this->getServiceLocator ()->get ( 'doctrine.entitymanager.orm_default' );
		 */
		$editObject = new Risk ();
		$builder = new DoctrineAnnotationBuilder ( $this->getEntityManager () );
		$form = $builder->createForm ( $editObject );
		$hydrator = new DoctrineHydrator ( $this->getEntityManager (), ENTITY );
		$form->setHydrator ( $hydrator );
		
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
		 * bind to the form and
		 * change the Submit value button to edit
		 */
		
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
				// $data = $form->getData ();
				// $this->getEntityManager()->persist($editObject);
				$editObject->exchangeArray ( $hydrator->extract ( $form->getData () ) );
				$this->getEntityManager ()->flush ();
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		return array (
				'title' => TITLE,
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
		 * Retrieve Metadata from table - Improve later
		 * $temp_metadados = $this->getEntityManager()->getClassMetadata(ENTITY)->getColumnNames();
		 * $metadados = array_merge($temp_metadados,
		 * 		$this->getEntityManager()->getClassMetadata(ENTITY)->getAssociationNames());
		 */
		
		/*
		 * Return de View on the long way...
		 * $viewModel = new ViewModel ();
		 * $viewModel->setVariable ( 'dbArray', $dbArray );
		 * return $viewModel;
		 */
		return new ViewModel ( array (
				//'metadados' => $metadados,
				'title' => TITLE,
				'router' => ROUTER,
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
				'title' => TITLE,
				'router' => ROUTER,
				'id' => $id,
				'dbArray' => $this->getEntityManager ()->getRepository ( ENTITY )->find ( $id ) 
		);
	}
	public function IndexAction() {
		return new ViewModel ();
	}
}
