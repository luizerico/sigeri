<?php

use ApplicationTest\Controller\GenericControllerTest;

class UnitControllerTest extends GenericControllerTest {

    public function __construct() {
        $this->object = '/unit/';
        $this->register = '/1';

        parent::__construct();
    }

}
