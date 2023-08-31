--
-- Oracle SQL Avançado 
--
-- Seção 27 - Consultas Hierárquicas
--
-- Aula 2 - Consultas Hierárquicas Up to Down e Bottom to Up
--

-- Consultas Hierárquicas Up to Down e Bottom to Up

-- Conectar como HR

-- Consulta Hierárquica sobre a Tabela employees UP to DOWN a partir do employee_id = 103 

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH employee_id = 103
CONNECT BY PRIOR employee_id = manager_id;

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH employee_id = 103
CONNECT BY manager_id = PRIOR employee_id;

-- Consulta Hierárquica sobre a Tabela employees BOTTOM to UP a partir do employee_id = 103 

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH employee_id = 103
CONNECT BY PRIOR manager_id = employee_id;

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH employee_id = 103
CONNECT BY employee_id = PRIOR manager_id;

-- Consulta Hierárquica sobre a Tabela employees UP to DOWN a partir do manager_id IS NULL

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY manager_id = PRIOR employee_id;

-- Consulta Hierárquica sobre a Tabela employees BOTTOM to UP a partir do manager_id IS NULL

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR manager_id = employee_id;

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY employee_id = PRIOR manager_id;
