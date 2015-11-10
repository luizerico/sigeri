<?php

namespace User\Controller;

use User\Entity\Group;
use User\Controller\GenericController;

class GroupController extends GenericController {

    public function __construct() {
        $this->object = new Group();
        $this->entity = 'User\Entity\Group';
        $this->title = 'Group';
        $this->route = 'group';
        
        parent::__construct();
    }

}
