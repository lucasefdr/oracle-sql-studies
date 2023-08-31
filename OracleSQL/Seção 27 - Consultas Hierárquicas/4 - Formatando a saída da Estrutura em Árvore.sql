--
-- Oracle SQL Avançado 
--
-- Seção 27 - Consultas Hierárquicas
--
-- Aula 4 - Consultas Hierárquicas - Formatando a saída da Estrutura em Árvore
--

-- Consultas Hierárquicas - Formatando a saída da Estrutura em Árvore

-- Conectar como HR

-- Consulta Hierárquica sobre a Tabela employees UP to DOWN a partir do manager_id IS NULL
-- Formatando Formatando a Estrutura em Árvore utilizando LPAD

SELECT     LEVEL, LPAD(last_name, LENGTH(last_name)+(LEVEL*4)-4,' ') last_name
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

SELECT     LPAD(LEVEL || '.' || last_name, LENGTH(LEVEL || '.' || last_name)+(LEVEL*4)-4,' ') last_name
FROM       employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;