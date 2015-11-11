<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Authentication\Adapter\DbTable as AuthAdapter;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Storage\Session as SessionStorage;

class Module {

    public function onBootstrap(MvcEvent $e) {
        $eventManager = $e->getApplication()->getEventManager();

        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        // Disable layout to the 404 error page
        $eventManager->attach(MvcEvent::EVENT_DISPATCH_ERROR, function($e) {
            $result = $e->getResult();
            $result->setTerminal(TRUE);
        });
    }

    public function getConfig() {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig() {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

//    public function getFormElementConfig() {
//        return array(
//            'invokables' => array(
//                'RiskForm' => 'Risk\Form\RiskForm',
//            ),
//            'initializers' => array(
//                'ObjectManagerInitializer' => function ($element, $formElements) {
//                    if ($element instanceof ObjectManagerAwareInterface) {
//                        $services = $formElements->getServiceLocator();
//                        $entityManager = $services->get('Doctrine\ORM\EntityManager');
//
//                        $element->setObjectManager($entityManager);
//                    }
//                },
//            ),
//        );
//    }

    public function getServiceConfig() {
        return array(
            'abstract_factories' => array(),
            'aliases' => array(),
            'factories' => array(
                // Some more code here but removed for simplicity
                // Autentication
                'AuthService' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $dbAuthAdapter = new AuthAdapter($dbAdapter, 'user', 'username', 'password');

                    $authService = new AuthenticationService();
                    $authService->setAdapter($dbAuthAdapter);

                    return $authService;
                })
        );
    }

}
