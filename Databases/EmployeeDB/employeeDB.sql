-- Database: employeeDB

-- DROP DATABASE "employeeDB";

CREATE DATABASE "employeeDB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_South Africa.1252'
    LC_CTYPE = 'English_South Africa.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE Employees (
	emp_id bigserial,
	first_name varchar(50),
	surname varchar(50),
	gender char,
	address varchar(50),
	email varchar(50),
	CONSTRAINT email_unique UNIQUE (email),
	department_id integer REFERENCES Department (department_id),
	role_id integer REFERENCES Roles (role_id),
	salary_id integer REFERENCES Salaries (salary_id),
	overtime_id integer REFERENCES Overtime_Hours (overtime_id),
	CONSTRAINT emp_key PRIMARY KEY (emp_id)
	);
	
	
CREATE TABLE Department (
	department_id bigserial,
	department_name varchar(50),
	department_city varchar(50),
	CONSTRAINT department_key PRIMARY KEY(department_id)
	);
	
CREATE TABLE Roles (
	role_id bigserial,
	role_name varchar(50),
	CONSTRAINT role_key PRIMARY KEY(role_id)
	);
	
CREATE TABLE Salaries(
	salary_id bigserial,
	salary_pa numeric(9,2),
	CONSTRAINT salary_key PRIMARY KEY(salary_id)
	);
	
CREATE TABLE Overtime_Hours (
	overtime_id bigserial,
	overtime_hours smallint,
	CONSTRAINT overtime_key PRIMARY KEY(overtime_id)
	);
	
INSERT INTO Department (department_name, department_city)
VALUES ('Teaching', 'BBR'),
	('Accounting', 'Hazy'),
	('Guest House', 'WR'),
	('Developer', 'Nst'),
	('Retail', 'Hoek');

INSERT INTO Roles (role_name)
VALUES ('Manager'),
	('Assistant Manager'),
	('Supervisor'),
	('Worker'),
	('Junior Worker');

INSERT INTO Salaries(salary_pa)
VALUES (52000),
	(39000),
	(25000),
	(17000),
	(11000);

INSERT INTO Overtime_hours (overtime_hours)
VALUES (10),
	(7),
	(8),
	(5),
	(2);
	
INSERT INTO Employees(first_name, surname, gender, address, email, department_id, role_id, salary_id, overtime_id)
VALUES ('Mano', 'Mamba', 'Male', 'Jump st', 'mano@icloud.com', 1, 1, 1,1),
	('Miyi', 'Mamba', 'Male', 'Saint st', 'miyi@gmail.com', 2, 2, 2, 7),
	('jessica', 'Matthe', 'Female', 'Zone st', 'jessie@gmail.com' , 3, 3, 3, 5),
	('Mfundo', 'Thib', 'Male', 'Xanth st', 'fundo@gmail.com' , 4, 4, 4, 2),
	('Bri', 'Shaban', 'Male', 'Chado st', 'bri@gmail.com' , 5, 5, 5 ,5),
	('james', 'strong', 'Male', 'Saint st', 'James@gmail.com' , 1, 1, 1, 1),
	('Dennis', 'Mamba', 'Female', 'Xanth st', 'Dennis@gmail.com' , 2, 2, 2, 8),
	('Frank', 'Matthe', 'Male', 'Zone st', 'frank@gmail.com' , 1, 1, 1, 8),
	('Warren', 'Mamb', 'Male', 'xanth st', 'warren@gmail.com' , 5, 5, 5, 7),
	('Ethan', 'Mamba', 'Male', 'Xanth st', 'ethan@gmail.com' , 1, 1, 1, 1);

SELECT 
	Employees.first_name, 
	Employees.surname, 
	Employees.gender, 
	Employees.address, 
	Employees.email,
	Department.department_name, 
	Department.department_city,
	Roles.role_name,
	Salaries.salary_pa,
	Overtime_Hours.overtime_hours	
FROM Employees LEFT JOIN Department
ON Employees.department_id = Department.department_id
LEFT JOIN Roles
ON Employees.role_id = Roles.role_id
LEFT JOIN Salaries 
ON Employees.salary_id = Salaries.salary_id
LEFT JOIN Overtime_Hours
ON Employees.overtime_id = Overtime_Hours.overtime_id;