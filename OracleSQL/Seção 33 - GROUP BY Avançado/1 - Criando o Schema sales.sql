--
-- Oracle SQL Avançado 
--
-- Seção 34 - Aperfeiçoando a Cláusula Group By
--
-- Aula 1 - Setup: Criando Schema sales

-- Setup: Criando Schema sales

-- Conectar como usuário SYS

DROP user sales cascade;

CREATE USER sales
IDENTIFIED BY sales
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO sales;

-- Criar conexão para Usuario sales utilizando o Serviço de Banco de Dados XEPDB1

-- Conectar como sales 

CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

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

SELECT *
FROM sales;
