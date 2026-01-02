-- 02_schema.sql

CREATE TABLE Venue (
    venue_name VARCHAR(100) PRIMARY KEY,
    building_no INTEGER NOT NULL,
    street_no INTEGER NOT NULL,
    zone_no INTEGER NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE NationalTeam (
    nationality VARCHAR(50) PRIMARY KEY,
    FIFA_rank INTEGER NOT NULL CHECK (FIFA_rank > 0),
    group_name CHAR(1) CHECK (group_name IN ('A','B','C','D','E','F','G','H'))
);


CREATE TABLE Coach (
    team_nationality VARCHAR(50) PRIMARY KEY
        REFERENCES NationalTeam(nationality) ON DELETE CASCADE,
    coach_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Player (
    lastname VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    position VARCHAR(20) CHECK (position IN ('Goalkeeper','Defender','Midfielder','Forward')),
    height DECIMAL(3,2) CHECK (height BETWEEN 1.50 AND 2.20),
    nationality VARCHAR(50) REFERENCES NationalTeam(nationality) ON DELETE CASCADE,
    PRIMARY KEY (lastname, surname)
);

CREATE TABLE Match (
    match_id SERIAL PRIMARY KEY,
    round VARCHAR(30) CHECK (round IN ('Group Stage','Round of 16','Quarter-final','Semi-final','Third place','Final')),
    date DATE NOT NULL CHECK (date BETWEEN '2022-11-20' AND '2022-12-18'),
    venue_name VARCHAR(100) REFERENCES Venue(venue_name) ON DELETE RESTRICT
);

CREATE TABLE MatchParticipant (
    nationality VARCHAR(50) REFERENCES NationalTeam(nationality) ON DELETE CASCADE,
    match_id INTEGER REFERENCES Match(match_id) ON DELETE CASCADE,
    PRIMARY KEY (nationality, match_id)
);


CREATE TABLE Goal (
    goal_id SERIAL PRIMARY KEY,
    match_id INTEGER NOT NULL REFERENCES Match(match_id) ON DELETE CASCADE,

    player_lastname VARCHAR(50),
    player_surname  VARCHAR(50),

    goalTime VARCHAR(10) NOT NULL,          -- '16', '90+1', 'PK' など
    is_penalty_shootout BOOLEAN NOT NULL DEFAULT FALSE,

    FOREIGN KEY (player_lastname, player_surname)
        REFERENCES Player(lastname, surname)
        ON DELETE SET NULL,

    CHECK (
        (is_penalty_shootout = TRUE  AND goalTime = 'PK')
        OR
        (is_penalty_shootout = FALSE AND goalTime <> 'PK')
    )
);

CREATE UNIQUE INDEX uq_goal_event
ON Goal(match_id, player_lastname, player_surname, goalTime, is_penalty_shootout);
