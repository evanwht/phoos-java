USE `phoosball`;

CREATE OR REPLACE VIEW `last_games` AS
select
  `g`.`id` AS `id`,
  `g`.`game_date` AS `game_date`,
  `p1`.`name` AS `team_1_Defense`,
  `p2`.`name` AS `team_1_Offense`,
  `p3`.`name` AS `team_2_Defense`,
  `p4`.`name` AS `team_2_Offense`,
  `g`.`team_1_half` AS `team_1_half`,
  `g`.`team_2_half` AS `team_2_half`,
  `g`.`team_1_final` AS `team_1_final`,
  `g`.`team_2_final` AS `team_2_final`
from (
    (
      (
        (
          `games` `g`
          left join `players` `p1` on(`p1`.`id` = `g`.`team_1_p1`)
        )
        left join `players` `p2` on(`p2`.`id` = `g`.`team_1_p2`)
      )
      left join `players` `p3` on(`p3`.`id` = `g`.`team_2_p1`)
    )
    left join `players` `p4` on(`p4`.`id` = `g`.`team_2_p2`)
  )
where
  `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day
order by
  `g`.`game_date` desc;

CREATE OR REPLACE VIEW `losses` AS
select
  `p`.`id` AS `id`,
  `p`.`name` AS `name`,
  count(0) AS `losses`
from (
    `phoosball`.`players` `p`
    inner join `phoosball`.`games` `g`
    on (
        `p`.`id` = `g`.`team_2_p1`
        or `p`.`id` = `g`.`team_2_p2`
      )
  )
where
  `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day
  and `p`.`name` is not null
group by
  `p`.`id`,
  `p`.`name`;


CREATE OR REPLACE VIEW `wins` AS
select
  `p`.`id` AS `id`,
  `p`.`name` AS `name`,
  count(0) AS `wins`
from (
    `phoosball`.`players` `p`
    inner join `phoosball`.`games` `g` on (
        `p`.`id` = `g`.`team_1_p1`
        or `p`.`id` = `g`.`team_1_p2`
    )
  )
where
  `g`.`game_date` > cast(current_timestamp() as date) + interval -14 day
  and `p`.`name` is not null
group by
  `p`.`id`,
  `p`.`name`;

CREATE OR REPLACE VIEW `overall_standings` AS (
select
    `w`.`name` AS `name`,
    coalesce(`w`.`wins`, 0) AS `wins`,
    coalesce(`l`.`losses`, 0) AS `losses`
from (
    `phoosball`.`wins` `w`
    left join `phoosball`.`losses` `l` on(`w`.`id` = `l`.`id`)
    )
  )
union
  (
    select
      `l`.`name` AS `name`,
      coalesce(`w`.`wins`, 0) AS `wins`,
      coalesce(`l`.`losses`, 0) AS `losses`
    from (
        `phoosball`.`losses` `l`
        left join `phoosball`.`wins` `w` on(`l`.`id` = `w`.`id`)
      )
  )
order by
  `wins` desc,
  `losses`;