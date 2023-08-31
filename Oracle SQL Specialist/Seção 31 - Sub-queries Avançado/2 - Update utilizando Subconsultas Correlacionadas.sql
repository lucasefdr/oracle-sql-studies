--
-- Oracle SQL Avançado 
--
-- Seção 31 - Subconsultas
--
-- Aula 2 - Update utilizando Subconsultas Correlacionadas

-- Update utilizando Subconsultas Correlacionadas

-- Conectar como usuário hr

-- Criando a Tabela departments_average_temp

DROP TABLE departments_average_temp;

CREATE table departments_average_temp
(department_id   NUMBER(4),
 salary_average  NUMBER(8,2),
 commission_pct_average  NUMBER(2,2));
 
-- Inicializando a Tabela departments_average_temp

INSERT INTO departments_average_temp
  SELECT department_id, 0, 0
  FROM employees
  GROUP BY department_id;

COMMIT;

-- Consultando a Tabela departments_average_temp

SELECT *
FROM   departments_average_temp;

-- Update utilizando Subconsultas Correlacionadas

UPDATE departments_average_temp d
SET (d.salary_average, d.commission_pct_average) = (SELECT ROUND(AVG(e.salary),2), AVG(e.commission_pct)
                                                    FROM   employees e
                                                    WHERE  d.department_id = e.department_id
                                                    GROUP BY e.department_id);
                                                    
COMMIT;

-- Consultando a Tabela departments_average_temp

SELECT *
FROM   departments_average_temp;