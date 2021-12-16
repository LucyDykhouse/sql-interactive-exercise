-- Write a query that returns the maximum value for the salary column in the Actors table.

SELECT MAX(salary)
FROM Actors;

-- Let's add another value to the return of this query. This time, add a function call that returns the minimum value for the salary column in the Actors table.
SELECT MAX(salary), MIN(salary)
FROM Actors;

-- Write a query that returns the total number of actors in the Actors table.
SELECT COUNT(*)
FROM Actors;

-- Let's add a WHERE clause to filter the result set. Go ahead and filter the results to only count American actors.
SELECT COUNT(*)
FROM Actors
WHERE country = 'USA';

-- Write a query that adds up all of the values from the salary column in the Actors table.
SELECT SUM(salary)
FROM Actors;

-- Write a query that calculates the average salary for all actors in our Actors table.
SELECT AVG(salary)
FROM Actors;

-- Now filter the query in order to calculate the average of only American actors.
SELECT AVG(salary)
FROM Actors
WHERE country = 'USA';

-- Use the GROUP BY clause to write a query that returns the country name and total salary paid to actors for each country.
SELECT country, SUM(salary)
FROM Actors
GROUP BY country;

-- Now use the HAVING clause to add a filter so that only countries with more than 1 actor are returned from our SQL query.
SELECT country, SUM(salary)
FROM Actors
GROUP BY country
HAVING COUNT(*) > 1;

-- Lastly, let’s add a condition to filter only actors with a supporting role. This condition will need to be run before the grouping of records happen.
SELECT country, SUM(salary)
FROM Actors
WHERE role = 'supporting'
GROUP BY country
HAVING COUNT(*) > 1;