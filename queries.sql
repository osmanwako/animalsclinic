/*Queries that provide answers to the questions from all projects.*/
/*
 1. Find all animals whose name ends in "mon".
 */
SELECT
  *
FROM
  animals
WHERE
  name LIKE '%mon';


/*
 2. List the name of all animals born between 2016 and 2019.
 */
SELECT
  name
FROM
  animals
WHERE
  date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';


/*
 3. List the name of all animals that are neutered and
 have less than 3 escape attempts.
 */
SELECT
  name
FROM
  animals
WHERE
  neutered = true
  AND escape_attempts < 3;


/*
 4. List the date of birth of all animals named either "Agumon" or "Pikachu".
 */
SELECT
  date_of_birth
FROM
  animals
WHERE
  name = 'Agumon'
  OR name = 'Pikachu';


/*
 5. List name and escape attempts of animals that weigh more than 10.5kg
 */
SELECT
  name,
  escape_attempts
FROM
  animals
WHERE
  weight_kg > 10.5;


/*
 6. Find all animals that are neutered.*/
SELECT
  *
FROM
  animals
WHERE
  neutered = true;


/*
 7. Find all animals not named Gabumon.
 */
SELECT
  *
FROM
  animals
WHERE
  name != 'Gabumon';


/*
 8.  Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the
 weights that equals precisely 10.4kg or 17.3kg)
 */
SELECT
  *
FROM
  animals
WHERE
  weight_kg BETWEEN 10.4 AND 17.3;


/*
 Transaction SQL
 T1.Inside a transaction update the animals table by setting the species 
 column to unspecified. Verify that change was made. Then roll back the 
 change and verify that the species columns went back to the state before the transaction.
 */
BEGIN TRANSACTION;


UPDATE
  animals
SET
  species = 'unspecified';


SELECT
  *
FROM
  animals
WHERE
  species = 'unspecified';


ROLLBACK;


SELECT
  *
FROM
  animals;


/*
 Inside a transaction:
 T2.Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
 T3. Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
 Verify that changes were made.
 Commit the transaction.
 T4. Verify that changes persist after commit.
 */
BEGIN TRANSACTION;


UPDATE
  animals
SET
  species = 'digimon'
WHERE
  name LIKE '%mon';


UPDATE
  animals
SET
  species = 'pokemon'
WHERE
  species IS NULL;


COMMIT TRANSACTION;


SELECT
  *
FROM
  animals;


/*
 Now, take a deep breath and... Inside a transaction
 T5. delete all records in the 
 animals table, then roll back the transaction.
 After the rollback verify if all records in the animals table still exists.
 After that, you can start breathing as usual ;) 
 */
BEGIN TRANSACTION;


DELETE FROM
  animals;


ROLLBACK TRANSACTION;


SELECT
  *
FROM
  animals;


/*
 Inside a transaction:
 T6. Delete all animals born after Jan 1st, 2022.
 Create a savepoint for the transaction.
 T7. Update all animals' weight to be their weight multiplied by -1.
 Rollback to the savepoint
 T8. Update all animals' weights that are negative to be their weight multiplied by -1.
 Commit transaction
 */
BEGIN TRANSACTION;


DELETE FROM
  animals
WHERE
  date_of_birth > '2022-01-01';


SAVEPOINT clinic_savepoint;


UPDATE
  animals
SET
  weight_kg = weight_kg * -1;


ROLLBACK TO SAVEPOINT clinic_savepoint;


SELECT
  *
from
  animals;


UPDATE
  animals
SET
  weight_kg = weight_kg * -1
WHERE
  weight_kg < 0;


COMMIT TRANSACTION;