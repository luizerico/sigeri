<?php

namespace DocumentTest\Controller;

use Zend\Test\PHPUnit\Controller\AbstractHttpControllerTestCase;

class DocumentControllerTest extends AbstractHttpControllerTestCase {

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

    public function testListActionCanBeAccessed() {
        $this->dispatch('/document/list');
        $this->assertResponseStatusCode(200);
        $this->assertModuleName('Document');
        $this->assertControllerName('document');
        $this->assertControllerClass('DocumentController');
        $this->assertMatchedRouteName('document');
    }

}
