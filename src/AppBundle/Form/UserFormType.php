<?php

namespace AppBundle\Form;

//use AppBundle\Entity\SubFamily;
//use AppBundle\Repository\SubFamilyRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
		$builder
            ->add('email')
			->add('roles', ChoiceType::class, [
                'multiple' => true,
                'expanded' => true, // render check-boxes
                'choices' => [
                    'Admin' => 'ROLE_ADMIN',
                    'User' => 'ROLE_USER',
                    // ...
                ],
            ])
        ;
    }
	
    public function configureOptions(OptionsResolver $resolver)
    {
		$resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\User',
			'validation_groups' => ['Default', 'Edit']
        ));
    }
	
	/*Right now, our form is bound to our entity and that makes this form super easy to use. But eventually, you'll need to build a form that does not look exactly like your entity: perhaps it has a few extra fields or is a combination of fields from several entities.

When you run into this: here's what I want you to do. Don't bind your form to your entity class. Instead, create a brand new class: I usually put these classes inside my Form directory. For example, GenusModel. This class will have the exact properties that your form needs.

Bind this class to your form and add all your validation rules like normal. After you submit your form, $form->getData() will return this other object. Then, it'll be your job to write a little bit of extra code that reads this data, updates your entities - or whatever else you need that data for - and saves things.*/
}