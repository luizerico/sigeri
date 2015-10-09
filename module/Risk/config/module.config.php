<?php

namespace Risk;

return array(
    'doctrine' => array(
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
            'Risk' => 'Risk\Controller\RiskController',
            'RiskType' => 'Risk\Controller\RiskTypeController',
            'RiskManager' => 'Risk\Controller\RiskManagerController',
            
            'Impact' => 'Risk\Controller\ImpactController',
            'Probability' => 'Risk\Controller\ProbabilityController',
            
            'Vulnerability' => 'Risk\Controller\VulnerabilityController',
            'VulnerabilityType' => 'Risk\Controller\VulnerabilityTypeController',
            'VulnerabilityLevel' => 'Risk\Controller\VulnerabilityLevelController',
            
            'Threat' => 'Risk\Controller\ThreatController',
            'ThreatLevel' => 'Risk\Controller\ThreatLevelController',
            'ThreatSource' => 'Risk\Controller\ThreatSourceController',
            'ThreatType' => 'Risk\Controller\ThreatTypeController',
            
            'Control' => 'Risk\Controller\ControlController',
            
            'Plan' => 'Risk\Controller\PlanController',
            'PlanStatus' => 'Risk\Controller\PlanStatusController',
            'PlanStrategy' => 'Risk\Controller\PlanStrategyController',
            'PlanEffort' => 'Risk\Controller\PlanEffortController',
        )
    ),
    'router' => array(
        'routes' => array(
            'risk' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/risk[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Risk',
                        'action' => 'index'
                    )
                )
            ),
            'risktype' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/risktype[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'RiskType',
                        'action' => 'index'
                    )
                )
            ),
            'riskmanager' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/riskmanager[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'RiskManager',
                        'action' => 'index'
                    )
                )
            ),
            'impact' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/impact[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Impact',
                        'action' => 'index'
                    )
                )
            ),
            'probability' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/probability[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Probability',
                        'action' => 'index'
                    )
                )
            ),
            'vulnerability' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/vulnerability[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Vulnerability',
                        'action' => 'index'
                    )
                )
            ),
            'vulnerabilitytype' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/vulnerabilitytype[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'VulnerabilityType',
                        'action' => 'index'
                    )
                )
            ),
            'vulnerabilitylevel' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/vulnerabilitylevel[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'VulnerabilityLevel',
                        'action' => 'index'
                    )
                )
            ),
            'threat' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/threat[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Threat',
                        'action' => 'index'
                    )
                )
            ),
            'threatlevel' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/threatlevel[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ThreatLevel',
                        'action' => 'index'
                    )
                )
            ),
            'threattype' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/threattype[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ThreatType',
                        'action' => 'index'
                    )
                )
            ),
            'threatsource' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/threatsource[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ThreatSource',
                        'action' => 'index'
                    )
                )
            ),
            'control' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/control[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Control',
                        'action' => 'index'
                    )
                )
            ),
            'plan' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/plan[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Plan',
                        'action' => 'index'
                    )
                )
            ),
            'planeffort' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/planeffort[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'PlanEffort',
                        'action' => 'index'
                    )
                )
            ),
            'planstrategy' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/planstrategy[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'PlanStrategy',
                        'action' => 'index'
                    )
                )
            ),
            'planstatus' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/planstatus[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'PlanStatus',
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
        ),
        'strategies' => array('ViewJsonStrategy'),
    ),
    // Placeholder for console routes
    'console' => array(
        'router' => array(
            'routes' => array()
        )
    )
);