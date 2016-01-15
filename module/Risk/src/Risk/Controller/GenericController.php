<?php

namespace Risk\Controller;

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

    public function onDispatch(\Zend\Mvc\MvcEvent $e) {
        if (!$this->getServiceLocator()->get('AuthService')->hasIdentity()) {
            $this->redirect()->toRoute('authentication', array('action' => 'login'));
        }

        return parent::onDispatch($e);
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

                /*
                 *  Insert a new register on RiskVersion
                 *  To my mind this method is strange and poor but is more simple that
                 *  use the clone or copy to keep an entirely entity and all
                 *  relations on another table.
                 */
                if (isset($this->entityversion)) {
                    $version = new $this->entityversion;
                    $version->exchangeArray($hydrator->extract($form->getData()));
                    $version->setEntityId($this->object->getId());
                    $this->getEntityManager()->persist($version);
                    $this->getEntityManager()->flush();
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

        $form->bind($dbArray);
        $form->get('submit')->setAttribute('value', 'Edit');

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {

                // Insert a new register on the RiskVersion
                if (isset($this->entityversion)) {
                    $version = new $this->entityversion;
                    $version->exchangeArray($hydrator->extract($form->getData()));
                    $version->setEntityId($id);
                    $this->getEntityManager()->persist($version);
                } // End of RiskVersion insert

                $this->getEntityManager()->flush();
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        try {
            $versionArray = $this->getEntityManager()
                    ->getRepository($this->entityversion)
                    ->findBy(array('entity_id' => $id));
        } catch (Exception $ex) {
            $versionArray = null;
        }

        return array(
            'title' => $this->title,
            'id' => $id,
            'form' => $form,
            'dbArray' => $dbArray,
            'vsArray' => $versionArray,
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

        try {
            $versionArray = $this->getEntityManager()
                    ->getRepository($this->entityversion)
                    ->findBy(array('entity_id' => $id));
        } catch (Exception $ex) {
            $versionArray = null;
        }

        return new ViewModel(array(
            'title' => $this->title,
            'router' => $this->route,
            'dbArray' => $dbArray,
            'vsArray' => $versionArray,
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

        if (isset($limit)) {
            $qb->setMaxResults($limit);
        }

        if (isset($where)) {
            $qb->andWhere('row.' . $where);
        }

        if (isset($orderby)) {
            $qb->addOrderBy('row.' . $orderby, $order = 'DESC');
        }

        $result = $qb->getQuery()->getResult(\Doctrine\ORM\AbstractQuery::HYDRATE_SCALAR);

        return new JsonModel($result);
    }

    protected function querysql($query) {
        $con = $this->getEntityManager()->getConnection();
        $stmt = $con->prepare($query);
        $stmt->execute();
        $data = $stmt->fetchAll();

        return $data;
    }

}
