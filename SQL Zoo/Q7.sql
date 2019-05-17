#SELECT more join

#Question 1
SELECT id, title
  FROM movie
 WHERE yr=1962;

#Question 2
SELECT yr 
  FROM movie 
 WHERE title = 'Citizen Kane';

#Question 3
  SELECT id, title, yr 
    FROM movie 
   WHERE title 
    LIKE '%Star Trek%' 
ORDER BY yr;

#Question 4
SELECT id 
  FROM actor 
 WHERE name = 'Glenn Close';

#Question 5
SELECT id 
  FROM movie 
 WHERE title = 'Casablanca';

#Question 6
SELECT name 
  FROM actor 
  JOIN casting 
    ON actor.id = actorid 
  JOIN movie 
    ON movie.id = movieid 
 WHERE movieid = 11768;

#Question 7
SELECT name 
  FROM actor 
  JOIN casting 
    ON actor.id = actorid 
  JOIN movie 
    ON movie.id = movieid 
 WHERE title = 'Alien';

#Question 8
SELECT title 
  FROM actor 
  JOIN casting 
    ON actor.id = actorid 
  JOIN movie 
    ON movie.id = movieid 
 WHERE name = 'Harrison Ford';
 
 #Queston 9
SELECT title 
  FROM actor 
  JOIN casting
    ON actor.id = actorid 
  JOIN movie 
    ON movie.id = movieid 
 WHERE name = 'Harrison Ford' 
   AND ord != 1;

#Question 10
SELECT title, name 
  FROM actor 
  JOIN casting 
    ON actor.id = actorid 
  JOIN movie 
    ON movie.id = movieid 
 WHERE ord =1 
   AND yr = 1962;

#Question 11
  SELECT yr, COUNT(title) 
    FROM movie 
    JOIN casting 
      ON movie.id = movieid
    JOIN actor   
      ON actorid = actor.id
   WHERE name = 'John Travolta'
GROUP BY yr
  HAVING COUNT(title)=(SELECT MAX(c)  
    FROM (SELECT yr,COUNT(title) 
      AS c 
    FROM movie 
    JOIN casting 
      ON movie.id=movieid
    JOIN actor   
      ON actorid=actor.id
   WHERE name='John Travolta'
GROUP BY yr) 
      AS t
);

#Question 12
SELECT title, name 
  FROM movie 
  JOIN casting 
    ON (movieid = movie.id AND ord =1) 
  JOIN actor 
    ON (actorid = actor.id) 
 WHERE movie.id 
    IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'));

#Question 13
  SELECT name 
    FROM actor 
    JOIN casting 
      ON casting.actorid = actor.id 
   WHERE ord =1 
GROUP BY name 
  HAVING COUNT(ord) >= 30;

#Question 14
  SELECT title, COUNT(actorid) 
    FROM movie 
    JOIN casting 
      ON movieid = movie.id
    JOIN actor 
      ON actorid = actor.id 
   WHERE yr = 1978 
GROUP BY title 
ORDER BY COUNT(name) DESC, title;

#Question 15
SELECT name 
 FROM actor 
 JOIN casting 
   ON actorid = actor.id 
 JOIN movie 
   ON movieid = movie.id 
WHERE movieid 
   IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Art Garfunkel')) 
  AND name != 'Art Garfunkel';

#Quiz
1. C
2. E
3. C
4. B
5. D
6. C
7. B
