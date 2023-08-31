--
-- Seção 11 
-- Exibindo dados a partir de Múltiplas Tabelas
--
-- Aula 6 - Joins utilizando sintaxe Oracle
-- 

-- EquiJoin utilizando Sintaxe Oracle

SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM   employees e,
       departments d
WHERE  (e.department_id = d.department_id)
ORDER BY e.department_id;

-- Joins entre várias tabelas utilizando Sintaxe Oracle

SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM   employees e,
       jobs j,
       departments d, 
       locations l
WHERE (e.job_id = j.job_id)               AND
      (d.department_id = e.department_id) AND
      (d.location_id = l.location_id)
ORDER BY e.employee_id;

-- Incluindo condições adicionais a condição de Join utilizando AND

SELECT e.employee_id, e.salary, j.job_title, 
       d.department_name, l.city, l.state_province, l.country_id
FROM   employees e,
       jobs j,
       departments d, 
       locations l
WHERE (e.job_id = j.job_id)  AND
      (d.department_id = e.department_id) AND
      (d.location_id = l.location_id)     AND
      (e.salary >= 1000)
ORDER BY e.employee_id;


-- NonequiJoin Utilizando Sintaxe Oracle

SELECT e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM   employees e,
       job_grades j
WHERE  NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary;

-- Outer Join Utilizando Sintaxe Oracle

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM   employees e,
       departments d
WHERE  e.department_id = d.department_id(+) 
ORDER BY e.department_id;

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM   employees e,
       departments d
WHERE  e.department_id(+) = d.department_id 
ORDER BY e.first_name;

-- Self-join Utilizando Sintaxe Oracle

SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
FROM   employees empregado,
       employees gerente
WHERE (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id;

DESC employees

-- Outer Join e Self Join Utilizando Sintaxe Oracle

SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
FROM   employees empregado,
       employees gerente
WHERE (empregado.manager_id = gerente.employee_id(+))
ORDER BY empregado.employee_id;

-- Produto Cartesiano

SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM   employees e, jobs j;

-- Corrigindo Produto Cartesiano

SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM   employees e, jobs j
WHERE  e.job_id = j.job_id;