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
SELECT yr,COUNT(title) 
  FROM movie 
  JOIN casting 
    ON movie.id=movieid
  JOIN actor   
    ON actorid=actor.id
 WHERE name='John Travolta'
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
#Question 13
#Question 14
#Question 15


























