<?php

namespace Risk\Controller;

use Risk\Entity\RiskReview;

use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;

class RiskReviewController extends GenericController {

    public function __construct() {
        $this->object = new RiskReview();
        $this->entity = 'Risk\Entity\RiskReview';
        $this->title = 'Risk Review';
        $this->route = 'riskreview';

        parent::__construct();
    }
    
    public function addAction() {
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($this->object);
        $hydrator = new DoctrineHydrator($this->getEntityManager(), $this->entity);
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

        $form->bind($this->object);

        $risk_id = $this->params()->fromQuery('risk_id', 0);

        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->persist($this->object);
                $this->getEntityManager()->flush();
                $url = $this->params()->fromPost('redirecturl');
                return $this->redirect()->toUrl($url);
//                return $this->redirect()->toRoute('risk', array(
//                            'action' => 'view',
//                            'id' => $risk_id,
//                ));
            }
        }

        if (isset($risk_id)) {
            $form->get('risk')->setValue($risk_id);
        }

        return array(
            'title' => $this->title,
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
                $this->object->exchangeArray($hydrator->extract($form->getData()));
                $this->getEntityManager()->flush();
                $url = $this->params()->fromPost('redirecturl');
                return $this->redirect()->toUrl($url);
//                return $this->redirect()->toRoute($this->route, array(
//                            'action' => 'list'
//                ));
            }
        }

        return array(
            'title' => $this->title,
            'id' => $id,
            'form' => $form
        );
    }
    
}