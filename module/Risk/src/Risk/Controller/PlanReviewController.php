<?php

namespace Risk\Controller;

define('TITLE', 'Plan Review');
define('ROUTER', 'planreview');
define('ENTITY', 'Risk\Entity\PlanReview');

use Risk\Entity\PlanReview;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use Exception;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;

class PlanReviewController extends AbstractActionController {

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

        $addObject = new PlanReview ();
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($addObject);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), ENTITY);
        $form->setHydrator($hydrator);
        $form->get('submit')->setAttribute('value', 'Add');

        $redirectUrl = (string) $this->getRequest()
                        ->getHeader('Referer')->uri()->getPath();
        $form->add(array(
            'type' => 'Zend\Form\Element\Hidden',
            'name' => 'redirecturl',
            'attributes' => array(
                'value' => $redirectUrl,
            )
        ));

        $form->bind($addObject);

        $plan_id = $this->params()->fromQuery('plan_id', 0);

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $addObject->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->persist($addObject);
                $this->getEntityManager()->flush();
                $url = $this->params()->fromPost('redirecturl');
                return $this->redirect()->toUrl($url);
//                return $this->redirect()->toRoute('plan', array(
//                            'action' => 'view',
//                            'id' => $plan_id,
//                ));
            }
        }

        if (isset($plan_id)) {
            $form->get('plan')->setValue($plan_id);
        }

        return array(
            'title' => TITLE,
            'form' => $form
        );
    }

    public function editAction() {
        $editObject = new PlanReview ();
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($editObject);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), ENTITY);
        $form->setHydrator($hydrator);

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->Redirect()->toRoute(ROUTER, array(
                        'action' => 'list'
            ));
        } else {
            $redirectUrl = (string) $this->getRequest()
                            ->getHeader('Referer')->uri()->getPath();
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
        $form->add(array(
            'type' => 'Zend\Form\Element\Hidden',
            'name' => 'redirecturl',
            'attributes' => array(
                'value' => $redirectUrl,
            )
        ));

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
                $url = $this->params()->fromPost('redirecturl');
                return $this->redirect()->toUrl($url);
//                return $this->redirect()->toRoute(ROUTER, array(
//                            'action' => 'list'
//                ));
            }
        }

        return array(
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
