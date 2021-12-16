-- Currently, our Actors table is allowing NULL values to be set on the name column. We don't want that! Add a constraint that prevents NULL values on the name column.
CREATE TABLE Actors (
  name varchar(50) NOT NULL,
  country varchar(50)
);

-- The Actors table is also allowing duplicate values for the name column. All values for this column must be unique, so let’s add a constraint that prevents a duplicate name from being inserted.
CREATE TABLE Actors (
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

-- First, move the UNIQUE constraint on the name column from a column constraint syntax to a table constraint syntax. Give this constraint the name name_lang.
CREATE TABLE Movies (
  name varchar(50) NOT NULL,
  language varchar(50),
  CONSTRAINT name_lang UNIQUE (name)
);

-- Now add the language column to the name_lang UNIQUE table constraint.
CREATE TABLE Movies (
  name varchar(50) NOT NULL,
  language varchar(50),
  CONSTRAINT name_lang UNIQUE (name, language)
);

-- Add a new id column to the Actors table with the int type.
CREATE TABLE Actors (
  id int,
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

-- Add a single constraint to the id column that ensures it is both UNIQUE and NOT NULL
-- Note: can have only one primary key per table but can have multiple not null unique values
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

-- A foreign key is a column in one table that references the primary key of another table
-- Create foreign key with references key word
-- Have to drop dependent entries/tables before the primary one is dropped
-- Add a FOREIGN KEY constraint to the country_id column in the Actors table that ensures values set to the country_id column match existing values for the id column on the Countries table.
CREATE TABLE Actors (
  id int,
  name varchar(50),
  country_id int REFERENCES Countries(id)
);

-- Add a PRIMARY KEY constraint to the id column on the Actors table.
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50),
  country_id int REFERENCES Countries(id)
);

-- Lastly, add a constraint that ensures values set to the name column are neither NULL or duplicates.
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country_id int REFERENCES Countries(id)
);

-- Change the FOREIGN KEY column constraint syntax for the country_id column to use the table constraint syntax.
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  FOREIGN KEY (country_id) REFERENCES Countries(id)
);

-- Trying to DROP the Countries table first will give us an error because there are rows on the Actors table that are referencing existing countries. Drop both tables in the appropriate order.
DROP TABLE Actors;
DROP TABLE Countries;

-- Some of our actors have been way underpaid. This is just not right! Add a CHECK constraint to prevent values less than 500 from being assigned to the salary column.
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  salary integer CHECK (salary >= 500),
  bonus integer,
  country_id int REFERENCES Countries(id)
);

-- On top of their salaries, actors will start receiving bonuses. However, values for bonus need to be less than values for salary. Add a CHECK column constraint to enforce this condition on the bonus column.
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  salary integer CHECK (salary >= 500),
  bonus integer CHECK (bonus < salary),
  country_id int REFERENCES Countries(id)
);