<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20161018115953 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE genus (id INT AUTO_INCREMENT NOT NULL, sub_family_id INT NOT NULL, name VARCHAR(255) NOT NULL, species_count INT NOT NULL, fun_fact VARCHAR(255) DEFAULT NULL, is_published TINYINT(1) NOT NULL, INDEX IDX_38C5106ED15310D4 (sub_family_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE genus_note (id INT AUTO_INCREMENT NOT NULL, genus_id INT NOT NULL, username VARCHAR(255) NOT NULL, user_avatar_filename VARCHAR(255) NOT NULL, note LONGTEXT NOT NULL, created_at DATETIME NOT NULL, INDEX IDX_6478FCEC85C4074C (genus_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sub_family (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE genus ADD CONSTRAINT FK_38C5106ED15310D4 FOREIGN KEY (sub_family_id) REFERENCES sub_family (id)');
        $this->addSql('ALTER TABLE genus_note ADD CONSTRAINT FK_6478FCEC85C4074C FOREIGN KEY (genus_id) REFERENCES genus (id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE genus_note DROP FOREIGN KEY FK_6478FCEC85C4074C');
        $this->addSql('ALTER TABLE genus DROP FOREIGN KEY FK_38C5106ED15310D4');
        $this->addSql('DROP TABLE genus');
        $this->addSql('DROP TABLE genus_note');
        $this->addSql('DROP TABLE sub_family');
    }
}
