--
-- Seção 12 
-- Utilizando Sub-Consultas
--
-- Aula 1 - Sub-Consultas Single-Row

-- Sub-Consultas Single-Row

SELECT first_name, last_name, job_id, salary
FROM   employees
WHERE  salary >
                (SELECT AVG(NVL(salary,0))
                 FROM employees);              

-- Utilizando Sub-consultas na Cláusula HAVING

SELECT e1.department_id, MAX(e1.salary)
FROM   employees e1
GROUP BY e1.department_id
HAVING MAX(salary) <  (SELECT AVG(e2.salary)
                       FROM   employees e2);
                                                  
-- Erros utilizando Sub-consultas Single-Row

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary =
                (SELECT    AVG(NVL(salary,0))
                 FROM      employees
                 GROUP BY  department_id);

-- O que ocorre quando a Sub-Consulta retorna nenhuma linha?

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  last_name =  (SELECT last_name
                     FROM   employees
                     WHERE  last_name = 'Suzuki');
                     
