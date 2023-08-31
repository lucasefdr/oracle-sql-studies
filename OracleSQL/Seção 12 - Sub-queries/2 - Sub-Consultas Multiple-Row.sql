--
--
-- Seção 12 
-- Utilizando Sub-Consultas
--
-- Aula 2 - Sub-Consultas Multiple-row
-- 
                  
-- Sub-Consultas Multiple-row

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary IN 
                (SELECT    AVG(NVL(salary,0))
                 FROM      employees
                 GROUP BY  department_id);

-- Utilizando operador NOT IN em Sub-consultas Multiple-Row

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary NOT IN
                (SELECT    AVG(NVL(salary,0))
                 FROM      employees
                 GROUP BY  department_id);
                 
-- Utilizando operador ANY em Sub-consultas Multiple-Row

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                   (SELECT salary
                    FROM   employees
                    WHERE  job_id = 'IT_PROG');

-- Utilizando operador ALL em Sub-consultas Multiple-Row

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                   (SELECT salary
                    FROM   employees
                    WHERE  job_id = 'IT_PROG');
                    
-- Cuidados com Valores Nulos em uma Sub-consulta com Operador IN

SELECT emp.employee_id, emp.last_name
FROM   employees emp
WHERE  emp.employee_id IN (SELECT mgr.manager_id
                           FROM employees mgr);

-- Cuidados com Valores Nulos em uma Sub-consulta com Operador NOT IN

SELECT emp.employee_id, emp.last_name
FROM   employees emp
WHERE  emp.employee_id NOT IN (SELECT mgr.manager_id
                               FROM employees mgr);
