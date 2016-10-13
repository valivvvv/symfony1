<?php
// src/AppBundle/Controller/LuckyController.php
namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class LuckyController extends Controller
{
    /**
     * @Route("/lucky/number/{max}", name="lucky_number", requirements={"max": "\d+"})
     */
    public function numberAction($max = 10, Request $request)
    {
        $number = mt_rand(0, $max);
		$url = $this->generateUrl('lucky_number', array('max' => '100000'));
		
		$session = $request->getSession();
		$session->set('foo', 'bar');	
		$foo = $session->get('foo');
		
		$this->addFlash(
            'notice',
            'Your number was generated!'
        );

		return $this->render('lucky/number.html.twig', array(
			'title'		=> 'Lucky number '.$number,
            'number'	=> $number,
			'url'		=> $url,
			'request'	=> $request,
			'foo'		=> $foo,
        ));
    }
}