<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\Role\Role;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints as Assert;


/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 */
class User implements UserInterface
{
    
	 /**
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer")
     */
    private $id;
	
	/**
	 * @Assert\NotBlank()
	 * @Assert\Email(
     *     message = "The email '{{ value }}' is not a valid email.",
     *     checkMX = true
     * )
     * @ORM\Column(type="string", unique=true)
     */
	private $email;
	
	/**
     * The encoded password
     *
     * @ORM\Column(type="string")
     */
    private $password;
	
	/**
     * A non-persisted field that's used to create the encoded password.
     *
     * @var string
     */
    private $plainPassword;
	
	/**
	 * @Assert\NotBlank()
     * @ORM\Column(type="json_array")
     */
    private $roles = array();
	
    // needed by the security system
    public function getUsername()
    {
        return $this->email;
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
	
    public function getRoles()
    {
        $roles = $this->roles;
		
		// give everyone ROLE_USER!
        if (!in_array('ROLE_USER', $roles)) {
            $roles[] = 'ROLE_USER';
        }
		
		return $roles;
    }
	
	public function setRoles(array $roles)
    {
        $this->roles = $roles;
    }
	
    public function getPassword()
    {
        return $this->password;
    }
	
    public function getSalt()
    {
        // leaving blank - I don't need/have a password!
    }
	
    public function eraseCredentials()
    {
        $this->plainPassword = null;
    }
	
    public function getEmail()
    {
        return $this->email;
    }
	
    public function setEmail($email)
    {
        $this->email = $email;
    }
	
	public function setPassword($password)
    {
        $this->password = $password;
    }
	
	public function getPlainPassword()
    {
        return $this->plainPassword;
    }
	
    public function setPlainPassword($plainPassword)
    {
        $this->plainPassword = $plainPassword;
		// forces the object to look "dirty" to Doctrine. Avoids
        // Doctrine *not* saving this entity, if only plainPassword changes
        $this->password = null;
    }
}