<?php

namespace Asset;

return array(
    'doctrine' => array(
        /*
         * Old way 
         * 
         * 'driver' => array (
          'Asset_Entity' => array (
          'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
          'cache' => 'array',
          'paths' => array (
          __DIR__ . '/../src/Asset/Entity'
          )
          ),

          'orm_default' => array (
          'drivers' => array (
          'Asset\Entity' => 'Asset_Entity'
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
            'Asset' => 'Asset\Controller\AssetController',
            'AssetType' => 'Asset\Controller\AssetTypeController',
            'AssetGroup' => 'Asset\Controller\AssetGroupController',
            'ServerAsset' => 'Asset\Controller\ServerAssetController',
            'ServiceAsset' => 'Asset\Controller\ServiceAssetController',
            'ProcessAsset' => 'Asset\Controller\ProcessAssetController',
            'LocationAsset' => 'Asset\Controller\LocationAssetController',
        )
    ),
    'router' => array(
        'routes' => array(
            'asset' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/asset[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Asset',
                        'action' => 'index'
                    )
                )
            ),
            'assettype' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/assettype[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'AssetType',
                        'action' => 'index'
                    )
                )
            ),
            'assetgroup' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/assetgroup[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'AssetGroup',
                        'action' => 'index'
                    )
                )
            ),
            'serverasset' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/serverasset[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ServerAsset',
                        'action' => 'index'
                    )
                )
            ),
            'serviceasset' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/serviceasset[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ServiceAsset',
                        'action' => 'index'
                    )
                )
            ),
            'processasset' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/processasset[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ProcessAsset',
                        'action' => 'index'
                    )
                )
            ),
            'locationasset' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/locationasset[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'LocationAsset',
                        'action' => 'index'
                    )
                )
            )
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
