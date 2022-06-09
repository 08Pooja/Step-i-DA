create database stepi_cricket;

use stepi_cricket;

-- 1. Create a table named ‘matches’ with appropriate data types for columns
create table matches(
	id int PRIMARY KEY, 
    city VARCHAR(30) NOT NULL,
    date DATE NOT NULL,
    player_of_match VARCHAR(40) NOT NULL,
    venue VARCHAR(60) NOT NULL,
    neutral_venue int NOT NULL,
    team1 VARCHAR(40) NOT NULL,
    team2 VARCHAR(40) NOT NULL,
    toss_winner VARCHAR(40) NOT NULL,
    toss_decision VARCHAR(40) NOT NULL,
    winner VARCHAR(40) NOT NULL,
    result VARCHAR(20) NOT NULL,
    result_margin int NOT NULL,
    eliminator VARCHAR(10) NOT NULL,
    method VARCHAR(10),
    umpire1 VARCHAR(40) NOT NULL,
    umpire2 VARCHAR(40) NOT NULL);

-- 2. Create a table named ‘deliveries’ with appropriate data types for columns
create table deliveries(
	id int,
    FOREIGN KEY (id) REFERENCES matches(id),
    inning int NOT NULL,
    over int NOT NULL,
    ball int NOT NULL,
    batsman VARCHAR(40) NOT NULL,
    non_striker VARCHAR(40) NOT NULL,
    bowler VARCHAR(40) NOT NULL,
    batsman_runs int NOT NULL,
    extra_runs int NOT NULL,
    total_runs int NOT NULL,
    is_wicket VARCHAR(10) NOT NULL,
    dismissal_kind VARCHAR(30),
    player_dismissed VARCHAR(40),
    fielder VARCHAR(60),
    extras_type VARCHAR(20),
    batting_team VARCHAR(40),
    bowling_team VARCHAR(40));

-- 3. Import data from CSV file ’IPL_matches.csv’ attached in resources to ‘matches’
SHOW VARIABLES LIKE "secure_file_priv";
-- 'C:\\ProgramData\\MySQL\\MySQL Server 5.6\\Uploads\\'

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 5.6\\Uploads\\IPL_matches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- 4. Import data from CSV file ’IPL_Ball.csv’ attached in resources to ‘deliveries’
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 5.6\\Uploads\\IPL_Ball.csv'
INTO TABLE deliveries
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- 5. Select the top 20 rows of the deliveries table.
SELECT * FROM deliveries LIMIT 20;

-- 6. Select the top 20 rows of the matches table.
SELECT * FROM matches LIMIT 20;

-- 7. Fetch data of all the matches played on 2nd May 2013.
SELECT * FROM matches WHERE date = '2013-05-2';

-- 8. Fetch data of all the matches where the margin of victory is more than 100 runs.
SELECT * FROM matches WHERE result_margin > 100;

-- 9. Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date.
SELECT * FROM matches WHERE result = 'tie' ORDER BY date DESC;

-- 10. Get the count of cities that have hosted an IPL match.
SELECT count(DISTINCT city) FROM matches;


    





