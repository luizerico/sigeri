<?php

use ApplicationTest\Controller\GenericControllerTest;

class DocumentControllerTest extends GenericControllerTest {

    public function __construct() {
        $this->object = '/document/';
        $this->register = '/2';

        parent::__construct();
    }

}
