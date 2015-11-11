<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;

class AuthenticationController extends AbstractActionController {

    public function getAuthService() {
        if (!$this->authservice) {
            $this->authservice = $this->getServiceLocator()
                    ->get('AuthService');
        }

        return $this->authservice;
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
            $result = $this->getAuthService()->authenticate();

            if ($result->isValid()) {
                return $this->redirect()->toRoute('application', array(
                            'action' => 'index'
                ));
            } else {
                return $this->redirect()->toRoute('authentication', array(
                            'action' => 'login'
                ));
            }
        } else {
            $viewModel = new ViewModel();
            $viewModel->setTerminal(true);
            return $viewModel;
        }
    }

    public function logoutAction() {
        $this->getAuthService()->clearIdentity();
        return $this->redirect()->toRoute('authentication', array(
                    'action' => 'login'
        ));
    }

    public function getIdentityAction() {
        $identity = $this->getAuthService()->getIdentity();
        
        return new JsonModel(Array('identity' => $identity));
    }

//    public function indexAction() {
//        $viewModel = new ViewModel();
//        $viewModel->setTerminal(true);
//        return $viewModel;
//    }
}
