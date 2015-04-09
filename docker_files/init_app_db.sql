CREATE TABLE IF NOT EXISTS `user` (
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE `bobtest` (
	  `name` varchar(180) NOT NULL,
	  `created_at` int(11) DEFAULT NULL,
	  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
