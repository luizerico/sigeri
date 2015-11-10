<?php

namespace Risk\Controller;

use Risk\Entity\Risk;
use Risk\Controller\GenericController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Exception;

class RiskController extends GenericController {

    public function __construct() {
        $this->object = new Risk();
        $this->entity = 'Risk\Entity\Risk';
        $this->title = 'Risk';
        $this->route = 'risk';

        parent::__construct();
    }

    /*
     *
     * DRAFT Controller - Improve and clean the code ASAP ...
     *
     * @var Doctrine\ORM\EntityManager $dbArray - common object to send to Views
     *      $addObject - common object to addAction
     *      $this->object - common object to editAction
     *     
     */

//    protected $em;
//
//    public function setEntityManager(EntityManager $em) {
//        $this->em = $em;
//    }
//
//    public function getEntityManager() {
//        if (null == $this->em) {
//            $this->em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
//        }
//        return $this->em;
//    }
    // Set one template to be used by all actions
//    public function __construct()
//    {
//        $this->viewModel = new ViewModel();
//        $this->viewModel->setTemplate('my-model/index/default.phtml');
//    }

    public function xychartAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/xychart.phtml');
    }

    public function barchartAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/barchart.phtml');
    }

    public function columnchartAction() {
        $viewModel = new ViewModel(array(
            'title' => $this->title,
        ));
        return $viewModel->setTemplate('risk/risk/columnchart.phtml');
    }

    public function chartAction() {
        return new ViewModel();
    }

    public function jsonRiskDataAction() {
        $orderby = $this->params()->fromQuery('orderby');
        $limit = $this->params()->fromQuery('limit');

        if (isset($orderby)) {
            $orderby = " ORDER BY " . $orderby . " DESC ";
        }

        $query = "SELECT u.id AS id, u.name AS name, i.value AS impact, p.value AS probability,
                    (i.value * p.value) AS risk
                    FROM Risk\Entity\Risk u                     
                    JOIN u.impact i 
                    JOIN u.probability p " . $orderby;

        $ORMRepository = $this->getEntityManager();
        $query = $ORMRepository->createQuery($query);

        if (isset($limit)) {
            $query->setMaxResults($limit);
        }

        $results = $query->getArrayResult(\Doctrine\ORM\AbstractQuery::HYDRATE_SCALAR);

        $json2 = \Zend\Json\Json::encode($results, true);

        return new JsonModel($results);
    }

//    public function addAction() {
//        /*
//         * $addObject = new Risk ();
//         * // To do: How to automate this...
//         * // $builder = new AnnotationBuilder ();
//         * // $form = $builder->createForm ( $addObject );
//         * //
//         * // $form = new RiskForm ( $this->getEntityManager () );
//         * // $form->get ( 'submit' )->setValue ( 'Add' );
//         * $forms = $this->getServiceLocator()->get('FormElementManager');
//         * $form = $forms->get('RiskForm', array('name' => 'formName', 'options' => array()));
//         *
//         * $form->setHydrator ( new DoctrineHydrator ( $this->getEntityManager (), ENTITY ) );
//         *
//         * $request = $this->getRequest ();
//         * if ($request->isPost ()) {
//         * // $form->bind($riskType);
//         * $form->setData ( $request->getPost () );
//         * if ($form->isValid ()) {
//         * // var_dump($form->getData());
//         * $addObject->exchangeArray ( $form->getData () );
//         * // Write de data to database using Doctrine
//         * $this->getEntityManager ()->persist ( $addObject );
//         * $this->getEntityManager ()->flush ();
//         * // Redirect to list risktype page
//         * return $this->redirect ()->toRoute ( ROUTER, array (
//         * 'action' => 'list'
//         * ) );
//         * }
//         * }
//         *
//         * // define the submit label form to correspond to function name
//         * $form->get ( 'submit' )->setAttribute ( 'value', 'Add' );
//         */
//        $addObject = new Risk ();
//        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
//        $form = $builder->createForm($addObject); 
//        $hydrator = new DoctrineHydrator($this->getEntityManager(), ENTITY);
//        $form->setHydrator($hydrator);
//        
//        
//        $form->add(new \Zend\Form\Element\Csrf('security'));
//        $form->add(new \Zend\Form\Element\Submit('submit', array(
//            'value' => 'Save')));
//        $form->get('submit')->setAttribute('value', 'Add');
//
////        $formfieldset = $builder->createForm(new Method());
////        $formfieldset->setName('methodfieldset');
////        $formfieldset->setUseAsBaseFieldset(true);
////        $formfieldset->setHydrator(new DoctrineHydrator($this->getEntityManager(), 'Risk\Entity\Method'));
////
////        $form->add($formfieldset);
//
//        $form->bind($addObject);
//
//        $request = $this->getRequest();
//        if ($request->isPost()) {
//            $form->setData($request->getPost());
//            if ($form->isValid()) {
//                $addObject->exchangeArray($hydrator->extract($form->getData()));
//                $this->getEntityManager()->persist($addObject);
//                $this->getEntityManager()->flush();
//                return $this->redirect()->toRoute(ROUTER, array(
//                            'action' => 'list'
//                ));
//            }
//        }
//
//        return array(
//            'title' => $this->title,
//            'form' => $form
//        );
//    }
//
    public function editAction() {
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($this->object);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), $this->entity);
        $form->setHydrator($hydrator);

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->Redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

        /*
         * Check if the requested Id is valid and
         * Exist in the database
         * To do: Customize a page to report the request with a invalid Id
         */
        try {
            $ORMRepository = $this->getEntityManager()->getRepository($this->entity);
            $dbArray = $ORMRepository->find($id);
            if (!$dbArray) {
                throw new Exception('Id invalido.');
            }
        } catch (Exception $ex) {
            return $this->redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

        /*
         * bind to the form and
         * change the Submit value button to edit
         */

        $form->add(new \Zend\Form\Element\Csrf('security'));
        $form->add(new \Zend\Form\Element\Submit('submit', array(
            'value' => 'Save')));
        $form->get('submit')->setAttribute('value', 'Add');

        $form->bind($dbArray);
        $form->get('submit')->setAttribute('value', 'Edit');

//
//        $formfieldset = $builder->createForm(new Method());
//        $formfieldset->setName('method');
//        $formfieldset->setUseAsBaseFieldset(true);
//        $form->add($formfieldset);

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
                // $data = $form->getData ();
                // $this->getEntityManager()->persist($this->object);
                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            } else {
                echo $request;
            }
        }

        return array(
            'title' => $this->title,
            'id' => $id,
            'form' => $form,
            'dbArray' => $dbArray
        );
    }

