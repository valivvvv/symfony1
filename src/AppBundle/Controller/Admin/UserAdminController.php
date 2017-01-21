<?php

namespace AppBundle\Controller\Admin;

use AppBundle\Entity\User;
use AppBundle\Form\UserFormType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/admin")
 * @Security("is_granted('ROLE_ADMIN')")
 */
class UserAdminController extends Controller
{
    /**
     * @Route("/user", name="admin_user_list")
     */
    public function indexAction()
    {
		//$this->denyAccessUnlessGranted('ROLE_ADMIN');
		
        $users = $this->getDoctrine()
            ->getRepository('AppBundle:User')
            ->findAll();

        return $this->render('admin/user/list.html.twig', array(
            'users' => $users
        ));
    }
	
	/**
     * @Route("/user/new", name="admin_user_new")
     */
    public function newAction(Request $request)
    {
		$form = $this->createForm(UserFormType::class);
		
        // only handles data on POST
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            dump($form->getData());die;
			$user = $form->getData();
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
			
			$this->addFlash('success', 'User created!');
			
			return $this->redirectToRoute('admin_user_list');
        }
		
        return $this->render('admin/user/new.html.twig', array(
            'userForm' => $form->createView()
        ));
    }
	
    /**
     * @Route("/user/{id}/edit", name="admin_user_edit")
     */
    public function editAction(Request $request, User $user)
    {
		$form = $this->createForm(UserFormType::class, $user);
		
        // only handles data on POST
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            //dump($form->getData());die;
			$user = $form->getData();
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
			
			$this->addFlash('success', 'User updated!');
			
			return $this->redirectToRoute('admin_user_list');
        }
		
        return $this->render('admin/user/edit.html.twig', array(
            'userForm' => $form->createView()
        ));
    }
}