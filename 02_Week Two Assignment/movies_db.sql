DROP TABLE IF EXISTS Movies;


CREATE TABLE Movies (
    ID INT NOT NULL,
    Title VARCHAR(255),
    Genre VARCHAR(255),
    Male_Lead VARCHAR(255),
    Female_Lead VARCHAR(255),
    Length TIME(3),
    Trailer TEXT (65535),
    PRIMARY KEY (ID)
);


DROP TABLE IF EXISTS Reviewers;

CREATE TABLE Reviewers (
    USERNAME VARCHAR(255),
    RATING int,
    Review TEXT (65535),
    TITLE_ID int,
    FOREIGN KEY (TITLE_ID)
        REFERENCES Movies(ID)
        ON DELETE CASCADE
    
);

ALTER table movie_reviews.Reviewers
ADD constraint rev_const
CHECK(RATING > 1 AND RATING < 5);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/reviewers.csv' 
INTO TABLE reviews
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(country, year, sex, @child, @adult, @elderly)
SET
child = nullif(@child,-1),
adult = nullif(@adult,-1),
elderly = nullif(@elderly,-1)
;
