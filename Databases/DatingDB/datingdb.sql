-- Database: datingdb

-- DROP DATABASE datingdb;

CREATE DATABASE datingdb
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE profession (
 prof_id bigserial,
 profession varchar(50),
 CONSTRAINT profession_key PRIMARY KEY (prof_id),
 CONSTRAINT profession_unique UNIQUE (profession)
);

CREATE TABLE zip_code (
 city varchar(25),
 province varchar(25),
 zip_code bigserial CHECK (LENGTH (CAST(zip_code AS varchar(4))) <= 4),
 CONSTRAINT zip_key PRIMARY KEY (zip_code)
);

CREATE TABLE Status (
 status_id bigserial,
 status varchar(25),
 CONSTRAINT stat_key PRIMARY KEY (status_id)
);

CREATE TABLE my_contacts (
 contact_id bigserial,
 last_name varchar(50),
 first_name varchar(50),
 phone varchar (10),
 email varchar(50),
 gender varchar(10),
 birthday date,
 prof_id bigserial REFERENCES profession (prof_id),
 zip_code bigserial REFERENCES zip_code (zip_code),
 status_id bigserial REFERENCES status (status_id),
 CONSTRAINT email_unique UNIQUE (email),
 CONSTRAINT contact_key PRIMARY KEY (contact_id)
);

CREATE TABLE interests (
 interests_id bigserial,
 interests varchar(50),
 CONSTRAINT intr_key PRIMARY KEY (interests_id)
);

CREATE TABLE contact_interests (
 contact_id bigserial REFERENCES my_contacts (contact_id),
 interests_id bigserial REFERENCES interests (interests_id) 
);

CREATE TABLE seeking (
 seeking_id bigserial,
 seeking varchar(50),
 CONSTRAINT seek_key PRIMARY KEY (seeking_id)
);

CREATE TABLE contact_seeking (
 contact_id int REFERENCES my_contacts (contact_id),
 seeking_id int REFERENCES seeking (seeking_id)
);

INSERT INTO profession (profession)
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
	(0826, 'Giyani', 'Limpopo'),
	(1200, 'Mbombela', 'Mpumalanga'),
	(8800, 'Upington', 'Northern Cape'),
	(2570, 'Klerksdorp', 'North West'),
	(7100, 'Cape Town', 'Western Cape'),
	(2410, 'Baldour', 'Eastern Cape'),
	(9700, 'Bethlehem', 'Free State'),
	(2169, 'Randpark Ridge', 'Gauteng'),
	(4011, 'Durban', 'KZN'),
	(0850, 'Tzaneen', 'Limpopo'),
	(1270, 'Graskop', 'Mpumalanga'),
	(8300, 'Kimberley', 'Northern Cape'),
	(2735, 'Mahikeng', 'North West'),
	(7599, 'Stellenbosch', 'Western Cape');

SELECT * FROM zip_code

INSERT INTO Status (status)
VALUES ('Open Relationship'),
	('In a Relationship'),
	('Married'),
	('Divorced'),
	('Widowed'),
	('Single');

INSERT INTO interests (interests)
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

INSERT INTO seeking (seeking)
VALUES ('Relationship'),
('Friendship');

SELECT * FROM interests
DELETE FROM seeking
SELECT * FROM seeking


INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES ('Eddy', 'Quma', '0872341234', 'eddy@gmail.com', 'M', '2000-01-05', 1, 9300, 1),
('Jack', 'Uzaro', '0835716666', 'jack@gmail.com', 'M', '1998-09-17', 2, 4000, 5),
('Fundo', 'Thibela', '0866325786', 'fundo@gmail.com', 'F', '2000-01-30', 3, 5000, 2),
('Penny', 'Zulu', '0859100084', 'penny@gmail.com', 'F', '1995-03-13', 4, 6000, 1),
('Corrin', 'Ngwane', '0842999670', 'corrin@gmail.com', 'F', '1998-04-16', 5, 2551, 6),
('Vukosi', 'Mkhabela', '0835636030', 'vmk@gmail.com', 'M', '1990-12-16', 6, 3442, 1),
('Abdile', 'Kwena', '0839714819', 'andile@gmail.com', 'M', '1987-05-05', 7, 4559, 4),
('Lulama', 'Nkuna', '0834307963', 'lulama@gmail.com', 'F', '1993-07-18', 8, 3441, 4),
('Ripfumelo', 'Mawila', '0825138355', 'ray@gmail.com', 'F', '1992-09-10', 1, 0095, 3),
('Jazel', 'Mhlongo', '0821185849', 'Jazel@gmail.com', 'M', '2000-04-29', 2, 9301, 2),
('Grace', 'Mathebula', '0838839728', 'grace@gmail.com', 'F', '1997-01-08', 2, 4001, 1),
('Miyi', 'Mamba', '0828266837', 'mahazy@gmail.com', 'M', '1994-02-08', 3, 5001, 6),
('Nkulu', 'Buyi', '0846087530', 'nkulu@gmail.com', 'M', '1997-04-04', 4, 4559, 1),
('Steve', 'Mabaso', '0825558574', 'steve@gmail.com', 'M', '1991-11-22', 5, 2553, 6),
('Nqobile', 'Nkuna', '0832358342', 'nqonk@gmail.com', 'F', '2001-07-03', 6, 0094, 1);

SELECT * FROM my_contacts

INSERT INTO contact_interests (contact_id, interests_id)
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

SELECT * FROM contact_interests
DELETE FROM contact_interests

INSERT INTO contact_seeking (contact_id, seeking_id)
VALUES (2,99);

INSERT INTO contact_seeking (contact_id, seeking_id)
VALUES (1,1 ),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1);

DELETE FROM contact_seeking
SELECT * FROM contact_seeking

SELECT * FROM my_contacts 
INNER JOIN profession
ON my_contacts.prof_id = profession.prof_id
INNER JOIN seeking
ON my_contacts.contact_id = seeking.seeking_id
INNER JOIN interests
ON my_contacts.contact_id = interests.interests_id
INNER JOIN zip_code
ON my_contacts.contact_id = zip_code.zip_code

SELECT 	
my_contacts.last_name,my_contacts.first_name,
profession.profession,
status.status,
zip_code.city,
zip_code.province,
seeking.seeking,
interests.interests

SELECT *
FROM my_contacts INNER JOIN profession 
ON my_contacts.prof_id = profession.prof_id
INNER JOIN status
ON my_contacts.status_id = status.status_id
INNER JOIN zip_code
ON my_contacts.zip_code = zip_code.zip_code
INNER JOIN seeking 
ON my_contacts.contact_id = seeking.seeking_id
INNER JOIN interests
ON my_contacts.contact_id = interests.interests_id
ORDER BY  my_contacts;