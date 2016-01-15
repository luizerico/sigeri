<?php

namespace ApplicationTest\Controller;

use Zend\Test\PHPUnit\Controller\AbstractHttpControllerTestCase;

class IndexControllerTest extends AbstractHttpControllerTestCase {

    protected $serviceManager;

    public function setUp() {
        $this->setApplicationConfig(
                include '/home/luizerico/Projects/sigeri/config/application.config.php'
        );
        parent::setUp();
        $authMock = $this->getMock('Zend\Authentication\AuthenticationService');

        $authMock->expects($this->once())
                ->method('hasIdentity')
                ->will($this->returnValue(true));

        $serviceManager = $this->getApplicationServiceLocator();
        $serviceManager->setAllowOverride(true);
        $serviceManager->setService('AuthService', $authMock);
    }

    public function testIndexActionCanBeAccessed() {
        $this->dispatch('/');
        $this->assertResponseStatusCode(200);
        $this->assertModuleName('Application');
        $this->assertControllerName('Application\Controller\Index');
        $this->assertControllerClass('IndexController');
        $this->assertMatchedRouteName('home');
    }
    
    public function testeSomethingAction() {
        $this->dispatch('/');
        $this->assertResponseStatusCode(200);
        $this->assertModuleName('Application');
        $this->assertControllerName('Application\Controller\Index');
        $this->assertControllerClass('IndexController');
        $this->assertMatchedRouteName('home');
    }

}
