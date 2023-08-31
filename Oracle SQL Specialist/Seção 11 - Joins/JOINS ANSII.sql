-- JOIN com ON
SELECT e.employee_id "EMPLOYEE ID",
       e.first_name || ' ' || e.last_name "NOME INTEIRO"
  FROM employees e
  JOIN departments d
    ON e.department_id = d.department_id;

-- NATURAL JOIN
SELECT d.department_id, d.department_name, l.city
  FROM departments d NATURAL
  JOIN locations l;

-- JOIN com USING
SELECT e.employee_id "EMPLOYEE ID",
       e.first_name || ' ' || e.last_name "NOME INTEIRO"
  FROM employees e
  JOIN departments d
 USING (department_id);

-- JOIN com várias tables
SELECT e.first_name, e.last_name, j.job_title, d.department_name, l.city
  FROM employees e
  JOIN jobs j
    ON e.job_id = j.job_id
  JOIN departments d
    ON e.department_id = d.department_id
  JOIN locations l
    ON d.location_id = l.location_id
 ORDER BY e.employee_id;

-- NONEQUIJOINS
SELECT e.job_id,
       e.first_name,
       e.last_name,
       j.grade_level,
       j.lowest_sal,
       j.highest_sal
  FROM employees e
  JOIN job_grades j
    ON NVL(e.salary, 0) BETWEEN j.lowest_sal AND j.highest_sal
 ORDER BY e.salary;

-- LEFT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
  FROM employees e
  LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
 ORDER BY d.department_id;

-- RIGHT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
  FROM employees e
 RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id
 ORDER BY d.department_id;

-- FULL OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
  FROM employees e
  FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
 ORDER BY d.department_id;

-- CROSS JOIN
SELECT e.last_name, d.department_name
  FROM employees e
 CROSS JOIN departments d;
