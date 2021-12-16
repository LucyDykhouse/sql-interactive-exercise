-- First, let's write a query that returns every movie_id from the Rooms table that has more than 75 seats.
SELECT movie_id FROM Rooms
WHERE seats > 75;

-- Next, turn this query into a subquery by wrapping it in parentheses. Then use the returned ids to find the matching movies and return their titles.
SELECT title FROM Movies
WHERE id IN
(SELECT movie_id FROM Rooms
WHERE seats > 75);

-- Write a subquery that returns the id of the rooms that have greater than the average number of seats
SELECT id FROM Rooms
WHERE seats >
(SELECT AVG(seats) FROM Rooms);

-- Add a join to the query so we can find movies playing in our rooms. Remember, not all rooms will have movies. Also, we may need to prefix the id column with the correct table name.
SELECT Rooms.id
FROM Rooms
LEFT OUTER JOIN Movies on Rooms.movie_id = Movies.id
WHERE Rooms.seats > (SELECT AVG(seats) FROM Rooms);


-- Let's also return the movie title in the result.
SELECT Rooms.id, Movies.title
FROM Rooms
LEFT OUTER JOIN Movies on Rooms.movie_id = Movies.id
WHERE Rooms.seats > (SELECT AVG(seats) FROM Rooms);

-- Lastly, create table aliases for both Rooms and Movies
SELECT r.id, m.title
FROM Rooms r
LEFT OUTER JOIN Movies m on r.movie_id = m.id
WHERE r.seats > (SELECT AVG(seats) FROM Rooms);
