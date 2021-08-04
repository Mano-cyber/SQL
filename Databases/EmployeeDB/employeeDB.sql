-- Database: employeedb

-- DROP DATABASE employeedb;

CREATE DATABASE employeedb
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE Department (
 depart_id bigserial,
 depart_name varchar(50),
 depart_city varchar(50),
 CONSTRAINT depart_key PRIMARY KEY (depart_id)
);

INSERT INTO Department (depart_name, depart_city)
VALUES ('Teaching', 'BBR'),
	('Accounting', 'Hazy'),
	('Guest House', 'WR'),
	('Developer', 'Nst'),
	('Retail', 'Hoek');
	
CREATE TABLE Roles (
 role_id bigserial,
 role_ varchar(50),
 CONSTRAINT role_key PRIMARY KEY (role_id)
);

INSERT INTO Roles (role_)
VALUES ('Manager'),
	('Assistant Manager'),
	('Supervisor'),
	('Worker'),
	('Junior Worker');
	
CREATE TABLE Salaries (
 salary_id bigserial,
 salary_pa money,
 CONSTRAINT salary_key PRIMARY KEY (salary_id)
);

INSERT INTO Salaries (salary_pa)
VALUES (52000),
	(39000),
	(25000),
	(17000),
	(11000);

CREATE TABLE Overtime_Hours (
 overtime_id bigserial,
 overtime_hours int,
 CONSTRAINT overtime_key PRIMARY KEY (overtime_id)
);

INSERT INTO Overtime_Hours (overtime_hours)
VALUES (10),
	(7),
	(8),
	(5),
	(2);
	
CREATE TABLE Employees (
 emp_id bigserial,
 first_name varchar(50),
 surname varchar(50),
 gender varchar(25),
 address varchar(50),
 email varchar(50),
 depart_id int REFERENCES Department (depart_id) ON DELETE CASCADE,
 role_id int REFERENCES Roles (role_id) ON DELETE CASCADE,
 salary_id int REFERENCES Salaries (salary_id) ON DELETE CASCADE,
 overtime_id int REFERENCES Overtime_Hours (overtime_id) ON DELETE CASCADE,
 CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

SELECT * FROM Department 
SELECT * FROM Roles 
SELECT * FROM Salaries 
SELECT * FROM Overtime_Hours

INSERT INTO Employees (first_name, surname, gender, address, email, role_id, salary_id, overtime_id)
VALUES ('Mano', 'Mambane', 'Male', 'Jump st', 'mano@icloud.com', 1, 1, 1),
	('Miyi', 'Mambane', 'Male', 'Saint st', 'miyi@gmail.com', 2, 2, 2 ),
	('jessica', 'Matthews', 'Female', 'Zone st', 'jessie@gmail.com' , 3, 3, 3),
	('Mfundo', 'Thib', 'Male', 'Xanth st', 'fundo@gmail.com' , 4, 4, 4),
	('Bri', 'Shaban', 'Male', 'Chado st', 'bri@gmail.com' , 5, 5, 5),
	('james', 'strongman', 'Male', 'Saint st', 'James@gmail.com' , 1, 1, 1),
	('Dennis', 'Mambane', 'Female', 'Xanth st', 'Dennis@gmail.com' , 2, 2, 2),
	('Frank', 'Matthews', 'Male', 'Zone st', 'frank@gmail.com' , 1, 1, 1),
	('Warren', 'Mambane', 'Male', 'xanth st', 'warren@gmail.com' , 5, 5, 5),
	('Ethan', 'Mambane', 'Male', 'Xanth st', 'ethan@gmail.com' , 1, 1, 1);
	
SELECT emp.first_name, emp.surname, emp.gender, emp.address, emp.email,
		dep.depart_name, dep.depart_city,
		role_id,
		salary_id,
		overtime_id
FROM Employees emp JOIN Department dep
ON emp.depart_id = dep.depart_id
JOIN Roles rol
ON emp.role_id = role_id
JOIN Salaries slry
ON emp.salary_id = slry.salary_id
JOIN Overtime_Hours overtime
ON emp.overtime_id = overtime.overtime_id;


DROP TABLE Department

SELECT * FROM Employees