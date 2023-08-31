-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW nomeview
BUILD [IMMEDIATE | DEFERRED]
REFRESH [FAST | COMPLETE | FORCE]
ON [COMMIT | DEMAND]
[[ENABLE | DISABLE] QUERY REWRITE]
[ON PREBUILT TABLE] 
AS SELECT ...;

-- Dando permissão ao usuário para criação de MATERIALIZED VIEW
GRANT CREATE MATERIALIZED VIEW TO KNELADEV

-- Removendo MATERIALIZED VIEW
DROP MATERIALIZED VIEW mv_department_max_salaries;

-- Criando MATERIALIZED VIEW
CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE
REFRESH COMPLETE 
ON DEMAND
ENABLE QUERY REWRITE 
AS 
SELECT e.department_id, MAX(e.salary)
  FROM employees e
 GROUP BY e.department_id
 ORDER BY e.department_id, MAX(e.salary);
 
SELECT * FROM mv_department_max_salaries;

-- MATERIALIZED VIEW LOG
DROP MATERIALIZED VIEW LOG ON employees;
CREATE MATERIALIZED VIEW LOG ON employees;

DROP MATERIALIZED VIEW mv_department_salaries;

CREATE MATERIALIZED VIEW mv_department_salaries
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS 
SELECT e.department_id,
       SUM(e.salary) sum_salary,
       ROUND(AVG(NVL(e.salary, 0)), 2) avg_salary
  FROM employees e
 GROUP BY e.department_id;

SELECT * FROM mv_department_salaries;
