<?php

namespace DoctrineORMModule\Proxy\__CG__\Risk\Entity;

/**
 * DO NOT EDIT THIS FILE - IT WAS CREATED BY DOCTRINE'S PROXY GENERATOR
 */
class Risk extends \Risk\Entity\Risk implements \Doctrine\ORM\Proxy\Proxy
{
    /**
     * @var \Closure the callback responsible for loading properties in the proxy object. This callback is called with
     *      three parameters, being respectively the proxy object to be initialized, the method that triggered the
     *      initialization process and an array of ordered parameters that were passed to that method.
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setInitializer
     */
    public $__initializer__;

    /**
     * @var \Closure the callback responsible of loading properties that need to be copied in the cloned object
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setCloner
     */
    public $__cloner__;

    /**
     * @var boolean flag indicating if this object was already initialized
     *
     * @see \Doctrine\Common\Persistence\Proxy::__isInitialized
     */
    public $__isInitialized__ = false;

    /**
     * @var array properties to be lazy loaded, with keys being the property
     *            names and values being their default values
     *
     * @see \Doctrine\Common\Persistence\Proxy::__getLazyProperties
     */
    public static $lazyPropertiesDefaults = array();



    /**
     * @param \Closure $initializer
     * @param \Closure $cloner
     */
    public function __construct($initializer = null, $cloner = null)
    {

        $this->__initializer__ = $initializer;
        $this->__cloner__      = $cloner;
    }







    /**
     * 
     * @return array
     */
    public function __sleep()
    {
        if ($this->__isInitialized__) {
            return array('__isInitialized__', 'id', 'name', 'status', 'type', 'method', 'probability', 'impact', 'analyst', 'date', 'description', 'annotations', 'detimpact', 'regulations', 'controls', 'documents', 'revisions', 'submit');
        }

        return array('__isInitialized__', 'id', 'name', 'status', 'type', 'method', 'probability', 'impact', 'analyst', 'date', 'description', 'annotations', 'detimpact', 'regulations', 'controls', 'documents', 'revisions', 'submit');
    }

    /**
     * 
     */
    public function __wakeup()
    {
        if ( ! $this->__isInitialized__) {
            $this->__initializer__ = function (Risk $proxy) {
                $proxy->__setInitializer(null);
                $proxy->__setCloner(null);

                $existingProperties = get_object_vars($proxy);

                foreach ($proxy->__getLazyProperties() as $property => $defaultValue) {
                    if ( ! array_key_exists($property, $existingProperties)) {
                        $proxy->$property = $defaultValue;
                    }
                }
            };

        }
    }

    /**
     * 
     */
    public function __clone()
    {
        $this->__cloner__ && $this->__cloner__->__invoke($this, '__clone', array());
    }

    /**
     * Forces initialization of the proxy
     */
    public function __load()
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__load', array());
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitialized($initialized)
    {
        $this->__isInitialized__ = $initialized;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitializer(\Closure $initializer = null)
    {
        $this->__initializer__ = $initializer;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __getInitializer()
    {
        return $this->__initializer__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setCloner(\Closure $cloner = null)
    {
        $this->__cloner__ = $cloner;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific cloning logic
     */
    public function __getCloner()
    {
        return $this->__cloner__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     * @static
     */
    public function __getLazyProperties()
    {
        return self::$lazyPropertiesDefaults;
    }

    
    /**
     * {@inheritDoc}
     */
    public function exchangeArray($data)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'exchangeArray', array($data));

        return parent::exchangeArray($data);
    }

    /**
     * {@inheritDoc}
     */
    public function __toString()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, '__toString', array());

        return parent::__toString();
    }

    /**
     * {@inheritDoc}
     */
    public function getId()
    {
        if ($this->__isInitialized__ === false) {
            return (int)  parent::getId();
        }


        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getId', array());

        return parent::getId();
    }

    /**
     * {@inheritDoc}
     */
    public function setId($id)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setId', array($id));

        return parent::setId($id);
    }

    /**
     * {@inheritDoc}
     */
    public function getName()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getName', array());

