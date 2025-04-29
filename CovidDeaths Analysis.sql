-- Countries with the highest infection to population ratio
SELECT TOP 10 location AS country,
SUM(new_cases) AS cases,
MAX(population) AS population_,
ROUND(SUM(new_cases) / MAX(population) * 100, 2) AS infection_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL AND location IS NOT NULL AND new_cases IS NOT NULL
GROUP BY location
ORDER BY infection_percentage DESC;


-- Total cases and deaths over time
SELECT continent,
location AS country,
SUM(new_cases) AS cases,
SUM(new_deaths) AS deaths,
ROUND(SUM(new_deaths)/SUM(new_cases) * 100,2) AS percent_death
FROM CovidDeaths
WHERE continent IS NOT NULL AND location IS NOT NULL AND total_cases IS NOT NULL
GROUP BY continent, location
ORDER BY SUM(total_deaths)/SUM(total_cases) * 100 DESC;


-- Average cases and deaths recorded monthly accross the globe
SELECT
YEAR(date) AS year_,
FORMAT(date, 'MMMM') AS _month,
ROUND(AVG(new_cases),0) AS cases,
ROUND(AVG(new_deaths),0) AS deaths,
ROUND(AVG(new_deaths)/AVG(new_cases) * 100,2) AS percent_death
FROM CovidDeaths
GROUP BY YEAR(date), FORMAT(date, 'MMMM')
ORDER BY year_;


-- Countries with the highest death to infection ratio
SELECT TOP 10 location AS country,
SUM(new_deaths) AS deaths,
SUM(new_cases) AS cases,
ROUND(SUM(new_deaths) * 100 / SUM(new_cases),2) as casuality_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL AND location IS NOT NULL AND total_cases IS NOT NULL
GROUP BY location
ORDER BY casuality_percentage DESC;


--Countries with the highest cases
SELECT TOP 10 location AS country,
SUM(new_cases) AS cases
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY cases DESC;


--Countries with the highest casualities
SELECT TOP 10 location AS country,
SUM(new_deaths) AS casuality
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY casuality DESC;


--Most affected African Countries

WITH globe AS(
SELECT continent,
location AS country,
SUM(total_cases) AS cases,
SUM(total_deaths) AS deaths,
ROUND(SUM(total_deaths)/SUM(total_cases) * 100,2) AS percent_death
FROM CovidDeaths
WHERE continent IS NOT NULL AND location IS NOT NULL AND total_cases IS NOT NULL
GROUP BY continent, location
)

SELECT TOP 20 * FROM globe
WHERE continent = 'Africa'
ORDER BY percent_death DESC;


-- Monthly Tests
SELECT
YEAR(date) AS year_,
FORMAT(date, 'MMMM') AS _month,
ROUND(AVG(new_tests),0) AS tests_conducted
FROM CovidDeaths
GROUP BY YEAR(date), FORMAT(date, 'MMMM')
ORDER BY year_;


-- Monthly Test positivity rate
SELECT
YEAR(date) AS year_,
FORMAT(date, 'MMMM') AS _month,
ROUND(AVG(new_tests),0) AS tests_conducted,
ROUND(AVG(positive_rate),2) AS positivity_rate,
ROUND(AVG(positive_rate) * AVG(new_tests),0) AS positive_results
FROM CovidDeaths
GROUP BY YEAR(date), FORMAT(date, 'MMMM')
ORDER BY year_;


-- Top vaccinated countries
SELECT TOP 10 location AS country,
SUM(people_fully_vaccinated) AS vaccination,
AVG(population) AS population_,
SUM(people_fully_vaccinated)*100 / AVG(population) AS percent_vaccination
FROM CovidDeaths
WHERE people_fully_vaccinated IS NOT NULL AND population IS NOT NULL AND continent IS NOT NULL
GROUP BY location
ORDER BY percent_vaccination DESC;


