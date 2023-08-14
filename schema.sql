/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);

CREATE TABLE animals(id INT PRIMARY KEY, name VARCHAR(250) NOT NULL, date_of_birth DATE NOT NULL, escape_attempts INT, neutered BOOLEAN NOT NULL, weight_kg DECIMAL(8,2)); 