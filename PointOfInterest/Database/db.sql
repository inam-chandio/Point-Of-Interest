create database pointOfInterset;
use pointOfInterset;

CREATE TABLE adminregisteration(
name VARCHAR(200),
email VARCHAR(150),
password VARCHAR(100),
gender VARCHAR(100),
city VARCHAR(100)
);

CREATE TABLE register(
id int primary key auto_increment not null,
name VARCHAR(200),
email VARCHAR(150),
password VARCHAR(100),
gender VARCHAR(100),
city VARCHAR(100)
);



CREATE TABLE PointOfInterest(
country VARCHAR(200),
state VARCHAR(150),
city VARCHAR(100)

);


CREATE TABLE likepoints (
id int primary key auto_increment not null,
country VARCHAR(200),
likes INT DEFAULT 0,
comment TEXT

);

