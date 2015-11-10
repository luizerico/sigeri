<?php

namespace User\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Exception;

class GenericController extends AbstractActionController {

    protected $em;
    protected $object;
    protected $entity, $route, $title;

    public function __construct() {
        //$this->view->addScriptPath("../Asset/view/asset/generic/");
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
        $form->get('submit')->setAttribute('value', 'Add');

        $form->bind($this->object);

        // Get the asset informations send by the import code
        $form->populateValues(array('name' => $this->params()->fromQuery('assetname')));

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->persist($this->object);
                $this->getEntityManager()->flush();
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

        $form->bind($dbArray);
        $form->get('submit')->setAttribute('value', 'Edit');

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {

                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => $this->title,
            'router' => $this->route,
            'id' => $id,
            'form' => $form
        );
    }

    public function listAction() {
        $ORMRepository = $this->getEntityManager()->getRepository($this->entity);
        $dbArray = $ORMRepository->findAll();

        return new ViewModel(array(
            'title' => $this->title,
            'router' => $this->route,
            'dbArray' => $dbArray
        ));

//        # Change the view to point to the generic folder if the
//        # listview variable is not set in the subclass.
//        if (!isset($this->listview)) {
//            return $viewModel->setTemplate('asset/generic/list.phtml');            
//        } else {
//            return $viewModel;
//        }
    }

    public function deleteAction() {
        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

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

        $request = $this->getRequest();
        if ($request->isPost()) {
            $del = $request->getPost('del', 'No');

            if ($del == 'Yes') {
                $id = $request->getPost('id');
                $ORMRepository->remove($dbArray);
                $ORMRepository->flush();
            }

            return $this->redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

        return array(
            'title' => $this->title,
            'router' => $this->route,
            'id' => $id,
            'dbArray' => $this->getEntityManager()->getRepository($this->entity)->find($id)
        );
    }

    public function IndexAction() {
        return $this->redirect()->toRoute($this->route, array(
                    'action' => 'list'
        ));
    }

    public function viewAction() {
        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute($this->route, array(
                        'action' => 'list'
            ));
        }

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

        return new ViewModel(array(
            'title' => $this->title,
            'router' => $this->route,
            'dbArray' => $dbArray
        ));
    }
    
    public function countAction($where = '') {
        $dql = 'SELECT COUNT(rows) FROM ' . $this->entity . ' rows ' . $where;

        $q = $this->getEntityManager()->createQuery($dql);
        $count = $q->getSingleScalarResult();
        $result = array("rowCount" => $count);
        return new JsonModel($result);
    }

    public function consultAction() {
        $where = $this->params()->fromQuery('where');
        $orderby = $this->params()->fromQuery('orderby');
        $limit = $this->params()->fromQuery('limit');

        $qb = $this->getEntityManager()->createQueryBuilder();
        $qb->select('row')->from($this->entity, 'row');
        
        if(isset($limit)){
            $qb->setMaxResults($limit);
        }
        
        if(isset($where)){
            $qb->andWhere('row.'. $where);
        }
        
        if(isset($orderby)){
            $qb->addOrderBy('row.'.$orderby, $order = 'DESC');
        }
                
        $rows = $qb->getQuery()->getResult(\Doctrine\ORM\AbstractQuery::HYDRATE_SCALAR);
        $result = array("rows" => $rows);
        return new JsonModel($result);
    }   

}
