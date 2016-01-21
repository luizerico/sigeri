<?php

use ApplicationTest\Controller\GenericControllerTest;

class AssetGroupControllerTest extends GenericControllerTest {

    public function __construct() {
        $this->object = '/assetgroup/';
        $this->register = '/1';

        parent::__construct();
    }

}
