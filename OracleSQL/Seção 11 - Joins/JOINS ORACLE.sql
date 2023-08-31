-- EQUIJOIN 
SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- JOIN COM VÁRIAS COLUNAS
SELECT e.last_name, d.department_name, l.city, j.job_title
  FROM employees e, departments d, locations l, jobs j
 WHERE e.department_id = d.department_id
   AND d.location_id = l.location_id
   AND e.job_id = j.job_id;

-- LEFT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
  FROM employees e, departments d
 WHERE e.department_id = d.department_id(+)
 ORDER BY d.department_id;

-- RIGHT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
  FROM employees e, departments d
 WHERE e.department_id(+) = d.department_id
 ORDER BY d.department_id;
