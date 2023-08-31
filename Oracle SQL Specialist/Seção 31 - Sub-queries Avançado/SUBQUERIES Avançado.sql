-- Cláusula WITH
WITH max_salaries AS
 (SELECT department_id,
         MAX(salary) max_salary,
         ROUND(AVG(salary), 2) avg_salary
    FROM employees
   GROUP BY department_id)
SELECT e.employee_id,
       e.salary,
       e.department_id,
       max_salaries.max_salary,
       max_salaries.avg_salary
  FROM employees e
  JOIN max_salaries
    ON (e.department_id = max_salaries.department_id);

-- UPDATE com sub-query correlacionada
UPDATE tabela a1
   SET (coluna1, coluna2) =
       (SELECT coluna1, coluna2 FROM tabela b1 WHERE a1.coluna1 = b2.coluna1);

-- Treinamento
DROP TABLE dp_avg_temp;

CREATE TABLE dp_avg_temp(department_id NUMBER(4),
                         salary_avg NUMBER(8, 2),
                         comission_pct NUMBER(2, 2));

INSERT INTO dp_avg_temp
  SELECT department_id, 0, 0 FROM employees GROUP BY department_id;

SELECT * FROM dp_avg_temp;

UPDATE dp_avg_temp dp
   SET (dp.SALARY_AVG, dp.COMISSION_PCT) =
       (SELECT ROUND(AVG(e.salary), 2), ROUND(AVG(e.commission_pct), 2)
          FROM employees e
         WHERE dp.department_id = e.department_id
         GROUP BY e.department_id);

 WITH salaries AS
  (SELECT e.department_id,
          MAX(e.salary) max_salary,
          MIN(e.salary) min_salary,
          ROUND(AVG(e.salary), 2) avg_salary
     FROM employees e
    GROUP BY department_id)
 SELECT e.employee_id,
        e.first_name,
        e.salary,
        e.department_id,
        s.max_salary,
        s.min_salary,
        s.avg_salary
   FROM employees e, salaries s
  WHERE e.department_id = s.department_id;
