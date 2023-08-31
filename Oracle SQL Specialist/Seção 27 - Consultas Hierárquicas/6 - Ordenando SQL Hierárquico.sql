--
-- Oracle SQL Avançado 
--
-- Seção 27 - Consultas Hierárquicas
--
-- Aula 6 - Ordenando SQL Hierárquico
--

-- Consultas Hierárquicas

-- Conectar como HR

-- Ordenando SQL Hierárquico

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
ORDER SIBLINGS BY last_name;

