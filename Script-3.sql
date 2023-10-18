-- MOVIE THEATER ERD

CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	location_id SERIAL NOT NULL UNIQUE,
	address VARCHAR(100) NOT NULL UNIQUE,
	number_of_rooms INTEGER NOT NULL,
	staff_id SERIAL UNIQUE,
	hours_of_operation TIMESTAMP,
	revenue INTEGER,
	ticket_total INTEGER
);

SELECT *
FROM theater t;

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
	first_name 	VARCHAR(50),
	last_name VARCHAR(50),
	customer_status VARCHAR(25)NOT NULL,
	payment_type VARCHAR(20)NOT NULL
);

SELECT *
FROM customer c ;

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
	ticket_availability INTEGER NOT NULL,
	ticket_status VARCHAR(25) NOT NULL,
	rewards_pgrm VARCHAR(25),
	ticket_type VARCHAR(25) NOT NULL,
	ticket_price INTEGER NOT NULL,
	revenue INTEGER NOT NULL
);
--	FOREIGN key(revenue) REFERENCES theater(revenue)

SELECT *
FROM ticket t ;

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
	title varchar(50) NOT NULL,
	rating varchar(50) NOT NULL,
	duration integer NOT NULL,
	director_id integer NOT NULL,
	genre_id integer NOT NULL,
	tickets_sold integer NOT NULL,
	revenue integer NOT NULL,
	actor_id integer NOT NULL,
	FOREIGN KEY(tickets_sold) REFERENCES ticket(ticket_id)
);

SELECT *
FROM movie m ;

CREATE TABLE actor(
	actor_id INTEGER PRIMARY KEY NOT NULL UNIQUE,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	country varchar(50)
);

SELECT *
FROM actor;

CREATE TABLE director(
	director_id integer PRIMARY KEY NOT NULL UNIQUE,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	award_status varchar(25)
);

SELECT *
FROM director d ;

CREATE TABLE genre(
	genre_id INTEGER NOT NULL UNIQUE,
	FOREIGN KEY(genre_id) REFERENCES movie(genre_id),
	genre_name varchar(50) NOT NULL
);

CREATE TABLE awards(
	award_id INTEGER PRIMARY KEY NOT NULL,
	award_name varchar(50)NOT NULL,
	award_type varchar(50) NOT null
);

SELECT *
FROM awards;
