<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;

class AuthenticationController extends AbstractActionController {

    public function getAuthService() {
        if (!isset($this->authservice)) {
            $this->authservice = $this->getServiceLocator()
                    ->get('AuthService');
        }

        return $this->authservice;
    }

    public function getLDAPAuthService() {
        if (!$this->ldapauthservice) {
            $this->ldapauthservice = $this->getServiceLocator()
                    ->get('LDAPAuthService');
        }

        return $this->ldapauthservice;
    }

    public function notFoundAction() {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }

    public function loginAction() {
        if ($this->getRequest()->isPost()) {

            $this->getAuthService()->getAdapter()
                    ->setIdentity($this->params()->fromPost('username'))
                    ->setCredential($this->params()->fromPost('password'));

            $dbresult = $this->getAuthService()->authenticate();

//            $this->getLDAPAuthService()->getAdapter()
//                    ->setIdentity($this->params()->fromPost('username'))
//                    ->setCredential($this->params()->fromPost('password'));
//            $this->getLDAPAuthService()->getAdapter()
//                    ->setIdentity('admin')
//                    ->setCredential('sumep-exc');
//
//            var_dump($this->getLDAPAuthService()->getIdentity());
//            
//            $ldapresult = $this->getLDAPAuthService()->authenticate();           

            if ($dbresult->isValid()) {
                $resultRow = $this->getAuthService()->getAdapter()
                        ->getResultRowObject();
                $this->getAuthService()->getStorage()->write(array(
                    'id' => $resultRow->id,
                    'name' => $resultRow->name)
                );
                return $this->redirect()->toRoute('application', array(
                            'action' => 'index'
                ));
            } else {
                return $this->redirect()->toRoute('authentication', array(
                            'action' => 'login'
                ));
            }
        }

        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }

    public function logoutAction() {
        $this->getAuthService()->clearIdentity();
        return $this->redirect()->toRoute('authentication', array(
                    'action' => 'login'
        ));
    }

    public function getIdentityAction() {
        //$identity = $this->getAuthService()->getStorage()->read();
        $identity = $this->getAuthService()->getStorage()->read();
        return new JsonModel($identity);
    }

}
