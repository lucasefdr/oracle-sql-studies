--
-- Oracle SQL Avançado 
--
-- Seção 24 - Índices
--
-- Aula 1 - Índices

-- Índices

-- Conectar como usuário HR

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;
DROP INDEX employees_last_name_first_name_idx;
DROP INDEX employees_job_id_idx;
DROP INDEX employees_phone_number_idx;

-- FULL TABLE SCAN

SELECT *
FROM   employees;

-- Analize o custo do comando no plano de execução

SELECT *
FROM   employees
WHERE  phone_number = '515.127.4565';

-- Analize o custo do comando sem usar índice pelo plano de execução

-- Criando um Indice Único B-tree Simples

CREATE UNIQUE INDEX employees_phone_number_idx
ON employees(phone_number);

SELECT *
FROM   employees
WHERE  phone_number = '515.127.4565';

-- Analize o custo do comando pelo plano de execução - Note que agora ele deve estar utilizando o índice criado

-- Criando um Índice Unico automaticamente na criação da Constraint de Unique

DROP INDEX employees_phone_number_idx;

ALTER TABLE employees
ADD CONSTRAINT employees_phone_number_uk UNIQUE (phone_number);