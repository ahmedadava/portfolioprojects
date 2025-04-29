-- Checking out the student's distribution by region and gender

SELECT region, gender, AVG(age) AS avg_age
FROM students
WHERE region IS NOT NULL
GROUP BY region, gender;

-- Checking Academic level by gender

SELECT gender, academic, COUNT(*) AS count
FROM students
WHERE gender IS NOT NULL
GROUP BY gender, academic;

-- Looking at the prevelance of suicidal thought

SELECT dep, suicide, COUNT(*) AS count
FROM students
WHERE dep IS NOT NULL AND suicide IS NOT NULL
GROUP BY dep, suicide;

-- Severity of depression by support gained

SELECT depsev, partner_bi, friends_bi, doctor_bi
FROM students
WHERE depsev like 'M%'


-- Relatioship between the level of fear and depression

SELECT afear, dep, COUNT(*) AS count
FROM students
WHERE afear IS NOT NULL AND dep IS NOT NULL
GROUP BY afear, dep;


--Social support received by gender and academics

SELECT 
  gender,
  academic,
  SUM(CASE WHEN partner_bi = 'Yes' THEN 1 ELSE 0 END) AS partner,
  SUM(CASE WHEN friends_bi = 'Yes' THEN 1 ELSE 0 END) AS friends,
  SUM(CASE WHEN doctor_bi = 'Yes' THEN 1 ELSE 0 END) AS doctor,
  SUM(CASE WHEN religion_bi = 'Yes' THEN 1 ELSE 0 END) AS religion
FROM students
WHERE gender IS NOT NULL AND academic IS NOT NULL
GROUP BY gender, academic;

-- Use of Relationship supports by depression level

SELECT depsev,
SUM(CASE WHEN partner_bi = 'Yes' THEN 1 ELSE 0 END) AS partner_support,
SUM(CASE WHEN friends_bi = 'Yes' THEN 1 ELSE 0 END) AS friend_support
FROM students
WHERE depsev LIKE '%M%' OR depsev LIKE '%S%'
GROUP BY depsev;

-- Impact of social support on suciadal thought

WITH Impact AS(
SELECT 
  suicide,
  SUM(CASE WHEN partner_bi = 'Yes' THEN 1 ELSE 0 END) AS partner,
  SUM(CASE WHEN friends_bi = 'Yes' THEN 1 ELSE 0 END) AS friends,
  SUM(CASE WHEN doctor_bi = 'Yes' THEN 1 ELSE 0 END) AS doctor,
  SUM(CASE WHEN religion_bi = 'Yes' THEN 1 ELSE 0 END) AS religion
FROM students
WHERE gender IS NOT NULL AND academic IS NOT NULL
GROUP BY suicide
)
SELECT suicide,
AVG(partner + friends + doctor) AS support_received
FROM Impact GROUP BY suicide;

-- Checking the International Students' length of stay(years), their depression level, their level of socialization and stress level due to the new culture
SELECT stay,
COUNT(CASE WHEN inter_dom ='Inter' THEN 1 ELSE NULL END) AS count_int,
ROUND(AVG(CASE WHEN inter_dom = 'Inter' THEN todep ELSE NULL END),2) AS average_phq,
ROUND(AVG(CASE WHEN inter_dom = 'Inter' THEN tosc ELSE null END),2) AS average_scs,
ROUND(AVG(CASE WHEN inter_dom = 'Inter' THEN toas ELSE null END),2) AS average_as
FROM students
WHERE stay is not null
GROUP BY stay
ORDER BY stay DESC