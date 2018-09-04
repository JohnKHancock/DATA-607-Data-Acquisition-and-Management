DROP TABLE IF EXISTS Movies;


CREATE TABLE Movies (
    ID INT NOT NULL,
    Title VARCHAR(255),
    Genre VARCHAR(255),
    Length TIME(3),
    URL TEXT(65535),
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