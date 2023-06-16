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


/*
 V1. Create a table named vets with the following columns:
 id: integer (set it as autoincremented PRIMARY KEY)
 name: string
 age: integer
 date_of_graduation: date
 */
CREATE TABLE
  vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER,
    date_of_graduation DATE NOT NULL
  );


/*
 V2. There is a many-to-many relationship between the tables species and vets:
 a vet can specialize in multiple species, and a species can have multiple
 vets specialized in it.Create a "join table" called specializations to 
 handle  this relationship.
 */
CREATE TABLE
  specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
  );


/*
 V3. There is a many-to-many relationship between the tables animals and vets:
 an animal can visit multiple vets and one vet can be visited by multiple 
 animals. Create a "join table" called visits to handle this relationship,
 it should also keep track of the date of the visit.
 */
CREATE TABLE
  visits (
    vet_id INTEGER REFERENCES vets(id),
    animal_id INTEGER REFERENCES animals(id),
    visit_date DATE DEFAULT now(),
    PRIMARY KEY (vet_id, animal_id, visit_date)
  );