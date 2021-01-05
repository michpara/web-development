#SUM and COUNT

#Question 1
SELECT SUM(population)
  FROM world;

#Question 2
SELECT DISTINCT continent 
  FROM world;

#Question 3
SELECT SUM(gdp) 
  FROM world 
 WHERE continent = 'Africa';

#Question 4
SELECT COUNT(name)
  FROM world 
 WHERE area >= 1000000;

#Question 5
SELECT SUM(population) 
  FROM world 
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

#Question 6
  SELECT continent, COUNT(name) 
    FROM world 
GROUP BY continent;

#Question 7
  SELECT continent, COUNT(name) 
    FROM world 
   WHERE population >= 10000000 
GROUP BY continent;

#Question 8
  SELECT continent 
    FROM world 
GROUP BY continent 
  HAVING SUM(population) >= 100000000;

#Quiz
1. C
2. A
3. D
4. E
5. B
6. E
7. D
8. D