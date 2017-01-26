<?php

namespace AppBundle\Form;

use AppBundle\Entity\SubFamily;
use AppBundle\Entity\User;
use AppBundle\Repository\SubFamilyRepository;
use AppBundle\Repository\UserRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\Form\FormView;
use Symfony\Component\OptionsResolver\OptionsResolver;

class GenusFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
		$builder
            ->add('name')
			->add('subFamily', EntityType::class, [
                'placeholder' => 'Choose a Sub Family',
				'class' => SubFamily::class,
				'query_builder' => function(SubFamilyRepository $repo) {
					return $repo->createAlphabeticalQueryBuilder();
                }
            ])
            ->add('speciesCount')
            ->add('funFact', null, [
				'help' => 'For example, Leatherback sea turtles can travel more than 10,000 miles every year!'
			])
			->add('isPublished', ChoiceType::class, [
                'choices' => [
                    'Yes' => true,
                    'No' => false,
                ]
            ])
            ->add('firstDiscoveredAt', DateType::class, [
                'widget' => 'single_text',
                'attr' => ['class' => 'js-datepicker'],
                'html5' => false,
            ])
			->add('genusScientists', EntityType::class, [
				'class' => User::class,
                'multiple' => true,
                'expanded' => true,
				'choice_label' => 'email',
				'query_builder' => function(UserRepository $repo) {
                    return $repo->createIsScientistQueryBuilder();
                }
			])
        ;
    }
	
	/*public function finishView(FormView $view, FormInterface $form, array $options)
    {
        $view['funFact']->vars['help'] = 'For example, Leatherback sea turtles can travel more than 10,000 miles every year!';
	}*/
	
    public function configureOptions(OptionsResolver $resolver)
    {
		$resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Genus'
        ));
    }

	/* If ever need to render form fields manually: http://knpuniversity.com/screencast/symfony-form-theming/rendering-fields-manually */
	
	/*Right now, our form is bound to our entity and that makes this form super easy to use. But eventually, you'll need to build a form that does not look exactly like your entity: perhaps it has a few extra fields or is a combination of fields from several entities.

When you run into this: here's what I want you to do. Don't bind your form to your entity class. Instead, create a brand new class: I usually put these classes inside my Form directory. For example, GenusModel. This class will have the exact properties that your form needs.

Bind this class to your form and add all your validation rules like normal. After you submit your form, $form->getData() will return this other object. Then, it'll be your job to write a little bit of extra code that reads this data, updates your entities - or whatever else you need that data for - and saves things.*/
}
