<?php

namespace User\Controller;

use User\Entity\User;
use User\Controller\GenericController;

class UserController extends GenericController {

    public function __construct() {
        $this->object = new User();
        $this->entity = 'User\Entity\User';
        $this->title = 'User';
        $this->route = 'user';
        
        parent::__construct();
    }

}