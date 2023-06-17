/* Populate database with sample data. */
/*
 Animal: His name is Agumon. He was born on Feb 3rd, 2020, and 
 currently weighs 10.23kg. He was neutered and he has never tried to escape.
 
 Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. 
 She is neutered and she has tried to escape 2 times.
 
 Animal: His name is Pikachu. He was born on Jan 7th, 2021, and 
 currently weighs 15.04kg. He was not neutered and he has tried to escape once
 
 Animal: Her name is Devimon. She was born on May 12th, 2017, and 
 currently weighs 11kg. She is neutered and she has tried to escape 5 times
 */
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11);


/*
 Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. 
 He is not neutered and he has never tried to escape.
 Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. 
 She is neutered and she has tried to escape 2 times.
 Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. 
 He was not neutered and he has tried to escape 3 times.
 Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg.
 He is neutered and he has tried to escape once.
 Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. 
 He is neutered and he has tried to escape 7 times.
 Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg.
 She is neutered and she has tried to escape 3 times.
 Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg.
 He is neutered and he has tried to escape 4 times.
 */
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Charmander', '2020-02-08', 0, false, -11),
  ('Plantmon', '2021-11-15', 2, true, -5.7),
  ('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45),
  ('Boarmon', '2005-06-07', 7, true, 20.4),
  ('Blossom', '1998-10-13', 3, true, 17),
  ('Ditto', '2022-05-14', 4, true, 22);


/*
 Insert the following data into the owners table:
 Sam Smith 34 years old.
 Jennifer Orwell 19 years old.
 Bob 45 years old.
 Melody Pond 77 years old.
 Dean Winchester 14 years old.
 Jodie Whittaker 38 years old.
 */
INSERT INTO
  owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);


/*
 Insert the following data into the species table:
 Pokemon
 Digimon
 */
INSERT INTO
  species (name)
VALUES
  ('Pokemon'),
  ('Digimon');


/*
 Modify your inserted animals so it includes the species_id value:
 M1. If the name ends in "mon" it will be Digimon
 */
UPDATE
  animals
SET
  species_id = (
    SELECT
      id
    FROM
      species
    WHERE
      name = 'Digimon'
    LIMIT
      1
  )
where
  name LIKE '%mon';


/*
 Modify your inserted animals so it includes the species_id value:
 M2. All other animals are Pokemon.
 */
UPDATE
  animals
SET
  species_id = (
    SELECT
      id
    FROM
      species
    WHERE
      name = 'Pokemon'
    LIMIT
      1
  )
where
  name NOT LIKE '%mon';


/*
 Modify your inserted animals to include owner information (owner_id):
 M3. Sam Smith owns Agumon.
 */
UPDATE
  animals
SET
  owner_id = (
    SELECT
      id
    FROM
      owners
    WHERE
      full_name = 'Sam Smith'
    LIMIT
      1
  )
where
  name = 'Agumon';


/*
 M4. Jennifer Orwell owns Gabumon and Pikachu.
 */
UPDATE
  animals
SET
  owner_id = (
    SELECT
      id
    FROM
      owners
    WHERE
      full_name = 'Jennifer Orwell'
    LIMIT
      1
  )
where
  name IN ('Gabumon', 'Pikachu');


/*
 M5. Bob owns Devimon and Plantmon.
 */
UPDATE
  animals
SET
  owner_id = (
    SELECT
      id
    FROM
      owners
    WHERE
      full_name = 'Bob'
    LIMIT
      1
  )
where
  name = 'Devimon'
  OR name = 'Plantmon';


/*
 M6. Melody Pond owns Charmander, Squirtle, and Blossom.
 */
UPDATE
  animals
SET
  owner_id = (
    SELECT
      id
    FROM
      owners
    WHERE
      full_name = 'Melody Pond'
    LIMIT
      1
  )
where
  name IN ('Charmander', 'Squirtle', 'Blossom');


/*
 M7. Dean Winchester owns Angemon and Boarmon.
 */
UPDATE
  animals
SET
  owner_id = (
    SELECT
      id
    FROM
      owners
    WHERE
      full_name = 'Dean Winchester'
    LIMIT
      1
  )
where
  name IN ('Angemon', 'Boarmon');


