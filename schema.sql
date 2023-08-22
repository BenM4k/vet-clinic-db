/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INT PRIMARY KEY, name VARCHAR(250) NOT NULL, date_of_birth DATE NOT NULL, escape_attempts INT, neutered BOOLEAN NOT NULL, weight_kg DECIMAL(8,2));

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(255) NOT NULL, age INT, PRIMARY KEY (id) );

CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255), PRIMARY KEY (id) );

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR NOT NULL, age INT, date_of_graduation DATE, PRIMARY KEY (id));

CREATE TABLE specializations( vet_id INT NOT NULL, species_id INT NOT NULL);

ALTER TABLE specializations ADD CONSTRAINT fk_vet FOREIGN KEY (vet_id) REFERENCES vets(id);

ALTER TABLE specializations ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

CREATE TABLE visits( vet_id INT NOT NULL, animal_id INT NOT NULL, date DATE);

ALTER TABLE visits ADD CONSTRAINT fk_vet FOREIGN KEY (vet_id) REFERENCES vets(id);

ALTER TABLE visits ADD CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals(id);

CREATE INDEX animal_id_idx ON visits(animal_id);

CREATE INDEX vet_id_idx ON visits(vet_id);

CREATE INDEX email_idx ON owners (email);