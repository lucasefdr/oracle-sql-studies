--
-- Oracle SQL Avançado 
--
-- Seção 28 - Expressões Regulares
--
-- Aula 2 - Utilizando REGEXP_LIKE 
--

-- Utilizando REGEXP_LIKE 

-- Conectar como HR

-- utilizando REGEXP_LIKE em uma consulta

-- Comparação case sensitivo (default) 

SELECT *
FROM   employees
WHERE   REGEXP_LIKE(first_name, '^Ste(v|ph)en$');

-- Comparação case sensitivo

SELECT *
FROM   employees
WHERE  REGEXP_LIKE(first_name, '^Ste(v|ph)en$', 'c');

-- Comparação case não sensitivo

SELECT *
FROM   employees
WHERE  REGEXP_LIKE(first_name, '^Ste(v|ph)en$','i');

-- utilizando REGEXP_LIKE em uma consulta constraint do tipo CHECK

DROP TABLE employees_copy;

CREATE table employees_copy 
AS
SELECT *
FROM   employees
WHERE  1=2;

ALTER TABLE employees_copy
ADD   CONSTRAINT phone_number_ck
CHECK (REGEXP_LIKE(phone_number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$'));