<?php

namespace Risk\Controller;

define('TITLE', 'Method');
define('ROUTER', 'method');
define('ENTITY', 'Risk\Entity\Method');

use Risk\Entity\Method;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use Exception;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;

class MethodController extends AbstractActionController {
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
            $this->em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        }
        return $this->em;
    }

    public function addAction() {
        $addObject = new Method ();
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($addObject);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), ENTITY);
        $form->setHydrator($hydrator);
        $form->get('submit')->setAttribute('value', 'Add');

        $form->bind($addObject);

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $addObject->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->persist($addObject);
                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute(ROUTER, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => TITLE,
            'form' => $form
        );
    }

    public function editAction() {
        $editObject = new Method ();
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($editObject);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), ENTITY);
        $form->setHydrator($hydrator);

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->Redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }

        /*
         * Check if the requested Id is valid and
         * Exist in the database
         * To do: Customize a page to report the request with a invalid Id
         */
        try {
            $ORMRepository = $this->getEntityManager()->getRepository(ENTITY);
            $dbArray = $ORMRepository->find($id);
            if (!$dbArray) {
                throw new Exception('Id invalido.');
            }
        } catch (Exception $ex) {
            return $this->redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }

        /*
         * bind to the form and
         * change the Submit value button to edit
         */

        $form->bind($dbArray);
        $form->get('submit')->setAttribute('value', 'Edit');

        /*
         * Check if request is a post from edit form and
         * extract the data using de hydrator and
         * flush to database using ORM and
         * redirect to list page
         */

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $editObject->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute(ROUTER, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => TITLE,
            'id' => $id,
            'form' => $form, 
            'dbArray' => $dbArray
        );
    }

    public function listAction() {
        $ORMRepository = $this->getEntityManager()->getRepository(ENTITY);
        $dbArray = $ORMRepository->findAll();

        return new ViewModel(array(
            //'metadados' => $metadados,
            'title' => TITLE,
            'router' => ROUTER,
            'dbArray' => $dbArray
        ));
    }

    public function deleteAction() {
        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }

        /*
         * Check if the requested Id is valid and
         * Exist in the database
         * To do: Customize a page to report the request with a invalid Id
         */
        try {
            $ORMRepository = $this->getEntityManager();
            $dbArray = $ORMRepository->getRepository(ENTITY)->find($id);

            if (!$dbArray) {
                throw new Exception('Id invalido.');
            }
        } catch (Exception $ex) {
            return $this->redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }

        /*
         * Check if the user press the Yes button and
         * Process the delete request and
         * Redirect to the list page
         */
        $request = $this->getRequest();
        if ($request->isPost()) {
            $del = $request->getPost('del', 'No');

            if ($del == 'Yes') {
                $id = $request->getPost('id');
                $ORMRepository->remove($dbArray);
                $ORMRepository->flush();
            }

            return $this->redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }

        return array(
            'title' => TITLE,
            'router' => ROUTER,
            'id' => $id,
            'dbArray' => $this->getEntityManager()->getRepository(ENTITY)->find($id)
        );
    }

    public function indexAction() {
        return new ViewModel ();
    }

    public function viewAction() {

        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }

        /*
         * Check if the requested Id is valid and
         * Exist in the database
         * To do: Customize a page to report the request with a invalid Id
         */
        try {
            $ORMRepository = $this->getEntityManager();
            $dbArray = $ORMRepository->getRepository(ENTITY)->find($id);

            if (!$dbArray) {
                throw new Exception('Id invalido.');
            }
        } catch (Exception $ex) {
            return $this->redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        }
        
        return new ViewModel(array(
            'title' => TITLE,
            'router' => ROUTER,
            'dbArray' => $dbArray
        ));
    }

}
