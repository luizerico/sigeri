<?php

namespace ApplicationTest;

use Zend\Mvc\Application;
use Zend\Mvc\MvcEvent;
use Zend\Mvc\Service\ServiceManagerConfig;
use Zend\ServiceManager\ServiceManager;

class bootstrap {

    static $serviceManager;

    static function go() {
        // Make everything relative to the root
        chdir(dirname(__DIR__));

        // Setup autoloading
        require_once( __DIR__ . '/../init_autoloader.php' );

        // Run application
        $config = require('config/application.config.php');
        Application::init($config);

        $serviceManager = new ServiceManager(new ServiceManagerConfig());
        $serviceManager->setService('ApplicationConfig', $config);
        $serviceManager->get('ModuleManager')->loadModules();

        self::$serviceManager = $serviceManager;
    }

    static public function getServiceManager() {

        return self::$serviceManager;
    }

    public function onBootstrap(MvcEvent $e) {
        $sm = $e->getApplication()->getServiceManager();
        $e->getTarget()->getEventManager()->getSharedManager()
                ->attach('Admin', MvcEvent::EVENT_DISPATCH, function($e) use ($sm) {
                    $auth = $sm->get('AuthService');
                    $currentRouteName = $e->getRouteMatch()->getMatchedRouteName();
                    $allowed = array(
                        'admin/login',
                        'admin/',
                    );
                    if (in_array($currentRouteName, $allowed)) {
                        return;
                    }
                    if (!$auth->hasIdentity()) {
                        $url = $e->getRouter()->assemble(array(), array('name' => 'admin/login'));
                        $response = $e->getResponse();
                        $response->getHeaders()->addHeaderLine('Location', $url);
                        $response->setStatusCode(302);
                        $response->sendHeaders();
                    }
                });
    }

}

bootstrap::go();
