--
-- Oracle SQL Avançado 
--
-- Seção 34 - Aperfeiçoando a Cláusula Group By
--
-- Aula 4 - CUBE

-- CUBE

-- Conectar como usuário sales

-- Utilizando CUBE

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY CUBE(continent, country, city);




