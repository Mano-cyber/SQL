-- Database: DatingDB

-- DROP DATABASE "DatingDB";

CREATE DATABASE "DatingDB"
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
 CONSTRAINT prof_key PRIMARY KEY (prof_id)
);

CREATE TABLE zip_code (
 zip_code bigserial,
 city varchar(50),
 province varchar(50),
 CONSTRAINT zip_code_key PRIMARY KEY (zip_code)
);

INSERT INTO zip_code (city, province)
VALUES ('East London', 'Eastern Cape'),
	('Bloemfontein', 'Free State'),
	('Sunninghill', 'Gauteng'),
	('Newcastle', 'KZN'),
	('Giyani', 'Limpopo'),
	('Mbombela', 'Mpumalanga'),
	('Upington', 'Northern Cape'),
	('Klerksdorp', 'North West'),
	('Cape Town', 'Western Cape'),
	('Baldour', 'Eastern Cape'),
	('Bethlehem', 'Free State'),
	('Randpark Ridge', 'Gauteng'),
	('Durban', 'KZN'),
	('Tzaneen', 'Limpopo'),
	('Graskop', 'Mpumalanga'),
	('Kimberley', 'Northern Cape'),
	('Mahikeng', 'North West'),
	('Stellenbosch', 'Western Cape');

SELECT * FROM zip_code

CREATE TABLE status (
	status_id bigserial,
	status varchar(50),
	CONSTRAINT status_key PRIMARY KEY (status_id)
);

CREATE TABLE interests (
 interests_id bigserial,
 interests varchar(50),
 CONSTRAINT interests_key PRIMARY KEY (interests_id)
);

SELECT * FROM interests

CREATE TABLE contact_interest (
 	contact_id int REFERENCES interests (interests_id) ON DELETE CASCADE,
 	interest_id varchar(50),
	CONSTRAINT contact_interest_key PRIMARY KEY (contact_id)
);

SELECT * FROM contact_interest

CREATE TABLE seeking(
 seeking_id int REFERENCES contact_seeking (contact_id) ON DELETE CASCADE,
 seeking varchar(50),
 CONSTRAINT seeking_key PRIMARY KEY (seeking_id)
);

DROP TABLE seeking
CREATE TABLE contact_seeking (
 	contact_id int REFERENCES contact_interest (contact_id) ON DELETE CASCADE,
 	seeking_id varchar(50),
	CONSTRAINT seeking_id_key PRIMARY KEY (contact_id)
);

SELECT * FROM contact_seeking

CREATE TABLE my_contacts (
	contact_id int REFERENCES contact_seeking (contact_id) ON DELETE CASCADE,
	last_name varchar(100),
	first_name varchar(100),
	phone integer,
	email varchar(100),
	gender varchar(100),
	birthday varchar(100),
	prof_id int REFERENCES profession (prof_id) ON DELETE CASCADE,
	zip_code int REFERENCES zip_code (zip_code) ON DELETE CASCADE,
	status_id int REFERENCES status (status_id) ON DELETE CASCADE,
	CONSTRAINT contact_id_key_ PRIMARY KEY (contact_id),
	CONSTRAINT profession_zipcode_status_unique UNIQUE (contact_id, prof_id, zip_code, status_id)
);



