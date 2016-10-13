<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Genus;


class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {	
        return $this->render('default/index.html.twig', array(
			'title'		=> 'Taxi user',
            'safe' 		=> 'This is safe',
			'danger'	=> 'This is danger',
        ));
    }
	
	/**
     * @Route("/taxi/new")
     */
    public function newAction()
    {	
        $genus = new Genus();
        $genus->setName('Octopus'.rand(1, 100));
        $genus->setSubFamily('Octopodinae');
        $genus->setSpeciesCount(rand(100, 99999));
		
		$em = $this->getDoctrine()->getManager();
        $em->persist($genus);
        $em->flush();
		
		return new Response('<html><body>Genus created!</body></html>');
    }
	
	/**
     * @Route("/taxi", name="taxi_list")
     */
    public function listAction()
    {
        $em = $this->getDoctrine()->getManager();
        $genuses = $em->getRepository('AppBundle:Genus')
            ->findAllPublishedOrderedBySize();
		
		//dump($em->getRepository('AppBundle:Genus'));
        
		return $this->render('taxi/list.html.twig', array(
            'genuses' 	=> $genuses,
			'title'		=> 'Listing page'
        ));
    }
	
	/**
	 * @Route("/taxi/{licensePlate}", name="taxi_show")
	 */
	public function showAction($licensePlate)
	{
		$em = $this->getDoctrine()->getManager();
		$genus = $em->getRepository('AppBundle:Genus')
		  ->findOneBy(array('name' => $licensePlate));
		  
		if (!$genus) {
            throw $this->createNotFoundException('Taxi not found');
        }
		  
	   /*$funFact = 'Octopuses can change the color of their body in just *three-tenths* of a second!';
	   
	   $cache = $this->get('doctrine_cache.providers.my_markdown_cache');
	   $key = md5($funFact);
	   
	   if ($cache->contains($key)) {
			$funFact = $cache->fetch($key);
		} else {
			sleep(1); // fake how slow this could be
			$markdown = $this->get('markdown.parser');
			$funFact = $markdown->transform($funFact);
			$cache->save($key, $funFact);
		}*/

	   return $this->render('taxi/show.html.twig', array(
		  'title' => $licensePlate,
		  'genus' => $genus
		  //'funFact' => $funFact,
	  ));
	}
	
	/**
     * @Route("/taxi/{licensePlate}/reviews", name="taxi_reviews")
     * @Method("GET")
     */
    public function getReviewsAction($licensePlate)
    {
		 $notes = array(
            array('id' => 1, 'username' => 'AquaPelham', 'avatarUri' => '/images/leanna.jpeg', 'note' => 'Octopus asked me a riddle, outsmarted me', 'date' => 'Dec. 10, 2015'),
            array('id' => 2, 'username' => 'AquaWeaver', 'avatarUri' => '/images/ryan.jpeg', 'note' => 'I counted 8 legs... as they wrapped around me', 'date' => 'Dec. 1, 2015'),
            array('id' => 3, 'username' => 'AquaPelham', 'avatarUri' => '/images/leanna.jpeg', 'note' => 'Inked!', 'date' => 'Aug. 20, 2015'),
        );
		
		$data = array(
            'notes' => $notes,
			'plate' => $licensePlate,
        );
		
		return new Response(json_encode($data));

    }
}
