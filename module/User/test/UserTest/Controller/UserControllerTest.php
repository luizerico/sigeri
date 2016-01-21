<?php

use ApplicationTest\Controller\GenericControllerTest;

class UserControllerTest extends GenericControllerTest {

    public function __construct() {
        $this->object = '/user/';
        $this->register = '/1';

        parent::__construct();
    }

}
