<?php

namespace Document\Controller;

define ( 'TITLE', 'Document' );
define ( 'ROUTER', 'document' );
define ( 'ENTITY', 'Document\Entity\Document' );

use Document\Entity\Document;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\Controller\Plugin\Redirect;
use Zend\View\Model\ViewModel;
use Zend\Form\Annotation\AnnotationBuilder;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use Exception;
use DoctrineModule\Persistence\ObjectManagerAwareInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\Annotations\Annotation;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Zend\Form\Element;
use Zend\Http\PhpEnvironment\Request;

/*
 * class DocumentController extends AbstractActionController implements ObjectManagerAwareInterface {
 *
 * Doctrine Form Work - Comment on the future
 *
 * protected $objectManager;
 * public function setObjectManager(ObjectManager $objectManager) {
 * $this->objectManager = $objectManager;
 * }
 * public function getObjectManager() {
 * return $this->objectManager;
 * }
 */
class DocumentController extends AbstractActionController {
	
	/**
	 *
	 * @var DoctrineORMEntityManager
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
	public function addAction() {
		// To do: How to automate this...
		/*
		 * $builder = new AnnotationBuilder ();
		 * $form = $builder->createForm ( $addObject );
		 * $form->setHydrator(new DoctrineHydrator($this->getEntityManager(),ENTITY));
		 * entityManager = $this->getEntityManager();
		 */
		$addObject = new Document ();
		$builder = new DoctrineAnnotationBuilder ( $this->getEntityManager () );
		$form = $builder->createForm ( $addObject );
		$hydrator = new DoctrineHydrator ( $this->getEntityManager (), ENTITY );
		$form->setHydrator ( $hydrator );
		
		$file = new Element\File ( 'file' );
		$file->setLabel ( 'File Upload' )->setAttribute ( 'id', 'file' );
		$form->add ( $file );
		
		$submit = new Element\Submit ();
		$submit->setAttribute ( 'name', 'submit' );
		$submit->setAttribute ( 'value', 'Add' );
		$form->add ( $submit );
		
		$form->bind ( $addObject );
		
		$request = $this->getRequest ();
		if ($request->isPost ()) {
			$post = array_merge_recursive ( $request->getPost ()->toArray (), $request->getFiles ()->toArray () );
			$form->setData ( $post );
			if ($form->isValid ()) {
				try {
					var_dump ( $form->getData ()->name );
					$file = $request->getFiles ()['file'];
					$addObject->uploadFile ( $file );
					
					$addObject->exchangeArray ( $hydrator->extract ( $form->getData () ) );
					$this->getEntityManager ()->persist ( $addObject );
					$this->getEntityManager ()->flush ();
				} catch ( Exception $ex ) {
					var_dump ( $ex );
				}
				
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		return array (
				'title' => TITLE,
				'router' => ROUTER,
				'form' => $form 
		);
	}
	public function editAction() {
		
		/*
		 * $editObject = new Document ();
		 * $builder = new AnnotationBuilder ();
		 * $form = $builder->createForm ( $editObject );
		 * $entityManager = $this->getServiceLocator ()->get ( 'doctrine.entitymanager.orm_default' );
		 */
		$editObject = new Document ();
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
		$form->remove ( 'file' );
		$submit = new Element\Submit ();
		$submit->setAttribute ( 'name', 'submit' );
		$submit->setAttribute ( 'value', 'Edit' );
		$form->add ( $submit );
		
		/*
		 * Check if request is a post from edit form and
		 * extract the data using de hydrator and
		 * flush to database using ORM and
		 * redirect to list page
		 */
		
		$request = $this->getRequest ();
		if ($request->isPost ()) {
			$form->setData ( $request->getPost () );
			var_dump ( $form->isValid () );
			if ($form->isValid ()) {
				
				$editObject->exchangeArray ( $hydrator->extract ( $form->getData () ) );
				$this->getEntityManager ()->flush ();
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		// $file = new Element\File('image-file');
		// $file->setLabel('Attachment')->setAttribute(id, 'image-file');
		// $form->add($file);
		
		return array (
				'title' => TITLE,
				'router' => ROUTER,
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
				if ($dbArray->deleteFile ()) {
					$ORMRepository->remove ( $dbArray );
					$ORMRepository->flush ();
					
					return $this->redirect ()->toRoute ( ROUTER, array (
							'action' => 'list' 
					) );
				} else {
					echo ('<h3 align="center">Has ocurred an error. Contact the support...</h3>
						   <p align=center> Ckeck if you have permission to delete this file
							or if the file really exists in the server.</p> ');
				}
			} else {
				return $this->redirect ()->toRoute ( ROUTER, array (
						'action' => 'list' 
				) );
			}
		}
		
		return array (
				'title' => TITLE,
				'router' => ROUTER,
				'id' => $id,
				'dbArray' => $this->getEntityManager ()->getRepository ( ENTITY )->find ( $id ) 
		);
	}
	public function IndexAction() {
		// return new ViewModel ();
		return $this->redirect ()->toRoute ( ROUTER, array (
				'action' => 'list' 
		) );
	}
}
