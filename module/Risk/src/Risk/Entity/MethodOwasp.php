<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="methodowasp")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("MethodOwasp")
 */
class MethodOwasp extends Method {

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Skill Level:",
     *                      "value_options" : {
     *                      "1": "1 - No technical skills",
     *                      "2": "2 - Some technical skills",
     *                      "3": "3 - Some technical skills",
     *                      "4": "4 - Advanced computer user",
     *                      "5": "5 - Advanced computer user",
     *                      "6": "6 - Network and programming skills",
     *                      "7": "7 - Network and programming skills",
     *                      "8": "8 - Network and programming skills",
     *                      "9": "9 - Security penetration skills",
     *                      "10": "10 - Security penetration skills"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $skilllevel;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Motive:",
     *                      "value_options" : {
     *                      "1": "1 - Low or no reward",
     *                      "2": "2 - Low or no reward",
     *                      "3": "3 - Low or no reward",
     *                      "4": "4 - Low or no reward",
     *                      "5": "5 - Possible reward",
     *                      "6": "6 - Possible reward",
     *                      "7": "7 - Possible reward",
     *                      "8": "8 - Possible reward",
     *                      "9": "9 - High reward",
     *                      "10": "10 - High reward"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $motive;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Oportunity:",
     *                      "value_options" : {
     *                      "1": "1 - Full access or expensive resources required",
     *                      "2": "2 - Full access or expensive resources required",
     *                      "3": "3 - Full access or expensive resources required",
     *                      "4": "4 - Special access or resources required",
     *                      "5": "5 - Special access or resources required",
     *                      "6": "6 - Special access or resources required",
     *                      "7": "7 - Some access or resources required",
     *                      "8": "8 - Some access or resources required",
     *                      "9": "9 - No access or resources required",
     *                      "10": "10 - No access or resources required"}
     *                      })
     * @Annotation\Attributes({"value":"10"})     
     */
    protected $opportunity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Size:",
     *                      "value_options" : {
     *                      "1": "1 - Developers / System administrators",
     *                      "2": "2 - Developers / System administrators",
     *                      "3": "3 - Intranet users",
     *                      "4": "4 - Intranet users",
     *                      "5": "5 - Partners",
     *                      "6": "6 - Authenticated users",
     *                      "7": "7 - Authenticated users",
     *                      "8": "8 - Authenticated users",
     *                      "9": "9 -  Anonymous Internet users",
     *                      "10": "10 - Anonymous Internet users"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $size;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Ease of Discovery:",
     *                      "value_options" : {
     *                      "1": "1 - Practically impossible",
     *                      "2": "2 - Practically impossible",
     *                      "3": "3 - Practically impossible",
     *                      "4": "4 - Difficult",
     *                      "5": "5 - Difficult",
     *                      "6": "6 - Difficult",
     *                      "7": "7 - Easy",
     *                      "8": "8 - Easy",
     *                      "9": "9 - Automated tools available",
     *                      "10": "10 - Automated tools available"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $easediscovery;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Ease of Exploit:",
     *                      "value_options" : {
     *                      "1": "1 - Theoretical",
     *                      "2": "2 - Theoretical",
     *                      "3": "3 - Difficult",
     *                      "4": "4 - Difficult",
     *                      "5": "5 - Easy",
     *                      "6": "6 - Easy",
     *                      "7": "7 - Easy",
     *                      "8": "8 - Easy",
     *                      "9": "9 - Automated tools available",
     *                      "10": "10 - Automated tools available"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $easeexploit;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Awareness:",
     *                      "value_options" : {
     *                      "1": "1 - Unknown",
     *                      "2": "2 - Unknown",
     *                      "3": "3 - Unknown",
     *                      "4": "4 - Hidden",
     *                      "5": "5 - Hidden",
     *                      "6": "6 - Obvious",
     *                      "7": "7 - Obvious",
     *                      "8": "8 - Obvious",
     *                      "9": "9 - Public knowledge",
     *                      "10": "10 - Public knowledge"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $awareness;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Intrusion Detection:",
     *                      "value_options" : {
     *                      "1": "1 - Active detection in application",
     *                      "2": "2 - Active detection in application",
     *                      "3": "3 - Logged and reviewed",
     *                      "4": "4 - Logged and reviewed",
     *                      "5": "5 - Logged and reviewed",
     *                      "6": "6 - Logged and reviewed",
     *                      "7": "7 - Logged and reviewed",
     *                      "8": "8 - Logged without review",
     *                      "9": "9 - Not logged",
     *                      "10": "10 - Not logged"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $intrusiondetection;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Loss of Confidentiality:",
     *                      "value_options" : {
     *                      "1": "1 - Minimal non-sensitive data disclosed",
     *                      "2": "2 - Minimal non-sensitive data disclosed",
     *                      "3": "3 - Minimal critical data disclosed",
     *                      "4": "4 - Minimal critical data disclosed",
     *                      "5": "5 - Minimal critical data disclosed",
     *                      "6": "6 - Minimal critical data disclosed",
     *                      "7": "7 - Extensive critical data disclosed",
     *                      "8": "8 - Extensive critical data disclosed",
     *                      "9": "9 - All data disclosed",
     *                      "10": "10 - All data disclosed"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $lossconfidentiality;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Loss of Integrity:",
     *                      "value_options" : {
     *                      "1": "1 - Minimal slightly corrupt data",
     *                      "2": "2 - Minimal slightly corrupt data",
     *                      "3": "3 - minimal seriously corrupt data",
     *                      "4": "4 - minimal seriously corrupt data",
     *                      "5": "5 - extensive slightly corrupt data",
     *                      "6": "6 - extensive slightly corrupt data",
     *                      "7": "7 - extensive seriously corrupt data",
     *                      "8": "8 - extensive seriously corrupt data",
     *                      "9": "9 - all data totally corrupt",
     *                      "10": "10 - all data totally corrupt"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $lossintegrity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Loss of Availability:",
     *                      "value_options" : {
     *                      "1": "1 - Minimal secondary services interrupted",
     *                      "2": "2 - Minimal secondary services interrupted",
     *                      "3": "3 - Minimal secondary services interrupted",
     *                      "4": "4 - Minimal secondary services interrupted",
     *                      "5": "5 - Minimal primary services interrupted",
     *                      "6": "6 - Minimal primary services interrupted",
     *                      "7": "7 - Extensive primary services interrupted",
     *                      "8": "8 - Extensive primary services interrupted",
     *                      "9": "9 - All services completely lost",
     *                      "10": "10 - All services completely lost"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $lossavailability;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Loss of Accountability:",
     *                      "value_options" : {
     *                      "1": "1 - Fully traceable",
     *                      "2": "2 - Fully traceable",
     *                      "3": "3 - Fully traceable",
     *                      "4": "4 - Fully traceable",
     *                      "5": "5 - Fully traceable",
     *                      "6": "6 - Fully traceable",
     *                      "7": "7 - Possibly traceable",
     *                      "8": "8 - Possibly traceable",
     *                      "9": "9 - Completely anonymous",
     *                      "10": "10 - Completely anonymous"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $lossaccountability;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Financial Damage:",
     *                      "value_options" : {
     *                      "1": "1 - Less than the cost to fix the vulnerability",
     *                      "2": "2 - Less than the cost to fix the vulnerability",
     *                      "3": "3 - Minor effect on annual profit",
     *                      "4": "4 - Minor effect on annual profit",
     *                      "5": "5 - Minor effect on annual profit",
     *                      "6": "6 - Minor effect on annual profit",
     *                      "7": "7 - Significant effect on annual profit",
     *                      "8": "8 - Significant effect on annual profit",
     *                      "9": "9 - Bankruptcy",
     *                      "10": "10 - Bankruptcy"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $financialdamage;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Reputation Damage:",
     *                      "value_options" : {
     *                      "1": "1 - Minimal damage",
     *                      "2": "2 - Minimal damage",
     *                      "3": "3 - Minimal damage",
     *                      "4": "4 - Loss of major accounts",
     *                      "5": "5 - Loss of goodwill",
     *                      "6": "6 - Loss of goodwill",
     *                      "7": "7 - Loss of goodwill",
     *                      "8": "8 - Loss of goodwill",
     *                      "9": "9 - Brand damage",
     *                      "10": "10 - Brand damage"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $reputationdamage;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Non-Compliance:",
     *                      "value_options" : {
     *                      "1": "1 - Minor violation",
     *                      "2": "2 - Minor violation",
     *                      "3": "3 - Minor violation",
     *                      "4": "4 - Minor violation",
     *                      "5": "5 - Clear violation",
     *                      "6": "6 - Clear violation",
     *                      "7": "7 - High profile violation",
     *                      "8": "8 - High profile violation",
     *                      "9": "9 - High profile violation",
     *                      "10": "10 - High profile violation"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $noncompliance;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Privacy Violation:",
     *                      "value_options" : {
     *                      "1": "1 - One individual",
     *                      "2": "2 - One individual",
     *                      "3": "3 - One individual",
     *                      "4": "4 - Hundreds of people",
     *                      "5": "5 - Hundreds of people",
     *                      "6": "6 - Thousands of people",
     *                      "7": "7 - Thousands of people",
     *                      "8": "8 - Millions of people",
     *                      "9": "9 - Millions of people",
     *                      "10": "10 - Millions of people"}
     *                      })
     * @Annotation\Attributes({"value":"10"})
     */
    protected $privacyviolation;

    public function exchangeArray($data) {
        $this->skilllevel = (isset($data ['skilllevel'])) ? $data ['skilllevel'] : null;
        $this->motive = (isset($data ['motive'])) ? $data ['motive'] : null;
        $this->opportunity = (isset($data ['opportunity'])) ? $data ['opportunity'] : null;
        $this->size = (isset($data ['size'])) ? $data ['size'] : null;
        $this->easediscovery = (isset($data ['easediscovery'])) ? $data ['easediscovery'] : null;
        $this->easeexploit = (isset($data ['easeexploit'])) ? $data ['easeexploit'] : null;
        $this->awareness = (isset($data ['awareness'])) ? $data ['awareness'] : null;
        $this->intrusiondetection = (isset($data ['intrusiondetection'])) ? $data ['intrusiondetection'] : null;
        $this->lossconfidentiality = (isset($data ['lossconfidentiality'])) ? $data ['lossconfidentiality'] : null;
        $this->lossintegrity = (isset($data ['lossintegrity'])) ? $data ['lossintegrity'] : null;
        $this->lossavailability = (isset($data ['lossavailability'])) ? $data ['lossavailability'] : null;
        $this->lossaccountability = (isset($data ['lossaccountability'])) ? $data ['lossaccountability'] : null;
        $this->financialdamage = (isset($data ['financialdamage'])) ? $data ['financialdamage'] : null;
        $this->reputationdamage = (isset($data ['reputationdamage'])) ? $data ['reputationdamage'] : null;
        $this->noncompliance = (isset($data ['noncompliance'])) ? $data ['noncompliance'] : null;
        $this->privacyviolation = (isset($data ['privacyviolation'])) ? $data ['privacyviolation'] : null;
    }

    public function getSkilllevel() {
        return $this->skilllevel;
    }

    public function setSkilllevel($skilllevel) {
        $this->skilllevel = $skilllevel;
        return $this;
    }

    public function getMotive() {
        return $this->motive;
    }

    public function setMotive($motive) {
        $this->motive = $motive;
        return $this;
    }

    public function getOpportunity() {
        return $this->opportunity;
    }

    public function setOpportunity($opportunity) {
        $this->opportunity = $opportunity;
        return $this;
    }

    public function getSize() {
        return $this->size;
    }

    public function setSize($size) {
        $this->size = $size;
        return $this;
    }

    public function getEasediscovery() {
        return $this->easediscovery;
    }

    public function setEasediscovery($easediscovery) {
        $this->easediscovery = $easediscovery;
        return $this;
    }
    
    public function getEaseexploit() {
        return $this->easeexploit;
    }

    public function setEaseexploit($easeexploit) {
        $this->easeexploit = $easeexploit;
        return $this;
    }
    

    public function getAwareness() {
        return $this->awareness;
    }

    public function setAwareness($awareness) {
        $this->awareness = $awareness;
        return $this;
    }

    public function getIntrusiondetection() {
        return $this->intrusiondetection;
    }

    public function setIntrusiondetection($intrusiondetection) {
        $this->intrusiondetection = $intrusiondetection;
        return $this;
    }

    public function getLossconfidentiality() {
        return $this->lossconfidentiality;
    }

    public function setLossconfidentiality($lossconfidentiality) {
        $this->lossconfidentiality = $lossconfidentiality;
        return $this;
    }

    public function getLossintegrity() {
        return $this->lossintegrity;
    }

    public function setLossintegrity($lossintegrity) {
        $this->lossintegrity = $lossintegrity;
        return $this;
    }

    public function getLossavailability() {
        return $this->lossavailability;
    }

    public function setLossavailability($lossavailability) {
        $this->lossavailability = $lossavailability;
        return $this;
    }

    public function getLossaccountability() {
        return $this->lossaccountability;
    }

    public function setLossaccountability($lossaccountability) {
        $this->lossaccountability = $lossaccountability;
        return $this;
    }

    public function getFinancialdamage() {
        return $this->financialdamage;
    }

    public function setFinancialdamage($financialdamage) {
        $this->financialdamage = $financialdamage;
        return $this;
    }

    public function getReputationdamage() {
        return $this->reputationdamage;
    }

    public function setReputationdamage($reputationdamage) {
        $this->reputationdamage = $reputationdamage;
        return $this;
    }

    public function getNoncompliance() {
        return $this->noncompliance;
    }

    public function setNoncompliance($noncompliance) {
        $this->noncompliance = $noncompliance;
        return $this;
    }

    public function getPrivacyviolation() {
        return $this->privacyviolation;
    }

    public function setPrivacyviolation($privacyviolation) {
        $this->privacyviolation = $privacyviolation;
        return $this;
    }

}
