<?php

namespace AppBundle\Repository;

use AppBundle\Entity\Genus;
use Doctrine\ORM\EntityRepository;

class SubFamilyRepository extends EntityRepository
{	
	public function createAlphabeticalQueryBuilder()
	{
		return $this->createQueryBuilder('sub_family')
            ->orderBy('sub_family.name', 'ASC');
	}
	
	public function findAny() {
		$result = $this->createQueryBuilder('sub_family')
			->setMaxResults(1)
			->getQuery()
			//->getOneOrNullResult();
			->execute();
		
		return $result[0];
	}
}