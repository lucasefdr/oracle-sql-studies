-- Criando base para treinamento
DROP USER sales CASCADE;

CREATE USER sales 
IDENTIFIED BY sales 
DEFAULT TABLESPACE users 
QUOTA UNLIMITED ON users 
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO sales;

CREATE TABLE sales
(continent varchar(20),
 country varchar(20),
 city varchar(20),
 units_sold integer);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

COMMIT;

-- Consultar a Tabela sales
SELECT * FROM sales;

-- Utilizando GROUP BY para ver o sub-total por coluna
SELECT s.continent, SUM(s.units_sold)
FROM sales s
GROUP BY s.continent;

SELECT s.country, SUM(s.units_sold)
FROM sales s
GROUP BY s.continent;

SELECT s.city, SUM(s.units_sold)
FROM sales s
GROUP BY s.continent;

-- GROUPING SETS
SELECT coluna1, coluna2, coluna3, SUM(colunax) 
  FROM tabela 
 GROUP BY GROUPING SETS(coluna1, coluna2, coluna3, ());

-- Utilizando o GROUPING SETS
SELECT s.continent, s.country, s.city, SUM(s.units_sold) sum_units
  FROM sales s
 GROUP BY GROUPING SETS(s.continent, s.country, s.city,());

-- ROLLUP
SELECT coluna1, coluna2, coluna3, SUM(colunax) 
  FROM tabela 
 GROUP BY ROLLUP(coluna1, coluna2, coluna3);

-- Utilizando o ROLLUP
SELECT s.continent, s.country, s.city, SUM(s.units_sold) sum_units
  FROM sales s
 GROUP BY ROLLUP(s.continent, s.country, s.city);
 
 
