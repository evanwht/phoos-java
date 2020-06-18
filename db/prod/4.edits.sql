USE `phoosball`;

CREATE OR REPLACE VIEW last_games AS 
SELECT
    `g`.`id` AS `id`,
    `g`.`game_date` AS `game_date`,
    `p1`.`name` AS `team_1_d`,
    `p1`.`id` AS `team_1_d_id`,
    `p2`.`name` AS `team_1_o`,
    `p2`.`id` AS `team_1_o_id`,
    `p3`.`name` AS `team_2_d`,
    `p3`.`id` AS `team_2_d_id`,
    `p4`.`name` AS `team_2_o`,
    `p4`.`id` AS `team_2_o_id`,
    `g`.`team_1_half` AS `team_1_half`,
    `g`.`team_2_half` AS `team_2_half`,
    `g`.`team_1_final` AS `team_1_final`,
    `g`.`team_2_final` AS `team_2_final`
FROM
    (
        (
            (
                (
                    `games` `g`
                    LEFT JOIN `players` `p1`
                    ON `p1`.`id` = `g`.`team_1_p1`
                )
                LEFT JOIN `players` `p2`
                ON `p2`.`id` = `g`.`team_1_p2`
            )
            LEFT JOIN `players` `p3`
            ON `p3`.`id` = `g`.`team_2_p1`
        )
        LEFT JOIN `players` `p4`
        ON `p4`.`id` = `g`.`team_2_p2`
    )
ORDER BY `g`.`game_date` DESC;