DROP TABLE IF EXISTS tournament_results;

CREATE TABLE `chess`.`tournament_results` (
  `player_id` INT NOT NULL,
  `player_name` VARCHAR(255) NULL,
  `player_state` VARCHAR(255) NULL,
  `total_no_of_points` DOUBLE NULL,
  `player_pre_rating` INT NULL,
  `avg_pre_chess_rating_of_opponents` FLOAT NULL,
  `Wins` INT NULL,
  `Losses` INT NULL,
  `Draws` INT NULL,
  `U` INT NULL,
  `H` INT NULL,
  `White` INT NULL,
  `Black` INT NULL,
  PRIMARY KEY (`player_id`));

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Chess Tournament Results.csv"
INTO TABLE tournament_results
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


SELECT player_name, Wins, avg_pre_chess_rating_of_opponents
FROM tournament_results
WHERE avg_pre_chess_rating_of_opponents = (SELECT min(avg_pre_chess_rating_of_opponents)
										  FROM tournament_results);


SELECT player_name, Wins, avg_pre_chess_rating_of_opponents
FROM tournament_results
WHERE avg_pre_chess_rating_of_opponents = (SELECT max(avg_pre_chess_rating_of_opponents)
										  FROM tournament_results);

SELECT player_name, Wins, player_pre_rating, avg_pre_chess_rating_of_opponents
FROM tournament_results
Order by Wins desc, player_pre_rating  desc, avg_pre_chess_rating_of_opponents desc;



