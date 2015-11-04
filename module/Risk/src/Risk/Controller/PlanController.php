<?php

namespace Risk\Controller;

//define('TITLE', 'Plan');
//define('ROUTER', 'plan');
//define('ENTITY', 'Risk\Entity\Plan');

use Risk\Entity\Plan;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use DoctrineORMModule\Form\Annotation\AnnotationBuilder as DoctrineAnnotationBuilder;
use Exception;

class PlanController extends GenericController {    
    
    public function __construct() {
        $this->object = new Plan();
        $this->entity = 'Risk\Entity\Plan';
        $this->title = 'Plan';
        $this->route = 'plan';
    }    

    public function editAction() {
        $editObject = new Plan ();
        $builder = new DoctrineAnnotationBuilder($this->getEntityManager());
        $form = $builder->createForm($editObject);
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
                return $this->redirect()->toRoute($this->route, array(
                            'action' => 'list'
                ));
            }
        }

        return array(
            'title' => $this->title,
            'id' => $id,
            'form' => $form,
            'dbArray' => $dbArray
        );
    }

    
}
