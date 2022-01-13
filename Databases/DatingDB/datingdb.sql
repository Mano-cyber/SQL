-- Database: datingDB

-- DROP DATABASE "datingDB";

CREATE DATABASE "datingDB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_South Africa.1252'
    LC_CTYPE = 'English_South Africa.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE Profession(
	prof_id bigserial CONSTRAINT prof_key PRIMARY KEY, 
	profession varchar(50) CONSTRAINT profession_unique UNIQUE );
	
CREATE TABLE Zip_Code(
	zip_code varchar(4) CONSTRAINT zip_key PRIMARY KEY,
	city varchar(50),
	province varchar(50)
	CONSTRAINT zip_check CHECK (LENGTH(zip_code)= 4));
	
CREATE TABLE Status(
	status_id bigserial CONSTRAINT status_key PRIMARY KEY,
	status varchar(50));
	
CREATE TABLE My_Contacts(
	contact_id bigserial CONSTRAINT contact_key PRIMARY KEY,
	last_name varchar (50),
	first_name varchar (50),
	phone varchar (12),
	email varchar (50),
	gender char,
	birthday date,
	prof_id integer REFERENCES Profession (prof_id),
	zip_code varchar(4) REFERENCES Zip_Code (zip_code),
	status_id integer REFERENCES Status (status_id));
	
CREATE TABLE Interests (
	interest_id bigserial CONSTRAINT interest_key PRIMARY KEY,
	interest varchar(50));
	
CREATE TABLE Seeking(
	seeking_id bigserial CONSTRAINT seeking_key PRIMARY KEY,
	seeking varchar(50));
	
CREATE TABLE Contact_Interest(
	contact_id integer REFERENCES My_Contacts (contact_id),
	interest_id integer REFERENCES Interests (interest_id));
	
CREATE TABLE Contact_seeking(
	contact_id integer REFERENCES My_Contacts (contact_id),
	seeking_id integer REFERENCES Seeking (seeking_id));
	
INSERT INTO Profession (profession)
VALUES ('Attorney'),
('Writer'),
('Pilot'),
('Chef'),
('Engineer'),
('Programmer'),
('Actor'),
('Retail');

INSERT INTO zip_code (zip_code, city, province)
VALUES (5200, 'East London', 'Eastern Cape'),
	(9300, 'Bloemfontein', 'Free State'),
	(2191, 'Sunninghill', 'Gauteng'),
	(2940, 'Newcastle', 'KZN'),
	(1826, 'Giyani', 'Limpopo'),
	(1200, 'Mbombela', 'Mpumalanga'),
	(8800, 'Upington', 'Northern Cape'),
	(2570, 'Klerksdorp', 'North West'),
	(7100, 'Cape Town', 'Western Cape'),
	(2410, 'Baldour', 'Eastern Cape'),
	(9700, 'Bethlehem', 'Free State'),
	(2169, 'Randpark Ridge', 'Gauteng'),
	(4011, 'Durban', 'KZN'),
	(1850, 'Tzaneen', 'Limpopo'),
	(1270, 'Graskop', 'Mpumalanga'),
	(8300, 'Kimberley', 'Northern Cape'),
	(2735, 'Mahikeng', 'North West'),
	(7599, 'Stellenbosch', 'Western Cape');
	
INSERT INTO Status (status)
VALUES ('Open Relationship'),
	('In a Relationship'),
	('Married'),
	('Divorced'),
	('Widowed'),
	('Single');
	
INSERT INTO My_Contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES ('Eddy', 'Quma', '0872341234', 'eddy@gmail.com', 'M', '2000-01-05', 1, 5200, 1),
('Jack', 'Uzaro', '0835716666', 'jack@gmail.com', 'M', '1998-09-17', 2, 9300, 5),
('Fundo', 'Thibela', '0866325786', 'fundo@gmail.com', 'F', '2000-01-30', 3, 2191, 2),
('Penny', 'Zulu', '0859100084', 'penny@gmail.com', 'F', '1995-03-13', 4, 2940, 1),
('Corrin', 'Ngwane', '0842999670', 'corrin@gmail.com', 'F', '1998-04-16', 5, 1826, 6),
('Vukosi', 'Mkhabela', '0835636030', 'vmk@gmail.com', 'M', '1990-12-16', 6, 1200, 1),
('Abdile', 'Kwena', '0839714819', 'andile@gmail.com', 'M', '1987-05-05', 7,8800, 4),
('Lulama', 'Nkuna', '0834307963', 'lulama@gmail.com', 'F', '1993-07-18', 8, 2570, 4),
('Ripfumelo', 'Mawila', '0825138355', 'ray@gmail.com', 'F', '1992-09-10', 1, 7100, 3),
('Jazel', 'Mhlongo', '0821185849', 'Jazel@gmail.com', 'M', '2000-04-29', 2, 2410, 2),
('Grace', 'Mathebula', '0838839728', 'grace@gmail.com', 'F', '1997-01-08', 2, 9700, 1),
('Miyi', 'Mamba', '0828266837', 'mahazy@gmail.com', 'M', '1994-02-08', 3, 2169, 6),
('Nkulu', 'Buyi', '0846087530', 'nkulu@gmail.com', 'M', '1997-04-04', 4, 4011, 1),
('Steve', 'Mabaso', '0825558574', 'steve@gmail.com', 'M', '1991-11-22', 5, 1850, 6),
('Nqobile', 'Nkuna', '0832358342', 'nqonk@gmail.com', 'F', '2001-07-03', 6, 2735, 1);

INSERT INTO Seeking (seeking)
VALUES 
('Male'),
('Female');

INSERT INTO Interests (interest)
VALUES ('Art'),
('Traveling'),
('Gaming'),
('Gardening'),
('Coding'),
('Reading'),
('Cooking'),
('Music'),
('Shopping'),
('Writing'),
('Fishing'),
('Sports'),
('Music');

INSERT INTO contact_interest(contact_id, interest_id)
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 1),
(15, 2);

INSERT INTO contact_seeking(contact_id,seeking_id)
VALUES 
(1,1),
(2,2),
(3,2),
(4,2),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,2),
(11,2),
(12,1),
(13,1),
(14,2),
(15,2);

FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT JOIN contact_seeking 
ON my_contacts.contact_id = contact_seeking.contact_id
LEFT JOIN interests
ON interests.interest_id = contact_interest.interest_id
LEFT JOIN seeking
ON seeking.seeking_id = contact_seeking.seeking_id
LEFT JOIN profession
ON profession.prof_id = my_contacts.prof_id
LEFT JOIN zip_code
ON zip_code.zip_code = my_contacts.zip_code
LEFT JOIN status
ON status.status_id = my_contacts.status_id