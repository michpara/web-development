#SELECT select

#Question 1
SELECT name 
  FROM world
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
SELECT name 
  FROM world 
 WHERE gdp >= ALL (SELECT gdp FROM world WHERE gdp >= 0 AND continent = 'Europe') 
   AND continent != 'Europe';

#Question 7
SELECT continent, name, area 
  FROM world x
 WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND population>0);

 #Question 8
   SELECT continent, name 
     FROM world x 
    WHERE name = (SELECT name FROM world y WHERE x.continent = y.continent LIMIT 1) 
 ORDER BY continent;

 #Question 9
 SELECT name, continent, population 
   FROM world x 
  WHERE 25000000 >= ALL(SELECT population FROM world y WHERE x.continent = y.continent);

 #Question 10
 SELECT name, continent 
   FROM world x 
  WHERE population > ALL (SELECT population*3 FROM world y WHERE x.continent = y.continent AND population > 0 AND y.name != x.name);

  #Quiz
  1. C
  2. B
  3. A
  4. D
  5. B
  6. B
  7. B
