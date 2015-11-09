<?php

namespace Asset\Entity;

use Zend\Form\Annotation;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;


/**
 * @ORM\Entity
 * @ORM\Table(name="processasset")
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("ProcessAsset")
 *  
 */
class ProcessAsset extends Asset {    
    
    /**
     * @ORM\ManyToOne(targetEntity="Asset\Entity\ProcessAsset")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="id")
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({"label":"Parent:", "empty_option":"Please select..."})
     *
     * @var \Asset\Entity\ProcessAsset
     * @access protected
     */
    protected $parent;
    
    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\ProcessAsset")
     * @ORM\JoinTable(name="previous_process",
     *      joinColumns={@ORM\JoinColumn(name="previous_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id", referencedColumnName="id")}
     *      )
     * @Annotation\Type("DoctrineORMModule\Form\Element\EntitySelect")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Previous:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\ProcessAsset
     * @access protected
     */
    protected $previous;

    /**
     * @ORM\ManyToMany(targetEntity="Asset\Entity\ProcessAsset")
     * @ORM\JoinTable(name="next_process",
     *      joinColumns={@ORM\JoinColumn(name="next_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id", referencedColumnName="id")}
     *      )
     * @ORM\JoinColumn(name="process_next_id", referencedColumnName="id")
     * @Annotation\Required(false)
     * @Annotation\Options({"label":"Next:"})
     * @Annotation\Attributes({"multiple":"multiple"})
     *
     * @var \Asset\Entity\ProcessAsset
     * @access protected
     */
    protected $next;
    
    
    public function __construct() {
    }

    public function exchangeArray($data) {
        $this->ipaddress = (isset($data ['ipaddress'])) ? $data ['ipaddress'] : null;
        $this->services = (isset($data ['services'])) ? $data ['services'] : null;
    }

    public function __toString() {
        return sprintf('%s', $this->getName());
    }

    public function getIpaddress() {
        return $this->ipaddress;
    }

    public function setIpaddress($ipaddress) {
        $this->ipaddress = $ipaddress;
        return $ipaddress;
    }
    
}
