--
-- Oracle SQL Avançado 
--
-- Seção 27 - Consultas Hierárquicas
--
-- Aula 5 - Suprimindo Galhos (brunches) da Estrutura Hierárquica (árvore)
--

-- Consultas Hierárquicas

-- Conectar como HR

-- Suprimindo Galhos (brunches) da Estrutura Hierárquica (árvore)

-- Utilizando a Cláusula WHERE – Elimina as linhas (registros) que não satisfazem a cláusula WHERE

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
WHERE      employee_id <> 205
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

-- Comentando a cláusula WHERE

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
--WHERE      employee_id <> 205
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

-- Suprimindo Galhos (brunches) da Estrutura Hierárquica (árvore)

-- Utilizado a Cláusula Connect By - Elimina as linhas (registros) que não satisfazem a cláusula WHERE e todos suas linhas (registros) filhos

SELECT     LEVEL, employee_id, first_name, last_name, job_id, manager_id
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id AND 
                 employee_id <> 205;