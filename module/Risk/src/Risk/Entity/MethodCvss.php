<?php

namespace Risk\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="methodcvss")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("MethodCvss")
 *  
 */
class MethodCvss extends Method {
    // Base

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Attack Vector:",
     *                      "value_options" : {
     *                      ".85": "Network",
     *                      ".62": "Adjacent",
     *                      ".55": "Local",
     *                      ".2": "Phisical"}
     *                      })   
     */
    protected $attackvector;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Atack Complexity:",
     *                      "value_options" : {
     *                      ".77": "Low",
     *                      ".44": "High"}
     *                      })    
     */
    protected $atackcomplexity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Privilege Required:",
     *                      "value_options" : {
     *                      ".85": "None",
     *                      ".62": "Low",
     *                      ".27": "High"}
     *                      })   
     */
    protected $privilegerequired;
    
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"User Interaction:",
     *                      "value_options" : {
     *                      ".85": "None",
     *                      ".62": "Low",
     *                      ".27": "High"}
     *                      })     
     */
    protected $userinteraction;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Confidentiality:",
     *                      "value_options" : {
     *                      ".85": "Not Required",
     *                      ".62": "Required"}
     *                      })    
     */
    protected $confidentiality;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Integrity:",
     *                      "value_options" : {
     *                      ".56": "High",
     *                      ".22": "Low",
     *                      "0": "None"}
     *                      })    
     */
    protected $integrity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Availability:",
     *                      "value_options" : {
     *                      ".56": "High",
     *                      ".22": "Low",
     *                      "0": "None"}
     *                      })  
     */    
    protected $availability;
    
    //Temporal
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Exploitability:",
     *                      "value_options" : {
     *                      ".91": "Unproven",
     *                      ".94": "Proof-of-concept",
     *                      ".97": "Functional",
     *                      "1.0": "High",
     *                      "1": "Not Defined"}
     *                      })    
     */
    protected $exploitability;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Remediation Level:",
     *                      "value_options" : {
     *                      ".95": "Official Fix",
     *                      ".96": "Temporaly Fix",
     *                      ".97": "Workaround",
     *                      "1.0": "Unavailable",
     *                      "1": "Not Defined"}
     *                      })
     * @Annotation\Attributes({"value":"0"})     
     */
    protected $remediationlevel;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Report Confidence:",
     *                      "value_options" : {
     *                      ".92": "Unknown",
     *                      ".96": "Reasonable",
     *                      "1.0": "Confirmed ",
     *                      "1": "Not Defined"}
     *                      })
     * @Annotation\Attributes({"value":"0"})     
     */
    protected $reportconfidence;
    
    
    //Environmental
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Confidentiality Requirements:",
     *                      "value_options" : {
     *                      "0.5": "Low",
     *                      "1.0": "Medium",
     *                      "1.5": "High",
     *                      "1": "Not Defined"}
     *                      })
     * @Annotation\Attributes({"value":"10"})     
     */
    protected $reqconfidentiality;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Integrity Requirements:",
     *                      "value_options" : {
     *                      "0.5": "Low",
     *                      "1.0": "Medium",
     *                      "1.5": "High",
     *                      "1": "Not Defined"}
     *                      })
     * @Annotation\Attributes({"value":"10"})     
     */
    protected $reqintegrity;
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Availability Requirements:",
     *                      "value_options" : {
     *                      "0.5": "Low",
     *                      "1.0": "Medium",
     *                      "1.5": "High",
     *                      "1": "Not Defined"}
     *                      })
     * @Annotation\Attributes({"value":"10"})     
     */
    protected $reqavailability;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Potential Collateral Damage:",
     *                      "value_options" : {
     *                      "1": "1 - High",
     *                      "2": "2 - Medium-High",
     *                      "2": "2 - Low-Medium",
     *                      "3": "3 - Low"}
     *                      })
     * @Annotation\Attributes({"value":"0"})     
     */
    protected $collateraldamage;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Select")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Target Distribution:",
     *                      "value_options" : {
     *                      "0": "0 - None",
     *                      "25": "1-25% - Low",
     *                      "75": "26-75% - Medium",
     *                      "100": "76-100% - High"}
     *                      })
     * @Annotation\Attributes({"value":"0"})     
     */
    protected $targetdistribution;
    

    public function exchangeArray($data) {

        $this->attackvector = (isset($data ['attackvector'])) ? $data ['attackvector'] : null;
        $this->atackcomplexity = (isset($data ['atackcomplexity'])) ? $data ['atackcomplexity'] : null;
        $this->privilegerequired = (isset($data ['privilegerequired'])) ? $data ['privilegerequired'] : null;
        $this->userinteraction = (isset($data ['userinteraction'])) ? $data ['userinteraction'] : null;
        $this->confidentiality = (isset($data ['confidentiality'])) ? $data ['confidentiality'] : null;
        $this->integrity = (isset($data ['integrity'])) ? $data ['integrity'] : null;
        $this->availability = (isset($data ['availability'])) ? $data ['availability'] : null;
        
        $this->reqconfidentiality = (isset($data ['reqconfidentiality'])) ? $data ['reqconfidentiality'] : null;
        $this->reqintegrity = (isset($data ['reqintegrity'])) ? $data ['reqintegrity'] : null;
        $this->reqavailability = (isset($data ['reqavailability'])) ? $data ['reqavailability'] : null;
        $this->collateraldamage = (isset($data ['collateraldamage'])) ? $data ['collateraldamage'] : null;
        $this->targetdistribution = (isset($data ['targetdistribution'])) ? $data ['targetdistribution'] : null;
        
        $this->exploitability = (isset($data ['exploitability'])) ? $data ['exploitability'] : null;
        $this->remediationlevel = (isset($data ['remediationlevel'])) ? $data ['remediationlevel'] : null;
        $this->reportconfidence = (isset($data ['reportconfidence'])) ? $data ['reportconfidence'] : null;
    }

    public function getAttackvector() {
        return $this->attackvector;
    }

    public function setAttackvector($attackvector) {
        $this->attackvector = $attackvector;
        return $this;
    }

    public function getAtackcomplexity() {
        return $this->atackcomplexity;
    }

    public function setAtackcomplexity($atackcomplexity) {
        $this->atackcomplexity = $atackcomplexity;
        return $this;
    }

    public function getPrivilegerequired() {
        return $this->privilegerequired;
    }

    public function setPrivilegerequired($privilegerequired) {
        $this->privilegerequired = $privilegerequired;
        return $this;
    }
    
    public function getUserinteraction() {
        return $this->userinteraction;
    }

    public function setUserinteraction($userinteraction) {
        $this->userinteraction = $userinteraction;
        return $this;
    }

    public function getConfidentiality() {
        return $this->confidentiality;
    }

    public function setConfidentiality($confidentiality) {
        $this->confidentiality = $confidentiality;
        return $this;
    }

    public function getIntegrity() {
        return $this->integrity;
    }

    public function setIntegrity($integrity) {
        $this->integrity = $integrity;
        return $this;
    }

    public function getAvailability() {
        return $this->availability;
    }

    public function setAvailability($availability) {
        $this->availability = $availability;
        return $this;
    }

    public function getReqconfidentiality() {
        return $this->reqconfidentiality;
    }

    public function setReqconfidentiality($reqconfidentiality) {
        $this->reqconfidentiality = $reqconfidentiality;
        return $this;
    }

    public function getReqintegrity() {
        return $this->reqintegrity;
    }

    public function setReqintegrity($reqintegrity) {
        $this->reqintegrity = $reqintegrity;
        return $this;
    }

    public function getReqavailability() {
        return $this->reqavailability;
    }

    public function setReqavailability($reqavailability) {
        $this->reqavailability = $reqavailability;
        return $this;
    }

    public function getCollateraldamage() {
        return $this->collateraldamage;
    }

    public function setCollateraldamage($collateraldamage) {
        $this->collateraldamage = $collateraldamage;
        return $this;
    }

    public function getTargetdistribution() {
        return $this->targetdistribution;
    }

    public function setTargetdistribution($targetdistribution) {
        $this->targetdistribution = $targetdistribution;
        return $this;
    }

    public function getExploitability() {
        return $this->exploitability;
    }

    public function setExploitability($exploitability) {
        $this->exploitability = $exploitability;
        return $this;
    }

    public function getRemediationlevel() {
        return $this->remediationlevel;
    }

    public function setRemediationlevel($remediationlevel) {
        $this->remediationlevel = $remediationlevel;
        return $this;
    }

    public function getReportconfidence() {
        return $this->reportconfidence;
    }

    public function setReportconfidence($reportconfidence) {
        $this->reportconfidence = $reportconfidence;
        return $this;
    }

}
