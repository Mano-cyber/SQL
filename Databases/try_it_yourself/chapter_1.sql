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
	
	
CREATE TABLE animals(
    animal_id bigserial,
    animal_type varchar(50)
);

insert into animals (animal_type)
values ('Zebra'),
('Lion'),
('Hyena'),
('Hippo'),
('Springbok');

select * from animals;

CREATE TABLE animal_specifics(
    animal_type varchar(25),
    age int,
    weight int,
    habitat varchar(25),
    diet varchar(25)
);

insert into animal_specifics (animal_type, age, weight, habitat, diet)
values ('Zebra',8,90,'Africa','herbivores'),
('Lion',12,88,'Africa','carnivores'),
('Hyena',5,35,'Africa','carnivores'),
('Hippo',8,150,'Africa','herbivores');

select * from animal_specifics;