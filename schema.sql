/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;


CREATE TABLE
  animals (
    id SERIAL PRIMARY KEY,
    name text not null,
    date_of_birth date not null,
    escape_attempts integer default 0,
    neutered boolean,
    weight_kg decimal not null
  );


ALTER TABLE
  animals
ADD
  species varchar(255);


/*
 Create a table named owners with the following columns:
 id: integer (set it as autoincremented PRIMARY KEY)
 full_name: string
 age: integer
 */
CREATE TABLE
  owners (id SERIAL PRIMARY KEY, full_name VARCHAR, age INTEGER);


/*
 Create a table named species with the following columns:
 id: integer (set it as autoincremented PRIMARY KEY)
 name: string
 */
CREATE TABLE
  species (id SERIAL PRIMARY KEY, name VARCHAR);


/*
 Modify animals table:
 Make sure that id is set as autoincremented PRIMARY KEY
 Remove column species
 */
ALTER TABLE
  animals DROP COLUMN species;


/*
 Add column species_id which is a foreign key referencing species table
 */
ALTER TABLE
  animals
ADD
  COLUMN species_id INTEGER REFERENCES species(id);


/*
 Add column owner_id which is a foreign key referencing the owners table
 */
ALTER TABLE
  animals
ADD
  COLUMN owner_id INTEGER REFERENCES owners(id);


--  Remember all this goes in schema.sql file.