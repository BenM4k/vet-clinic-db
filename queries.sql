/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT deleting_anials;
UPDATE animals SET weight_kg = weight_kg * - 1;
ROLLBACK TO deleting_anials;
UPDATE animals SET weight_kg = weight_kg * - 1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell'AND species.name = 'Digimon';

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(animals.id) DESC LIMIT 1;

SELECT animals.name FROM visits JOIN vets ON vet_id = vets.id JOIN animals ON animal_id = animals.id where vets.name = 'William Tatcher' ORDER BY date DESC LIMIT 1;

SELECT COUNT(date) FROM visits JOIN vets ON vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vet_id LEFT JOIN species ON species.id = species_id;

SELECT animals.name FROM visits JOIN animals ON animal_id = animals.id JOIN vets ON vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name FROM visits JOIN animals ON animal_id = animals.id GROUP BY animals.name ORDER BY COUNT(animals.id) DESC LIMIT 1;

SELECT animals.name FROM visits JOIN animals ON animal_id = animals.id JOIN vets ON vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY date LIMIT 1;

SELECT animals.name, vets.name, date FROM visits JOIN animals ON animal_id = animals.id JOIN vets ON vet_id = vets.id ORDER BY date DESC LIMIT 1;

SELECT COUNT(*) FROM visits JOIN animals ON animal_id = animals.id JOIN vets ON vet_id = vets.id JOIN specializations ON vets.id = specializations.vet_id WHERE animals.species_id !=  specializations.species_id;

SELECT species.name FROM visits JOIN animals ON animal_id = animals.id JOIN species ON animals.species_id = species.id JOIN vets ON vet_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(species.id) DESC LIMIT 1;