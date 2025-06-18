DROP TABLE IF EXISTS import CASCADE;
DROP TABLE IF EXISTS noc CASCADE;
DROP TABLE IF EXISTS performance CASCADE;
DROP TABLE IF EXISTS game CASCADE;
DROP TABLE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS athlete CASCADE;


CREATE TEMP TABLE import (
    id INT,
    name TEXT,
    sex CHAR(1),
    age INT,
    height INT,
    weight FLOAT,
    team TEXT,
    noc TEXT,
    game TEXT,
    YEAR INT,
    season TEXT,
    city TEXT,
    sport TEXT,
    event TEXT,
    medal TEXT
);


CREATE TABLE noc (
    noc TEXT PRIMARY KEY,
    region TEXT,
    note TEXT
);


CREATE TABLE athlete (
    id INT PRIMARY KEY, 
    name TEXT, 
    sex CHAR(1)
);

CREATE TABLE event (
    id SERIAL PRIMARY KEY, 
    event TEXT, 
    sport TEXT
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY, 
    game TEXT, 
    YEAR INT, 
    season TEXT, 
    city TEXT
);

CREATE TABLE performance (
    id_athlete INT REFERENCES athlete(id),
    id_event INT REFERENCES event(id),
    id_game INT REFERENCES game(id),
    noc TEXT REFERENCES noc(noc),
    medal TEXT, 
    age INT,
    weight FLOAT,
    height INT,
    PRIMARY KEY(id_athlete, id_event, id_game, noc)
);


\COPY import FROM 'athlete_events.csv' DELIMITER ',' CSV HEADER NULL AS 'NA';
\COPY noc FROM 'noc_regions.csv' DELIMITER ',' CSV;


DELETE FROM import WHERE YEAR < 1920;
DELETE FROM import WHERE event LIKE 'Art%';


INSERT INTO noc VALUES ('SGP', 'Singapour', NULL);


INSERT INTO athlete
SELECT DISTINCT id, name, sex
FROM import;

INSERT INTO event (event, sport)
SELECT DISTINCT event, sport 
FROM import;

INSERT INTO game (game, YEAR, season, city)
SELECT DISTINCT game, YEAR, season, city 
FROM import;

INSERT INTO performance
SELECT 
    p.id, 
    e.id, 
    g.id, 
    p.noc, 
    p.medal, 
    p.age, 
    p.weight, 
    p.height
FROM import p, event e, game g
WHERE p.event = e.event 
AND p.sport = e.sport
AND g.game = p.game 
AND g.YEAR = p.YEAR 
AND g.season = p.season 
AND g.city = p.city;

select 