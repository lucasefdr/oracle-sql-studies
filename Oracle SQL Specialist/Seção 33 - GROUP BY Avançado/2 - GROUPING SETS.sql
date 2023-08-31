--
-- Oracle SQL Avançado 
--
-- Seção 34 - Aperfeiçoando a Cláusula Group By
--
-- Aula 2 - GROUPING SETS

-- GROUPING SETS

-- Conectar como usuário sales

SELECT *
FROM sales
ORDER BY continent, country, city;

SELECT continent, SUM(units_sold)
FROM sales 
GROUP BY continent;

SELECT country, SUM(units_sold)
FROM sales 
GROUP BY country;

SELECT city, SUM(units_sold)
FROM sales 
GROUP BY city;

-- Utilizando GROUPING SETS

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city);

-- Utilizando GROUPING SETS (Incluindo Total Geral)

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city, ());




