<?php

namespace ApplicationTest\Controller;

use Zend\Test\PHPUnit\Controller\AbstractHttpControllerTestCase;

abstract class GenericControllerTest extends AbstractHttpControllerTestCase {

    protected $serviceManager;

    public function setUp() {
        $this->setApplicationConfig(
                include '/home/luizerico/Projects/sigeri/config/application.config.php'
        );
        parent::setUp();
        
        $authMock = $this->getMock('Zend\Authentication\AuthenticationService');

        $authMock->expects($this->any())
                ->method('hasIdentity')
                ->will($this->returnValue(true));

        $serviceManager = $this->getApplicationServiceLocator();
        $serviceManager->setAllowOverride(true);
        $serviceManager->setService('AuthService', $authMock);
        
    }

    public function __construct() {
        
        parent::__construct();
    }

    public function testListAction() {
        $this->dispatch($this->object . 'list');
        $this->assertResponseStatusCode(200);
    }

    public function testAddAction() {
        $this->dispatch($this->object . 'add');
        $this->assertResponseStatusCode(200);
    }

    public function testEditAction() {
        $this->dispatch($this->object . 'edit' . $this->register);
        $this->assertResponseStatusCode(200);
    }

    public function testDeleteAction() {
        $this->dispatch($this->object . 'delete' . $this->register);
        $this->assertResponseStatusCode(200);
    }

}
