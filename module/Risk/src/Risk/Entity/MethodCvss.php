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
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Attack Vector:",
     *                      "value_options" : {
     *                      "85": "Network",
     *                      "62": "Adjacent",
     *                      "55": "Local",
     *                      "2": "Phisical"}                 
     *                      })
     */
    protected $attackvector;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Attack Complexity:",
     *                      "value_options" : {
     *                      "77": "Low",
     *                      "44": "High"}
     *                      })
     */
    protected $attackcomplexity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Privilege Required:",
     *                      "value_options" : {
     *                      "85": "None",
     *                      "62": "Low",
     *                      "27": "High"}
     *                      })
     */
    protected $privilegerequired;   
    
    
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"User Interaction:",
     *                      "value_options" : {
     *                      "85": "Not Required",
     *                      "62": "Required"}
     *                      })
     */
    protected $userinteraction;
            
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Confidentiality:",
     *                      "value_options" : {
     *                      "56": "High",
     *                      "22": "Low",
     *                      "0": "None"}
     *                      })
     */
    protected $confidentiality;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Integrity:",
     *                      "value_options" : {
     *                      "56": "High",
     *                      "22": "Low",
     *                      "0": "None"}
     *                      })
     */
    protected $integrity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Availability:",
     *                      "value_options" : {
     *                      "56": "High",
     *                      "22": "Low",
     *                      "0": "None"}
     *                      }) 
     */    
    protected $availability;
    
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Scope:",
     *                      "value_options" : {
     *                      "642": "Unchanged",
     *                      "752": "Changed"}
     *                      })
     */
    protected $scope;
    
    //Temporal
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Exploitability:",
     *                      "value_options" : {
     *                      "91": "Unproven",
     *                      "94": "Proof-of-concept",
     *                      "97": "Functional",
     *                      "100": "High",
     *                      "+100": "Not Defined"}
     *                      })    
     */
    protected $exploitability;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Remediation Level:",
     *                      "value_options" : {
     *                      "95": "Official Fix",
     *                      "96": "Temporaly Fix",
     *                      "97": "Workaround",
     *                      "100": "Unavailable",
     *                      "+100": "Not Defined"}
     *                      })   
     */
    protected $remediationlevel;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Report Confidence:",
     *                      "value_options" : {
     *                      "92": "Unknown",
     *                      "96": "Reasonable",
     *                      "100": "Confirmed ",
     *                      "+100": "Not Defined"}
     *                      })     
     */
    protected $reportconfidence;
    
    
    //Environmental
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Confidentiality Requirements:",
     *                      "value_options" : {
     *                      "+100": "Not Defined",
     *                      "50": "Low",
     *                      "100": "Medium",
     *                      "150": "High"}
     *                      })
     */
    protected $reqconfidentiality;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Integrity Requirements:",
     *                      "value_options" : {
     *                      "+100": "Not Defined",
     *                      "50": "Low",
     *                      "100": "Medium",
     *                      "150": "High"}
     *                      })
     */
    protected $reqintegrity;
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Availability Requirements:",
     *                      "value_options" : {
     *                      "+100": "Not Defined",
     *                      "50": "Low",
     *                      "100": "Medium",
     *                      "150": "High"}
     *                      })    
     */
    protected $reqavailability;
    

    // Modifiers Environmental Scope 
    
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Attack Vector:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "85": "Network",
     *                      "62": "Adjacent",
     *                      "55": "Local",
     *                      "2": "Phisical"}                 
     *                      })
     */    
    protected $mattackvector;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Attack Complexity:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "77": "Low",
     *                      "44": "High"}
     *                      })
     */
    protected $mattackcomplexity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Privilege Required:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "85": "None",
     *                      "62": "Low",
     *                      "27": "High"}
     *                      })
     */
    protected $mprivilegerequired;   
    
    
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified User Interaction:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "85": "Not Required",
     *                      "62": "Required"}
     *                      })
     */
    protected $muserinteraction;
            
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Confidentiality:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "56": "High",
     *                      "22": "Low",
     *                      "0": "None"}
     *                      })
     */
    protected $mconfidentiality;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Integrity:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "56": "High",
     *                      "22": "Low",
     *                      "0": "None"}
     *                      })
     */
    protected $mintegrity;

    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Availability:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "56": "High",
     *                      "22": "Low",
     *                      "0": "None"}
     *                      }) 
     */    
    protected $mavailability;
    
    /**
     * @ORM\Column(type="integer")
     * @Annotation\Type("Zend\Form\Element\Radio")
     * @Annotation\Required({"required":"true" })
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Modified Scope:",
     *                      "value_options" : {
     *                      "+100": "Not defined",
     *                      "642": "Unchanged",
     *                      "752": "Changed"}
     *                      })
     */
    protected $mscope;
    

    public function exchangeArray($data) {

        $this->attackvector = (isset($data ['attackvector'])) ? $data ['attackvector'] : null;
        $this->attackcomplexity = (isset($data ['attackcomplexity'])) ? $data ['attackcomplexity'] : null;
        $this->privilegerequired = (isset($data ['privilegerequired'])) ? $data ['privilegerequired'] : null;
        $this->userinteraction = (isset($data ['userinteraction'])) ? $data ['userinteraction'] : null;
        $this->confidentiality = (isset($data ['confidentiality'])) ? $data ['confidentiality'] : null;
        $this->integrity = (isset($data ['integrity'])) ? $data ['integrity'] : null;
        $this->availability = (isset($data ['availability'])) ? $data ['availability'] : null;       
        $this->scope = (isset($data ['scope'])) ? $data ['scope'] : null;
        
        $this->mattackvector = (isset($data ['mattackvector'])) ? $data ['mattackvector'] : null;
        $this->mattackcomplexity = (isset($data ['mattackcomplexity'])) ? $data ['mattackcomplexity'] : null;
        $this->mprivilegerequired = (isset($data ['mprivilegerequired'])) ? $data ['mprivilegerequired'] : null;
        $this->muserinteraction = (isset($data ['muserinteraction'])) ? $data ['muserinteraction'] : null;
        $this->mconfidentiality = (isset($data ['mconfidentiality'])) ? $data ['mconfidentiality'] : null;
        $this->mintegrity = (isset($data ['mintegrity'])) ? $data ['mintegrity'] : null;
        $this->mavailability = (isset($data ['mavailability'])) ? $data ['mavailability'] : null;       
        $this->mscope = (isset($data ['mscope'])) ? $data ['mscope'] : null;
        
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

    public function getAttackcomplexity() {
        return $this->attackcomplexity;
    }

    public function setAttackcomplexity($attackcomplexity) {
        $this->attackcomplexity = $attackcomplexity;
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
    
    public function getScope() {
        return $this->scope;
    }

    public function setScope($scope) {
        $this->scope = $scope;
        return $this;
    }
    
    public function getMattackvector() {
        return $this->mattackvector;
    }

    public function setMattackvector($mattackvector) {
        $this->mattackvector = $mattackvector;
        return $this;
    }

    public function getMattackcomplexity() {
        return $this->mattackcomplexity;
    }

    public function setMattackcomplexity($mattackcomplexity) {
        $this->mattackcomplexity = $mattackcomplexity;
        return $this;
    }

    public function getMprivilegerequired() {
        return $this->mprivilegerequired;
    }

    public function setMprivilegerequired($mprivilegerequired) {
        $this->mprivilegerequired = $mprivilegerequired;
        return $this;
    }
    
    public function getMuserinteraction() {
        return $this->muserinteraction;
    }

    public function setMuserinteraction($muserinteraction) {
        $this->muserinteraction = $muserinteraction;
        return $this;
    }

    public function getMconfidentiality() {
        return $this->mconfidentiality;
    }

    public function setMconfidentiality($mconfidentiality) {
        $this->mconfidentiality = $mconfidentiality;
        return $this;
    }

    public function getMintegrity() {
        return $this->mintegrity;
    }

    public function setMintegrity($mintegrity) {
        $this->mintegrity = $mintegrity;
        return $this;
    }

    public function getMavailability() {
        return $this->mavailability;
    }

    public function setMavailability($mavailability) {
        $this->mavailability = $mavailability;
        return $this;
    }
    
    public function getMscope() {
        return $this->mscope;
    }

    public function setMscope($mscope) {
        $this->mscope = $mscope;
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
