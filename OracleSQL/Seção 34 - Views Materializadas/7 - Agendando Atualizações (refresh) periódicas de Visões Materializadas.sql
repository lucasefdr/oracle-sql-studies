--
-- Oracle SQL Avançado 
--
-- Seção 34 - Visões Materializadas
--
-- Aula 8 - Agendando Atualizações (refresh) periódicas de Visões Materializadas

-- Agendando Atualizações (refresh) periódicas de Visões Materializadas

-- Conectar como usuário HR

-- Removendo Materialized View Log

DROP MATERIALIZED VIEW LOG ON employees;

-- Criando Materialized View Log

CREATE MATERIALIZED VIEW LOG ON employees;

-- Criando uma Materialized View sales_managers_vw não populada imediatamente
-- e que realiza a próximas atualizações (refreshes) a cada 1 dia

DROP MATERIALIZED VIEW mv_sales_manager;

CREATE MATERIALIZED VIEW mv_sales_manager
BUILD DEFERRED
REFRESH FORCE
NEXT sysdate + 1
AS
  SELECT *
  FROM   employees
  WHERE job_id = 'SA_MAN'
  ORDER BY department_id;

-- Consultando a Materialized View

SELECT *
FROM   mv_sales_manager;