<?php

use ApplicationTest\Controller\GenericControllerTest;

class AssetControllerTest extends GenericControllerTest {
       
    public function __construct() {
        $this->object = '/asset/';
        $this->register = '/1';
        
        parent::__construct();
    }

}
