--
-- Oracle SQL Avançado 
--
-- Seção 34 - Aperfeiçoando a Cláusula Group By
--
-- Aula 3 - ROLLUP

-- ROLLUP

-- Utilizando ROLLUP

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city);

-- Utilizando a Função GROUPING_ID 

SELECT continent, GROUPING_ID(continent) GCONTINENT,
       country, GROUPING_ID(country) GCOUNTRY, 
       city, GROUPING_ID(city) GCITY,
       SUM(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city);





