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