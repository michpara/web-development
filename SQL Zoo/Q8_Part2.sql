#SELECT null

#Question 1
SELECT SUM(A_STRONGLY_AGREE)
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

#Question 2
SELECT institution, subject
  FROM nss
 WHERE question='Q15' 
   AND score >= 100;

#Question 3
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50;

#Question 4
  SELECT subject, SUM(response)
    FROM nss
   WHERE question='Q22'
     AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design') 
GROUP BY subject;

#Question 5
  SELECT subject, SUM(((A_STRONGLY_AGREE)*response)/100) 
   FROM nss 
  WHERE question ='Q22' 
    AND subject 
     IN ('(8) Computer Science', '(H) Creative Arts and Design') 
GROUP BY subject;

#Quesiton 6
  SELECT subject, ROUND(SUM(A_STRONGLY_AGREE)/COUNT(response)) 
    FROM nss 
   WHERE question = 'Q22' 
     AND subject = '(8) Computer science' 
      OR subject = '(H) Creative Arts and Design' 
GROUP BY subject;

#Question 7
  SELECT institution, ROUND(SUM(score*response)/SUM(response)) 
    FROM nss 
   WHERE institution 
    LIKE '%Manchester%' 
     AND question = 'Q22' 
GROUP BY institution;

#Question 8
  SELECT institution, SUM(sample), SUM(CASE WHEN subject LIKE '%(8)%' THEN sample END)
    FROM nss
   WHERE question='Q01'
     AND (institution LIKE '%Manchester%')
GROUP BY institution;
