/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (1, 'Agumon', '2020-2-3', true, 0, 10.23), (2, 'Gabumon', '2018-11-15', true, 2, 8), (3, 'Pikachu', '2021-1-7', false, 1, 15.04), (4, 'Devimon', '2017-5-12', true, 5, 11), (5, 'Charmander', '2020-2-8', false, 0, -11), (6, 'Plantmon', '2021-11-15', true, 2, -5.7), (7, 'Squirtle', '1993-2-4', false, 3, -12.13), (8, 'Angemon', '2005-6-12', true, 1, -45), (9, 'Boarmon', '2005-6-7', true, 7, 20.4), (10, 'Blossom', '1998-10-13', true, 3, 17), (11, 'Ditto', '2022-5-14', true, 4, 22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = ( SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';

UPDATE animals SET species_id = ( SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vet_id) VALUES (1, 1), (1, 3), (2, 3), (2, 4);

INSERT INTO visits (vet_id, animal_id, date) VALUES (1, 1, '2020-07-22'), (3, 1, '2020-07-22'), (4, 2, '2021-02-02'), (2, 3, '2020-01-05'), (2, 3, '2020-03-08'), (2, 3, '2020-05-14'), (3, 4, '2021-05-04'), (4, 5, '2021-02-24'), (2, 6, '2019-12-21'), (1, 6, '2020-08-10'), (2, 6, '2021-04-07'), (3, 7, '2019-09-29'), (4, 8, '2020-10-03'), (4, 8, '2020-11-04'), (2, 9, '2019-01-24'), (2, 9, '2019-05-15'), (2, 9, '2020-02-27'), (2, 9, '2020-08-03'), (3, 10, '2020-05-24'), (1, 10, '2021-01-11');

INSERT INTO visits (animal_id, vet_id, date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
