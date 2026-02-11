SELECT Name, Population
FROM country
WHERE Continent = 'South America'
ORDER BY Population ASC
LIMIT 1;

SELECT COUNT(*) as total_ciudades
FROM city
WHERE Population > 2000000;

SELECT Continent, SUM(Population) AS poblacion_total
FROM country
GROUP BY Continent
ORDER BY poblacion_total DESC;

SELECT city.Name, country.Continent
FROM city
JOIN country
ON city.CountryCode = country.Code
WHERE country.Continent = 'South America';

SELECT country.Name, countrylanguage.Language as Idioma_oficial
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';

SELECT country.Name, countrylanguage.Language as Idioma
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Spanish'
AND countrylanguage.IsOfficial = 'T';