        return parent::getName();
    }

    /**
     * {@inheritDoc}
     */
    public function setName($name)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setName', array($name));

        return parent::setName($name);
    }

    /**
     * {@inheritDoc}
     */
    public function getStatus()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getStatus', array());

        return parent::getStatus();
    }

    /**
     * {@inheritDoc}
     */
    public function setStatus(\Risk\Entity\RiskStatus $status)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setStatus', array($status));

        return parent::setStatus($status);
    }

    /**
     * {@inheritDoc}
     */
    public function getDescription()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDescription', array());

        return parent::getDescription();
    }

    /**
     * {@inheritDoc}
     */
    public function setDescription($description)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDescription', array($description));

        return parent::setDescription($description);
    }

    /**
     * {@inheritDoc}
     */
    public function getProbability()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getProbability', array());

        return parent::getProbability();
    }

    /**
     * {@inheritDoc}
     */
    public function setProbability(\Risk\Entity\Probability $probability)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setProbability', array($probability));

        return parent::setProbability($probability);
    }

    /**
     * {@inheritDoc}
     */
    public function getImpact()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getImpact', array());

        return parent::getImpact();
    }

    /**
     * {@inheritDoc}
     */
    public function setImpact(\Risk\Entity\Impact $impact)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setImpact', array($impact));

        return parent::setImpact($impact);
    }

    /**
     * {@inheritDoc}
     */
    public function getType()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getType', array());

        return parent::getType();
    }

    /**
     * {@inheritDoc}
     */
    public function setType(\Risk\Entity\RiskType $type)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setType', array($type));

        return parent::setType($type);
    }

    /**
     * {@inheritDoc}
     */
    public function getAnalyst()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getAnalyst', array());

        return parent::getAnalyst();
    }

    /**
     * {@inheritDoc}
     */
    public function setAnalyst(\User\Entity\User $analyst)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setAnalyst', array($analyst));

        return parent::setAnalyst($analyst);
    }

    /**
     * {@inheritDoc}
     */
    public function getFormatedDate()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getFormatedDate', array());

        return parent::getFormatedDate();
    }

    /**
     * {@inheritDoc}
     */
    public function getDate()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDate', array());

        return parent::getDate();
    }

    /**
     * {@inheritDoc}
     */
    public function setDate($date)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDate', array($date));

        return parent::setDate($date);
    }

    /**
     * {@inheritDoc}
     */
    public function getAnnotations()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getAnnotations', array());

        return parent::getAnnotations();
    }

    /**
     * {@inheritDoc}
     */
    public function setAnnotations($annotations)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setAnnotations', array($annotations));

        return parent::setAnnotations($annotations);
    }

    /**
     * {@inheritDoc}
     */
    public function getDetimpact()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDetimpact', array());

        return parent::getDetimpact();
    }

    /**
     * {@inheritDoc}
     */
    public function setDetimpact($detimpact)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDetimpact', array($detimpact));

        return parent::setDetimpact($detimpact);
    }

    /**
     * {@inheritDoc}
     */
    public function addDocuments(\Doctrine\Common\Collections\Collection $documents)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'addDocuments', array($documents));

        return parent::addDocuments($documents);
    }

    /**
     * {@inheritDoc}
     */
    public function removeDocuments(\Doctrine\Common\Collections\Collection $documents)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'removeDocuments', array($documents));

        return parent::removeDocuments($documents);
    }

    /**
     * {@inheritDoc}
     */
    public function getDocuments()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDocuments', array());

        return parent::getDocuments();
    }

    /**
     * {@inheritDoc}
     */
    public function addRevisions(\Doctrine\Common\Collections\Collection $revisions)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'addRevisions', array($revisions));

        return parent::addRevisions($revisions);
    }

    /**
     * {@inheritDoc}
     */
    public function removeRevisions(\Doctrine\Common\Collections\Collection $revisions)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'removeRevisions', array($revisions));

        return parent::removeRevisions($revisions);
    }

    /**
     * {@inheritDoc}
     */
    public function getRevisions()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getRevisions', array());

        return parent::getRevisions();
    }

    /**
     * {@inheritDoc}
     */
    public function addControls(\Doctrine\Common\Collections\Collection $controls)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'addControls', array($controls));

        return parent::addControls($controls);
    }

    /**
     * {@inheritDoc}
     */
    public function removeControls(\Doctrine\Common\Collections\Collection $controls)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'removeControls', array($controls));

        return parent::removeControls($controls);
    }

    /**
     * {@inheritDoc}
     */
    public function getControls()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getControls', array());

        return parent::getControls();
    }

    /**
     * {@inheritDoc}
     */
    public function getRegulations()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getRegulations', array());

        return parent::getRegulations();
    }

    /**
     * {@inheritDoc}
     */
    public function setControls($controls)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setControls', array($controls));

        return parent::setControls($controls);
    }

    /**
     * {@inheritDoc}
     */
    public function setRegulations($regulations)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setRegulations', array($regulations));

        return parent::setRegulations($regulations);
    }

    /**
     * {@inheritDoc}
     */
    public function getMethod()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getMethod', array());

        return parent::getMethod();
    }

}
