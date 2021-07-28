-- Database: try_it_yourself

-- DROP DATABASE try_it_yourself;

CREATE DATABASE try_it_yourself
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE vehicle(
    vehicle_type varchar(25),
    miles int,
    date_reading date
	);
	
insert into vehicle (vehicle_type, miles, date_reading)
values ('Dyna',230,'2019-03-05'),
	('H1',230,'2019-03-06'),
	('Escort',230,'2019-03-04');

select * from vehicle;

CREATE TABLE drivers(
    first_name varchar(25),
    last_name varchar(25),
    age int
	);
	
insert into drivers (first_name, last_name, age)
values ('Mike','Smith',22),
('Chris','van zyl',24),
('Peter','Baker',30);

SELECT * FROM drivers