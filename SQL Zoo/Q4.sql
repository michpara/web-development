#SELECT select

#Question 1
SELECT name FROM world
 WHERE population >(SELECT population FROM world WHERE name='Russia');

#Question 2
SELECT name 
  FROM world 
 WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom') 
   AND continent = 'Europe';

#Question 3
SELECT name, continent
  FROM world 
 WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia') 
 ORDER BY name;

#Question 4
SELECT name, population 
  FROM world 
 WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
   AND population < (SELECT population FROM world WHERE name = 'Poland');

#Question 5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100), '%') 
  FROM world 
 WHERE continent = 'Europe';

#Question 6






#Question 7
SELECT continent, name, area 
  FROM world x
 WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND population>0);