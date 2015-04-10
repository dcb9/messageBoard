<?php

use yii\db\Schema;
use yii\db\Migration;

class m150410_033644_create_user_table extends Migration
{
    public function up()
    {

	    $sql = <<<SQL
CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `auth_key` VARCHAR(32) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `password_reset_token` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `role` SMALLINT NOT NULL DEFAULT '10',
  `status` SMALLINT NOT NULL DEFAULT '10',
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;
SQL;
	$this->execute($sql);
	return true;
    }

    public function down()
    {
	$this->dropTable('user');
        return true;
    }
}
