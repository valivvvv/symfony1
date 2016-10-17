<?php

namespace AppBundle\Twig;

use AppBundle\Service\MarkdownTransformer;

class MarkdownExtension extends \Twig_Extension
{
	private $markdownTransformer;
	
    public function __construct(MarkdownTransformer $markdownTransformer)
    {
        $this->markdownTransformer = $markdownTransformer;
    }
	
	public function getFilters()
    {
		return array(
            new \Twig_SimpleFilter('markdownify', array($this, 'parseMarkdown'), array(
                'is_safe' => array('html'),
            ))
        );

    }
	
	public function parseMarkdown($str)
    {
        return $this->markdownTransformer->parse($str);
    }
	
	public function getName()
    {
        return 'app_markdown';
    }

}