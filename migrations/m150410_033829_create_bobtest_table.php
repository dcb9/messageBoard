<?php

use yii\db\Schema;
use yii\db\Migration;

class m150410_033829_create_bobtest_table extends Migration
{
    public function up()
    {

	    $sql = <<<SQL
CREATE TABLE `bobtest` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;
SQL;
		$this->execute($sql);
		return true;
    }

    public function down()
    {
	    $this->dropTable('bobtest');
	    return true;
    }
}
