-- SUB-QUERY - quais empregados possuem maior salário do que a média dos salários?
SELECT e.first_name || ' ' || e.last_name "NOME DO EMPREGADO",
       e.salary "SALÁRIO"
  FROM employees e
 WHERE e.salary > (SELECT AVG(e.salary) FROM employees e);

-- SUB-QUERY com HAVING 
SELECT e1.department_id, MAX(e1.salary)
  FROM employees e1
 GROUP BY e1.department_id
HAVING MAX(e1.salary) < (SELECT AVG(e2.salary) FROM employees e2);

-- SUB-QUERY multiple-row 
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.salary
  FROM employees e1
 WHERE e1.salary IN
       (SELECT AVG(e2.salary) FROM employees e2 GROUP BY e2.department_id);

SELECT e1.employee_id, e1.first_name, e1.last_name, e1.salary
  FROM employees e1
 WHERE e1.salary < ANY -- Qualquer 
 (SELECT e2.salary FROM employees e2 WHERE e2.job_id = 'IT_PROG');

SELECT e1.employee_id, e1.first_name, e1.last_name, e1.salary
  FROM employees e1
 WHERE e1.salary < ALL -- Todos 
 (SELECT e2.salary FROM employees e2 WHERE e2.job_id = 'IT_PROG');

-- EXISTS e NOT EXISTS
SELECT d.department_id, d.department_name
  FROM departments d
 WHERE EXISTS (SELECT e.department_id
          FROM employees e
         WHERE d.department_id = e.department_id);

SELECT d.department_id, d.department_name
  FROM departments d
 WHERE NOT EXISTS (SELECT e.department_id
          FROM employees e
         WHERE d.department_id = e.department_id);

-- SUB-QUERY correlacionada - retornar os empregados que recebem mais do que a média do seu departamento
SELECT e.employee_id, e.department_id, e.first_name, e.last_name, e.salary
  FROM employees e
 WHERE e.salary >= (SELECT TRUNC(AVG(NVL(ee.salary, 0)))
                      FROM employees ee
                     WHERE e.department_id = ee.department_id)
 ORDER BY e.department_id;

SELECT e.department_id, TRUNC(AVG(NVL(e.salary, 0)))
  FROM employees e
 WHERE e.department_id IN (50, 60)
 GROUP BY e.department_id;

-- SUB-QUERY MULTIPLE-COLUMN - retorna o funcionário que recebe o maior salário por cargo
SELECT e.employee_id, e.first_name, e.last_name, e.job_id, e.salary
  FROM employees e
 WHERE (e.job_id, e.salary) IN
       (SELECT ee.job_id, MAX(ee.salary)
          FROM employees ee
         GROUP BY ee.job_id);

-- SUB-QUERY no FROM - retorna o salário do empregado, o maior salário do cargo e a diferença
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.job_id,
       ROUND(e.salary) salary,
       ROUND(max_salary_job.max_salary),
       ROUND(e.salary - max_salary_job.max_salary) "DIFERENÇA"
  FROM employees e,
       (SELECT ee.job_id, MAX(ee.salary) max_salary
          FROM employees ee
         GROUP BY ee.job_id) max_salary_job
 WHERE e.job_id = max_salary_job.job_id(+);
