<?php
return array(
		'doctrine' => array (
				'driver' => array (
						'User_Entity' => array (
								'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
								'cache' => 'array',
								'paths' => array (
										__DIR__ . '/../src/User/Entity'
								)
						),
		
						'orm_default' => array (
								'drivers' => array (
										'User\Entity' => 'User_Entity'
								)
						)
				)
		),
		'controllers' => array (
				'invokables' => array (
						'User' => 'User\Controller\UserController',
						'Group' => 'User\Controller\GroupController',
						'Unit' => 'User\Controller\UnitController',
				)
		),
		'router' => array (
				'routes' => array (
						'user' => array (
								'type' => 'Segment',
								'options' => array (
										'route' => '/user[/][:action[/:id]]',
										'constraints' => array (
												'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
												'id' => '[0-9]+'
										),
										'defaults' => array (
												'controller' => 'User',
												'action' => 'index'
										)
								)
						),
						'group' => array (
								'type' => 'Segment',
								'options' => array (
										'route' => '/group[/][:action[/:id]]',
										'constraints' => array (
												'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
												'id' => '[0-9]+'
										),
										'defaults' => array (
												'controller' => 'Group',
												'action' => 'index'
										)
								)
						),
						'unit' => array (
								'type' => 'Segment',
								'options' => array (
										'route' => '/unit[/][:action[/:id]]',
										'constraints' => array (
												'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
												'id' => '[0-9]+'
										),
										'defaults' => array (
												'controller' => 'Unit',
												'action' => 'index'
										)
								)
						)
				)
					
		)
		,
		'service_manager' => array (
				'abstract_factories' => array (
						'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
						'Zend\Log\LoggerAbstractServiceFactory'
				),
				'aliases' => array (
						'translator' => 'MvcTranslator'
				)
		),
		'translator' => array (
				'locale' => 'en_US',
				'translation_file_patterns' => array (
						array (
								'type' => 'gettext',
								'base_dir' => __DIR__ . '/../language',
								'pattern' => '%s.mo'
						)
				)
		),
		'view_manager' => array (
				'display_not_found_reason' => true,
				'display_exceptions' => true,
				'doctype' => 'HTML5',
				'not_found_template' => 'error/404',
				'exception_template' => 'error/index',
				'template_path_stack' => array (
						__DIR__ . '/../view'
				)
		),
		// Placeholder for console routes
		'console' => array (
				'router' => array (
						'routes' => array ()
				)
		)
);