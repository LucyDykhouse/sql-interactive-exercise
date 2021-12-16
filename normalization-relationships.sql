-- Normal Form Rules
-- 1: Tables must not contain repeating groups of data in 1 column
-- 2 Tables must not contain redundancy (unnecessary repeating information)
-- These rules necessitate the creation of join tables

-- First, let's add the new columns. The new columns we add should have type int to match the data they will hold. Per convention, let's name these columns actor_id and movie_id.
CREATE TABLE Actors_Movies (
    actor_id int,
    movie_id int
);

-- Now, let's add FOREIGN KEY constraints to both of these columns, as column constraints, referencing the appropriate tables.
CREATE TABLE Actors_Movies (
    actor_id int REFERENCES Actors,
    movie_id int REFERENCES Movies
);

-- Update the two NULL values in the INSERT statement to the appropriate actor_id and movie_id.
INSERT INTO Actors_Movies (actor_id, movie_id)
  VALUES (2, 5);

-- First, add the SQL to create the relationship. Add a movie_id column with the int type.
CREATE TABLE Rooms (
  id int PRIMARY KEY,
  seats int,
  movie_id int
);

-- Next, add the proper FOREIGN KEY constraint using the table constraint syntax, so we don't end up with orphaned records.
CREATE TABLE Rooms (
  id int PRIMARY KEY,
  seats int,
  movie_id int,
  FOREIGN KEY (movie_id) REFERENCES Movies
);

-- Lastly, in our theatre 1 movie can play in one room at a time. Let's add a constraint that will ensure that no movies are ever marked to play in the same room at the same time
CREATE TABLE Rooms (
  id int PRIMARY KEY,
  seats int,
  movie_id int UNIQUE,
  FOREIGN KEY (movie_id) REFERENCES Movies
);
