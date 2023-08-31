--
-- Oracle SQL Avançado 
--
-- Seção 27 - Consultas Hierárquicas
--
-- Aula 1 - Consultas Hierárquicas
--

-- Consultas Hierárquicas

-- Conectar como HR

-- Consultando a estrutura da Tabela employees

DESC employees

SELECT *
FROM   employees;

-- Consulta Hierárquica sobre a Tabela employees UP to DOWN a partir de manager_id IS NULL

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;