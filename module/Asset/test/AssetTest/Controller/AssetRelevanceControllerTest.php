<?php

use ApplicationTest\Controller\GenericControllerTest;

class AssetRelevanceControllerTest extends GenericControllerTest {

    public function __construct() {
        $this->object = '/assetrelevance/';
        $this->register = '/1';

        parent::__construct();
    }

}
