<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Storage\Session as SessionStorage;
use Zend\Db\Adapter\Adapter as DbAdapter;

class AuthenticationController extends AbstractActionController {

    public function __init() {
        // Create a SQLite database connection
        $dbAdapter = new DbAdapter(array(
            'driver' => 'Pdo_Sqlite',
            'database' => 'path/to/sqlite.db'
        ));
    }

    public function indexAction() {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }

    public function loginAction() {
        $this->auth = new AuthenticationService();

        $config = new Zend\Config\Reader\Ini();
        $options = $config->ldap->toArray();
        $authAdapter = new Zend_Auth_Adapter_Ldap($options, $this->_getParam('username'), $this->_getParam('password'));

        $result = $this->auth->authenticate($authAdapter);

        if ($result->isValid()) {
            //$result->getIdentity(); //Objeto de retorno da autenticação
            /**
             * Exemplo de storage para guardar dados na sessão
             * $storage = Zend_Auth::getInstance()->getStorage();
             * $storage->write($array);
             */
            //Redireciona para o index
            $this->_redirect('index');
        } else {
            $this->_redirect('authentication/login');
        }
    }

    public function logoutAction() {
        $this->auth->clearIdentity();
        $this->_redirect('authentication/login');
    }

}
