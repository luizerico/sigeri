<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\MvcEvent;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController {

    public function onDispatch(MvcEvent $e) {
        if (!$this->getServiceLocator()->get('AuthService')->hasIdentity()) {
            $this->redirect()->toRoute('authentication', array('action' => 'login'));
        }
        return parent::onDispatch($e);
    }

    public function indexAction() {
        return new ViewModel();
    }
}
