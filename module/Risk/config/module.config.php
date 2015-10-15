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
            'RiskStatus' => 'Risk\Controller\RiskStatusController',
            'RiskReview' => 'Risk\Controller\RiskReviewController',
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
            'ControlType' => 'Risk\Controller\ControlTypeController',
            'ControlStatus' => 'Risk\Controller\ControlStatusController',
            'ControlReview' => 'Risk\Controller\ControlReviewController',
            
            'Plan' => 'Risk\Controller\PlanController',
            'PlanStatus' => 'Risk\Controller\PlanStatusController',
            'PlanStrategy' => 'Risk\Controller\PlanStrategyController',
            'PlanEffort' => 'Risk\Controller\PlanEffortController',
            'PlanReview' => 'Risk\Controller\PlanReviewController',
            
            'Compliance' => 'Risk\Controller\ComplianceController',
            'ComplianceType' => 'Risk\Controller\ComplianceTypeController',
            'ComplianceRule' => 'Risk\Controller\ComplianceRuleController',
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
            'riskstatus' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/riskstatus[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'RiskStatus',
                        'action' => 'index'
                    )
                )
            ),
            'riskreview' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/riskreview[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'RiskReview',
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
            'controltype' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/controltype[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ControlType',
                        'action' => 'index'
                    )
                )
            ),
            'controlstatus' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/controlstatus[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ControlStatus',
                        'action' => 'index'
                    )
                )
            ),
            'controlreview' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/controlreview[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ControlReview',
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
            ),
            'planreview' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/planreview[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'PlanReview',
                        'action' => 'index'
                    )
                )
            ),
            'compliance' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/compliance[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'Compliance',
                        'action' => 'index'
                    )
                )
            ),
            'compliancetype' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/compliancetype[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ComplianceType',
                        'action' => 'index'
                    )
                )
            ),
            'compliancerule' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/compliancerule[/][:action[/:id]]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ),
                    'defaults' => array(
                        'controller' => 'ComplianceRule',
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