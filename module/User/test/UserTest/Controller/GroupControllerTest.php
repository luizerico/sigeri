<?php

use ApplicationTest\Controller\GenericControllerTest;

class GroupControllerTest extends GenericControllerTest {
       
    public function __construct() {
        $this->object = '/group/';
        $this->register = '/1';
        
        parent::__construct();
    }

}
