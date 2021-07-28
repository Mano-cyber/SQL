-- Database: try_it_yourself

-- DROP DATABASE try_it_yourself;

CREATE DATABASE try_it_yourself2
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE teachers2 (
	id bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salary numeric
);

INSERT INTO teachers2 (first_name, last_name, school, hire_date, salary)
VALUES	('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
		('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
		('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
		('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
		('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
		('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
		
SELECT last_name, school, hire_date 
FROM teachers
ORDER BY school ASC, last_name ASC;	

SELECT first_name, salary
FROM teachers
WHERE first_name LIKE 'S%'
	AND salary < 40000;

	
SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE hire_date > '2010-01-01'