<?php

namespace Document;

return array(
    'doctrine' => array(
        /*
         * Old way 
         * 
         * 'driver' => array (
          'Document_Entity' => array (
          'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
          'cache' => 'array',
          'paths' => array (
          __DIR__ . '/../src/Document/Entity'
          )
          ),

          'orm_default' => array (
          'drivers' => array (
          'Document\Entity' => 'Document_Entity'
          )
          )
          ) */
        'driver' => array(
            __NAMESPACE__ . '_driver' => array(
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'array',
                'paths' => array(
                    __DIR__ . '/../src/' . __NAMESPACE__ . '/Entity'
                )
            ),
            'orm_default' => array(
                'drivers' => array(
                    __NAMESPACE__ . '\Entity' => __NAMESPACE__ . '_driver'
                )
            )
        )
    ),
    'controllers' => array(
        'invokables' => array(
            'Document' => 'Document\Controller\DocumentController',
            'Folder' => 'Document\Controller\FolderController',
        //'DocumentManager' => 'Document\Controller\DocumentManagerController' 
        )
    ),
    'router' => array(
        'routes' => array(
            'document' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/document[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Document',
                        'action' => 'index'
                    )
                )
            ),
            'folder' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/folder[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Folder',
                        'action' => 'index'
                    )
                )
            ),
        /* 'documentmanager' => array (
          'type' => 'Segment',
          'options' => array (
          'route' => '/documentmanager[/][:action[/:id]]',
          'constraints' => array (
          'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
          'id' => '[0-9]+'
          ),
          'defaults' => array (
          'controller' => 'DocumentManager',
          'action' => 'index'
          )
          )
          ) */
        )
    )
    ,
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
            'Zend\Log\LoggerAbstractServiceFactory'
        ),
        'aliases' => array(
            'translator' => 'MvcTranslator'
        )
    ),
    'translator' => array(
        'locale' => 'en_US',
        'translation_file_patterns' => array(
            array(
                'type' => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern' => '%s.mo'
            )
        )
    ),
    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions' => true,
        'doctype' => 'HTML5',
        'not_found_template' => 'error/404',
        'exception_template' => 'error/index',
        'template_path_stack' => array(
            __DIR__ . '/../view'
        )
    ),
    // Placeholder for console routes
    'console' => array(
        'router' => array(
            'routes' => array()
        )
    )
);
