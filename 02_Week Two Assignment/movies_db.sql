
/***
DATA607 Week Two Assignment - SQL Script Fall 2018
John K. Hancock

The goal of this week's project is to create a MySQL database instance and connect to it with R.  
Below is the Sql script for creating the movie_reviews database schema and populating it with data.  
***/

/**
The Movies table holds information about current movies at the theaters.
The columns of the table are as follows:

ID: The primary key. A numerical identifier for each film
Title: Title of the film
Genre: The type of movie
Box_Office: Domestic box offic
Male_Lead: The leading male actor
Female_Lead: The leading female actor
Length: Running time of the film
Trailer: URL hyperlink to the trailer online

**/

alter table reviewers drop primary key;

alter table movies drop primary key;

DROP TABLE IF EXISTS movies;

CREATE TABLE Movies (
    ID INT NOT NULL,
    Title VARCHAR(255),
    Genre VARCHAR(255),
    Box_Office decimal(18,2),
    Male_Lead VARCHAR (255),
    Female_Lead VARCHAR(255),
    Length TIME,
    Trailer TEXT (65535),
    PRIMARY KEY (ID)
    
);

/**
The reviewers table holds information about information about people offering reviews of the films.


ReviewerID: The primary key. A numerical identifier for each person reviewing the film 
Username: Name of the reviewer
City: Name of the city where they live
State: Name of the state where they live
Zip: Their zip code
Occupation: What they do for a living
Income: Their income
Gender: Their gender

**/

DROP TABLE IF EXISTS reviewers;

CREATE TABLE reviewers (
    ReviewerID int,
    USERNAME VARCHAR(255),
	City varchar(255),
    State varchar(255),
    Zip varchar(255),
    Occupation varchar(255),
    Income decimal(18,2),
    Gender varchar(10),
    PRIMARY KEY (ReviewerID)  
    
    
);

/**
The Reviews table holds information the reviews of the movies by the reviewers

ReviewID: The ID of the reviewer in the reviewer table. This a foreign key to the Reviwers primary key.
MovieID: The ID of the movie in the movies table. This a foreign key to the Movies primary key.
Rating: Numerical rating of the film on a scale of 1 to 5.
Comments: Reviewer comments.

**/


DROP TABLE IF EXISTS reviews;


CREATE TABLE reviews(
	ReviewID int,
    MovieID int, 
    Rating int, 
    Comments text(500),
    FOREIGN KEY (ReviewID)
        REFERENCES Reviewers(ReviewerID)
        ON DELETE CASCADE,
	FOREIGN KEY (MovieID)
        REFERENCES Movies(ID)
        ON DELETE CASCADE
);

ALTER table movie_reviews.reviews
ADD constraint rev_const
CHECK(RATING > 1 AND RATING < 5);

/**
The following sections loads data into each table above. 
**/

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies.csv"
INTO TABLE movies
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/reviewers.csv"
INTO TABLE reviewers
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;



LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Reviews.csv"
INTO TABLE Reviews
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;



