/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (1, 'Agumon', '2020-2-3', true, 0, 10.23);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', true, 2, 8);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (3, 'Pikachu', '2021-1-7', false, 1, 15.04);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (4, 'Devimon', '2017-5-12', true, 5, 11);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (5, 'Charmander', '2020-2-8', false, 0, -11);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (6, 'Plantmon', '2021-11-15', true, 2, -5.7);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (7, 'Squirtle', '1993-2-4', false, 3, -12.13);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (8, 'Angemon', '2005-6-12', true, 1, -45);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (9, 'Boarmon', '2005-6-7', true, 7, 20.4);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (10, 'Blossom', '1998-10-13', true, 3, 17);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_kg) VALUES (11, 'Ditto', '2022-5-14', true, 4, 22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = ( SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';

UPDATE animals SET species_id = ( SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');