//    public function listAction() {
//        /*
//         * This function can be simplified. I prefer keep it in this way
//         * to make the reading easily.
//         */
//        // Query Doctrine for all registers
//        $ORMRepository = $this->getEntityManager()->getRepository(ENTITY);
//        $dbArray = $ORMRepository->findAll();
//
//        /*
//         * Retrieve Metadata from table - Improve later
//         * $temp_metadados = $this->getEntityManager()->getClassMetadata(ENTITY)->getColumnNames();
//         * $metadados = array_merge($temp_metadados,
//         * 		$this->getEntityManager()->getClassMetadata(ENTITY)->getAssociationNames());
//         */
//
//        /*
//         * Return de View on the long way...
//         * $viewModel = new ViewModel ();
//         * $viewModel->setVariable ( 'dbArray', $dbArray );
//         * return $viewModel;
//         */
//        return new ViewModel(array(
//            //'metadados' => $metadados,
//            'title' => $this->title,
//            'router' => ROUTER,
//            'dbArray' => $dbArray
//        ));
//    }
//    public function deleteAction() {
//        $id = (int) $this->params()->fromRoute('id', 0);
//        if (!$id) {
//            return $this->redirect()->toRoute(ROUTER, array(
//                        'action' => 'list'
//            ));
//        }
//
//        /*
//         * Check if the requested Id is valid and
//         * Exist in the database
//         * To do: Customize a page to report the request with a invalid Id
//         */
//        try {
//            $ORMRepository = $this->getEntityManager();
//            $dbArray = $ORMRepository->getRepository(ENTITY)->find($id);
//
//            if (!$dbArray) {
//                throw new Exception('Id invalido.');
//            }
//        } catch (Exception $ex) {
//            return $this->redirect()->toRoute(ROUTER, array(
//                        'action' => 'list'
//            ));
//        }
//
//        /*
//         * Check if the user press the Yes button and
//         * Process the delete request and
//         * Redirect to the list page
//         */
//        $request = $this->getRequest();
//        if ($request->isPost()) {
//            $del = $request->getPost('del', 'No');
//
//            if ($del == 'Yes') {
//                $id = $request->getPost('id');
//                $ORMRepository->remove($dbArray);
//                $ORMRepository->flush();
//            }
//
//            return $this->redirect()->toRoute(ROUTER, array(
//                        'action' => 'list'
//            ));
//        }
//
//        return array(
//            'title' => $this->title,
//            'router' => ROUTER,
//            'id' => $id,
//            'dbArray' => $this->getEntityManager()->getRepository(ENTITY)->find($id)
//        );
//    }
//    public function indexAction() {
//        return new ViewModel ();
//    }
//
//    public function viewAction() {
//
//        $id = (int) $this->params()->fromRoute('id', 0);
//        if (!$id) {
//            return $this->redirect()->toRoute(ROUTER, array(
//                        'action' => 'list'
//            ));
//        }
//
//        /*
//         * Check if the requested Id is valid and
//         * Exist in the database
//         * To do: Customize a page to report the request with a invalid Id
//         */
//        try {
//            $ORMRepository = $this->getEntityManager();
//            $dbArray = $ORMRepository->getRepository(ENTITY)->find($id);
//
//            if (!$dbArray) {
//                throw new Exception('Id invalido.');
//            }
//        } catch (Exception $ex) {
//            return $this->redirect()->toRoute(ROUTER, array(
//                        'action' => 'list'
//            ));
//        }
//
//        return new ViewModel(array(
//            'title' => $this->title,
//            'router' => ROUTER,
//            'dbArray' => $dbArray
//        ));
//    }
}
