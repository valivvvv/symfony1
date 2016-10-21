<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="AppBundle\Repository\GenusRepository")
 * @ORM\Table(name="genus")
 */
class Genus
{
	/**
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer")
     */
    private $id;
    /**
     * @ORM\Column(type="string")
     */
    private $name;
    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\SubFamily")
     * @ORM\JoinColumn(nullable=false)
     */
    private $subFamily;
    /**
     * @ORM\Column(type="integer")
     */
    private $speciesCount;
    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $funFact;
	
	/**
     * @ORM\Column(type="boolean")
     */
    private $isPublished = true;
	
	/**
     * @ORM\Column(type="date")
     */
    private $firstDiscoveredAt;
	
	/**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\GenusNote", mappedBy="genus")
	 * @ORM\OrderBy({"createdAt" = "DESC"})
     */
	private $notes;
	
	public function __construct()
    {
        $this->notes = new ArrayCollection();
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Genus
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return SubFamily
     */
    public function getSubFamily()
    {
        return $this->subFamily;
    }
	
    public function setSubFamily(SubFamily $subFamily)
    {
        $this->subFamily = $subFamily;
    }

    /**
     * Set speciesCount
     *
     * @param integer $speciesCount
     *
     * @return Genus
     */
    public function setSpeciesCount($speciesCount)
    {
        $this->speciesCount = $speciesCount;

        return $this;
    }

    /**
     * Get speciesCount
     *
     * @return integer
     */
    public function getSpeciesCount()
    {
        return $this->speciesCount;
    }

    /**
     * Set funFact
     *
     * @param string $funFact
     *
     * @return Genus
     */
    public function setFunFact($funFact)
    {
        $this->funFact = $funFact;

        return $this;
    }

    /**
     * Get funFact
     *
     * @return string
     */
    public function getFunFact()
    {
        return '**TEST** '.$this->funFact;
    }
	
	public function getUpdatedAt()
    {
        return new \DateTime('-'.rand(0, 100).' days');
    }

    /**
     * Set isPublished
     *
     * @param boolean $isPublished
     *
     * @return Genus
     */
    public function setIsPublished($isPublished)
    {
        $this->isPublished = $isPublished;

        return $this;
    }

    /**
     * Get isPublished
     *
     * @return boolean
     */
    public function getIsPublished()
    {
        return $this->isPublished;
    }
	
	/**
     * @return ArrayCollection|GenusNote[]
     */
	public function getNotes()
    {
        return $this->notes;
    }
	
	public function getFirstDiscoveredAt()
    {
        return $this->firstDiscoveredAt;
    }
	
    public function setFirstDiscoveredAt(\DateTime $firstDiscoveredAt = null)
    {
        $this->firstDiscoveredAt = $firstDiscoveredAt;
    }
}
