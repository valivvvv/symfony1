<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Genus;
use AppBundle\Entity\GenusNote;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class GenusController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {	
        return $this->render('default/index.html.twig', array(
			'title'		=> 'Taxi user',
            'safe' 		=> 'This is safe',
			'danger'	=> 'This is danger',
        ));
    }
	
	/**
     * @Route("/genus/new")
     */
    public function newAction()
    {
        $em = $this->getDoctrine()->getManager();
		
        $subFamily = $em->getRepository('AppBundle:SubFamily')
            ->findAny();
			
        $genus = new Genus();
        $genus->setName('Octopus'.rand(1, 10000));
        $genus->setSubFamily($subFamily);
        $genus->setSpeciesCount(rand(100, 99999));
        $genus->setFirstDiscoveredAt(new \DateTime('50 years'));
		
        $genusNote = new GenusNote();
        $genusNote->setUsername('AquaWeaver');
        $genusNote->setUserAvatarFilename('ryan.jpeg');
        $genusNote->setNote('I counted 8 legs... as they wrapped around me');
        $genusNote->setCreatedAt(new \DateTime('-1 month'));
        $genusNote->setGenus($genus);
		
        $user = $em->getRepository('AppBundle:User')
            ->findOneBy(array('email' => 'aquanaut1@example.org'));
        $genus->addGenusScientist($user);
		
        $em->persist($genus);
        $em->persist($genusNote);
        $em->flush();
		
        return new Response(sprintf(
            '<html><body>Genus created! <a href="%s">%s</a></body></html>',
            $this->generateUrl('genus_show', array('slug' => $genus->getSlug())),
            $genus->getName()
        ));
    }
	
	/**
     * @Route("/genus", name="genus_list")
     */
    public function listAction()
    {
        $em = $this->getDoctrine()->getManager();
        $genuses = $em->getRepository('AppBundle:Genus')
            ->findAllPublishedOrderedByRecentlyActive();
		
		//dump($em->getRepository('AppBundle:Genus'));
        
		return $this->render('genus/list.html.twig', array(
            'genuses' 	=> $genuses,
			'title'		=> 'Listing page'
        ));
    }
	
	/**
	 * @Route("/genus/{slug}", name="genus_show")
	 */
	public function showAction(Genus $genus)
	{
		$em = $this->getDoctrine()->getManager();
		
		/* Symfony gest the genus automatically, so this is obsolete
		$genus = $em->getRepository('AppBundle:Genus')
		  ->findOneBy(array('name' => $licensePlate));
		  
		if (!$genus) {
            throw $this->createNotFoundException('Genus not found');
        }*/	  
		
		$markdownTransformer = $this->get('app.markdown_transformer'); // registered in services.yml
		$funFact = $markdownTransformer->parse($genus->getFunFact());
		
        $this->get('logger')
            ->info('Showing genus: '.$genus->getName());
			
		$recentNotes = $em->getRepository('AppBundle:GenusNote')
            ->findAllRecentNotesForGenus($genus);

		return $this->render('genus/show.html.twig', array(
		  'title' 			=> $genus->getName(),
		  'genus' 			=> $genus,
		  'funFact'			=> $funFact,
		  'recentNoteCount' => count($recentNotes),
		));
	}
	
	/**
     * @Route("/genus/{slug}/reviews", name="genus_show_reviews")
     * @Method("GET")
	 * Param Conversion matches {slug} to Genus object
     */
    public function getReviewsAction(Genus $genus)
    {
		
		$notes = array();
		
        foreach ($genus->getNotes() as $note) {
            $notes[] = array(
                'id' => $note->getId(),
                'username' => $note->getUsername(),
                'avatarUri' => '/images/'.$note->getUserAvatarFilename(),
                'note' => $note->getNote(),
                'date' => $note->getCreatedAt()->format('M d, Y')
            );
        }
		
		$data = array(
            'notes' => $notes,
        );
		
		return new Response(json_encode($data));

    }
	
	/**
     * @Route("/genus/{genusId}/scientists/{userId}", name="genus_scientists_remove")
	 * @Method("DELETE")
     */
    public function removeGenusScientistAction($genusId, $userId)
    {
		$em = $this->getDoctrine()->getManager();
		
		/** @var Genus $genus */
		$genus = $em->getRepository('AppBundle:Genus')
            ->find($genusId);
			
		if (!$genus) {
            throw $this->createNotFoundException('genus not found');
        }
		
		$genusScientist = $em->getRepository('AppBundle:User')
            ->find($userId);
			
        if (!$genusScientist) {
            throw $this->createNotFoundException('scientist not found');
        }
		
		$genus->removeGenusScientist($genusScientist);
		$em->persist($genus);
        $em->flush();
		
		return new Response(null, 204);
    }
}
