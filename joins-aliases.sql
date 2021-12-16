-- Join the Movies table with the Rooms table so that we only fetch movies that have an associated room.
SELECT * From Movies
INNER JOIN Rooms 
ON Movies.id = Rooms.movie_id;

-- Let's get a little more specific, and only return the movie title, the id for the room, and number of seats in the theatre.
SELECT Movies.title, Rooms.id, Rooms.seats From Movies
INNER JOIN Rooms 
ON Movies.id = Rooms.movie_id;

-- Now, let's filter the results more by only showing theatres with more than 75 seats. Remember, the WHERE clause should go after the JOIN syntax.
SELECT Movies.title, Rooms.id, Rooms.seats From Movies
INNER JOIN Rooms 
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75;

-- Finally, let's sort the result by seats in the theatre from most to least seats.
SELECT Movies.title, Rooms.id, Rooms.seats From Movies
INNER JOIN Rooms 
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY Rooms.seats DESC;

-- First, join the Actors table with the Actors_Movies table so that only actors participating in movies are returned on the result.
SELECT * FROM Actors
INNER JOIN Actors_Movies ON Actors.id = Actors_Movies.actor_id;

-- Next, create another INNER JOIN from the Actors_Movies table to the Movies table so that our result shows information about the movies.
SELECT * FROM Actors
INNER JOIN Actors_Movies ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies ON Actors_Movies.movie_id = Movies.id;

-- Great! Now change the query to only fetch actor names and movie titles.
SELECT Actors.name, Movies.title FROM Actors
INNER JOIN Actors_Movies ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies ON Actors_Movies.movie_id = Movies.id;

-- Lastly, let's sort this query by movie title, alphabetically.
SELECT Actors.name, Movies.title FROM Actors
INNER JOIN Actors_Movies ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies ON Actors_Movies.movie_id = Movies.id
ORDER BY Movies.title;

-- First, change the query to output "Movie Title" instead of just title on the result.
SELECT Movies.title "Movie Title", Rooms.id, Rooms.seats
FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY Rooms.seats desc;

-- Next, change the id field to print "Theatre Number".
SELECT Movies.title "Movie Title", 
Rooms.id "Theatre Number", 
Rooms.seats
FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY Rooms.seats desc;

-- Now, let's use table aliases to shorten the query. Alias Rooms to use "r" and Movies to "m".
SELECT m.title "Movie Title", 
r.id "Theatre Number", 
r.seats
FROM Movies m
INNER JOIN Rooms r
ON m.id = r.movie_id
WHERE r.seats > 75
ORDER BY r.seats desc;

-- Shorten this query to use 3 different table aliases.
SELECT a.name, m.title 
FROM Actors a
INNER JOIN Actors_Movies am
ON a.id = am.actor_id
INNER JOIN Movies m
ON am.movie_id = m.id
ORDER BY m.title;

-- First, create a query that returns all movies and also displays a movie's room if it's playing in a room. For this query, select everything (*).
SELECT * FROM Movies
LEFT OUTER JOIN Rooms ON Movies.id = Rooms.movie_id;

-- Now, let's select just the movie title and room id if it exists, and set a column alias for the room id to "Theatre Number"
SELECT Movies.title,
Rooms.id "Theatre Number"
FROM Movies
LEFT OUTER JOIN Rooms ON Movies.id = Rooms.movie_id;

-- Lastly, it doesn't look like we've used table aliases with this query, which is usually a good practice. Why don't we do that now?
SELECT m.title,
r.id "Theatre Number"
FROM Movies m
LEFT OUTER JOIN Rooms r ON m.id = r.movie_id;

-- Let's change the query to return all of the rooms and only the movies with associated rooms.
SELECT m.title, r.id "Theatre Number"
FROM Movies m
RIGHT OUTER JOIN Rooms r
ON m.id = r.movie_id;