/*
 V4. Insert the following data for vets:
 Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
 Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
 Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
 Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
 */
INSERT INTO
  vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');


/*
 V5.Insert the following data for specialties:
 Vet William Tatcher is specialized in Pokemon.
 Vet Stephanie Mendez is specialized in Digimon and Pokemon.
 Vet Jack Harkness is specialized in Digimon.
 */
INSERT INTO
  specializations (vet_id, species_id)
SELECT
  v.id as vet_id,
  s.id as species_id
from
  vets v,
  species s
WHERE
  s.name = 'Pokemon'
  AND v.name = 'William Tatcher';


INSERT INTO
  specializations (vet_id, species_id)
SELECT
  v.id as vet_id,
  s.id as species_id
from
  vets v,
  species s
WHERE
  v.name = 'Stephanie Mendez'
  AND (
    s.name = 'Pokemon'
    OR s.name = 'Digimon'
  );


INSERT INTO
  specializations (vet_id, species_id)
SELECT
  v.id as vet_id,
  s.id as species_id
from
  vets v,
  species s
WHERE
  s.name = 'Digimon'
  AND v.name = 'Jack Harkness';


/*
 Insert the following data for visits:
 V6. Agumon visited William Tatcher on May 24th, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2020-05-24' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Agumon'
  AND v.name = 'William Tatcher';


/*
 Agumon visited Stephanie Mendez on Jul 22th, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2020-07-22' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Agumon'
  AND v.name = 'Stephanie Mendez';


/*
 Gabumon visited Jack Harkness on Feb 2nd, 2021.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2021-02-02' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Gabumon'
  AND v.name = 'Jack Harkness';


/*
 V7.Pikachu visited Maisy Smith on Jan 5th, 2020.
 Pikachu visited Maisy Smith on Mar 8th, 2020.
 Pikachu visited Maisy Smith on May 14th, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  unnest('{2020-01-05,2020-03-08,2020-05-14}':: date []) as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Pikachu'
  AND v.name = 'Maisy Smith';


/*
 V8. Devimon visited Stephanie Mendez on May 4th, 2021.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2021-05-04' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Devimon'
  AND v.name = 'Stephanie Mendez';


/*
 V8. Charmander visited Jack Harkness on Feb 24th, 2021.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2021-02-24' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Charmander'
  AND v.name = 'Jack Harkness';


/*
 V9.Plantmon visited Maisy Smith on Dec 21st, 2019.
 Plantmon visited Maisy Smith on Apr 7th, 2021.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  unnest('{2019-12-21,2021-04-07}':: date []) as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Plantmon'
  AND v.name = 'Maisy Smith';


/*
 Plantmon visited William Tatcher on Aug 10th, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2020-08-10' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Plantmon'
  AND v.name = 'William Tatcher';


/*
 V9.Squirtle visited Stephanie Mendez on Sep 29th, 2019.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2019-09-29' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Squirtle'
  AND v.name = 'Stephanie Mendez';


/*
 V10. Angemon visited Jack Harkness on Oct 3rd, 2020.
 Angemon visited Jack Harkness on Nov 4th, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  unnest('{2020-11-04,2020-10-03}':: date []) as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Angemon'
  AND v.name = 'Jack Harkness';


/*
 V10.Boarmon visited Maisy Smith on Jan 24th, 2019.
 Boarmon visited Maisy Smith on May 15th, 2019.
 Boarmon visited Maisy Smith on Feb 27th, 2020.
 Boarmon visited Maisy Smith on Aug 3rd, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  unnest(
    '{2019-01-24,2019-05-15,2020-02-27,2020-08-03}':: date []
  ) as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Boarmon'
  AND v.name = 'Maisy Smith';


/*
 v10. Blossom visited Stephanie Mendez on May 24th, 2020.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2020-05-24' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Blossom'
  AND v.name = 'Stephanie Mendez';


/*
 V11. Blossom visited William Tatcher on Jan 11th, 2021.
 */
INSERT INTO
  visits (vet_id, animal_id, visit_date)
SELECT
  v.id as vet_id,
  a.id as animal_id,
  '2021-01-11' as visit_date
FROM
  animals a,
  vets v
where
  a.name = 'Blossom'
  AND v.name = 'William Tatcher';