<?php

namespace Document\Controller;

//define('$this->title', 'Document');
//define('$this->route', 'document');
//define('$this->entity', 'Document\Entity\Document');

use Document\Entity\Document;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use Exception;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Zend\Form\Element;

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

    protected $em;
    protected $object;
    protected $entity, $route, $title;

    public function __construct() {
        $this->object = new Document();
        $this->entity = 'Document\Entity\Document';
        $this->title = 'Document';
        $this->route = 'document';
    }

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
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($this->object);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), $this->entity);
        $form->setHydrator($hydrator);

        $file = new Element\File('file');
        $file->setLabel('File Upload')->setAttribute('id', 'file');
        $form->add($file);

        $form->get('submit')->setAttribute('value', 'Add');

        $form->bind($this->object);

        $request = $this->getRequest();
        if ($request->isPost()) {
            $post = array_merge_recursive($request->getPost()->toArray(), $request->getFiles()->toArray());
            $form->setData($post);
            if ($form->isValid()) {
                try {
                    $file = $request->getFiles()['file'];
                    $this->object->uploadFile($file);

                    $this->object->exchangeArray($hydrator->extract($form->getData()));
                    $this->getEntityManager()->persist($this->object);
                    $this->getEntityManager()->flush();
                } catch (Exception $ex) {
                    echo $ex;
                }

                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => $this->title,
            'router' => $this->route,
            'form' => $form
        );
    }

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

        $form->bind($dbArray);
        $form->remove('file');
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
            var_dump($form->isValid());
            if ($form->isValid()) {

                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        // $file = new Element\File('image-file');
        // $file->setLabel('Attachment')->setAttribute(id, 'image-file');
        // $form->add($file);
        return array(
            'title' => $this->title,
            'router' => $this->route,
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
        $ORMRepository = $this->getEntityManager()->getRepository($this->entity);
        $dbArray = $ORMRepository->findAll();

        /*
         * Return de View on the long way...
         * $viewModel = new ViewModel ();
         * $viewModel->setVariable ( 'dbArray', $dbArray );
         * return $viewModel;
         */
        return new ViewModel(array(
            'title' => $this->title,
            'router' => $this->route,
            'dbArray' => $dbArray
        ));
    }

    public function deleteAction() {
        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute($this->route, array(
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
            $dbArray = $ORMRepository->getRepository($this->entity)->find($id);

            if (!$dbArray) {
                throw new Exception('Id invalido.');
            }
        } catch (Exception $ex) {
            return $this->redirect()->toRoute($this->route, array(
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
                if ($dbArray->deleteFile()) {
                    $ORMRepository->remove($dbArray);
                    $ORMRepository->flush();

                    return $this->redirect()->toRoute($this->route, array(
                                'action' => 'list'
                    ));
                } else {
                    echo ('<h3 align="center">Has ocurred an error. Contact the support...</h3>
			   <p align=center> Check if you have permission to delete this file
			   or if the file really exists in the server.</p> ');
                }
            } else {
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => $this->title,
            'router' => $this->route,
            'id' => $id,
            'dbArray' => $this->getEntityManager()->getRepository($this->entity)->find($id)
        );
    }

    public function IndexAction() {
        // return new ViewModel ();
        return $this->redirect()->toRoute($this->route, array(
                    'action' => 'list'
        ));
    }

}
