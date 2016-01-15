<?php

use ApplicationTest\Bootstrap;
//use PHPUnit_Framework_TestCase;

class UserTest extends \PHPUnit_Framework_TestCase
{
    protected $serviceManager;
    protected $userService;

    protected function setUp()
    {
        $this->serviceManager = Bootstrap::getServiceManager();
        $this->userService = $this->serviceManager->get('UserService');
    }

    public function testHelloWorld()
    {
        $response = $this->userService->doSomething();
        $this->assertEquals('hello world!', $response);
    }
}



