-- +goose Up
INSERT INTO `match_type`(`id`, `name`, `description`) VALUES (18, 'Random X01', 'Random X01');
INSERT INTO `match_type`(`id`, `name`, `description`) VALUES (19, 'Random X01 Crazy', 'Random X01 Crazy');

ALTER TABLE `matches`
    ADD COLUMN `seed` VARCHAR(255) NULL;

CREATE TABLE `statistics_random_x01`
(
    `id`                   INT(10) unsigned NOT NULL AUTO_INCREMENT,
    `leg_id`               INT(10) unsigned NOT NULL,
    `player_id`            INT(10) unsigned NOT NULL,
    `ppd` DOUBLE NOT NULL,
    `ppd_score`            INT(11) NOT NULL,
    `first_nine_ppd` DOUBLE NOT NULL,
    `first_nine_ppd_score` INT(11) NOT NULL,
    `checkout_percentage` DOUBLE DEFAULT NULL,
    `checkout_attempts`    INT(11) DEFAULT NULL,
    `checkout`             INT(11) DEFAULT NULL,
    `darts_thrown`         INT(11) DEFAULT NULL,
    `60s_plus`             INT(11) DEFAULT NULL,
    `100s_plus`            INT(11) DEFAULT NULL,
    `140s_plus`            INT(11) DEFAULT NULL,
    `180s`                 INT(11) DEFAULT NULL,
    `accuracy_20` DOUBLE DEFAULT NULL,
    `accuracy_19` DOUBLE DEFAULT NULL,
    `overall_accuracy` DOUBLE DEFAULT NULL,
    `crazy_mode`           tinyint(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    key                    `fk_statistics_random_x01_leg_id` (`leg_id`),
    key                    `fk_statistics_random_x01_player_id` (`player_id`),
    CONSTRAINT `fk_statistics_random_x01_leg_id` FOREIGN KEY (`leg_id`) REFERENCES `leg` (`id`),
    CONSTRAINT `fk_statistics_random_x01_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- +goose Down
DELETE FROM `match_type` WHERE id = 19;
DELETE FROM `match_type` WHERE id = 18;

DROP TABLE if EXISTS `statistics_random_x01`;

ALTER TABLE `matches` DROP COLUMN `seed`;
