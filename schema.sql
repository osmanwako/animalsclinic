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