-
-- Seção 12 
-- Utilizando Sub-Consultas
--
-- Aula 4 - Utilizando Sub-Consulta Correlacionada
--
  
-- Utilizando Sub-Consultas Correlacionadas
               
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.department_id, e1.salary
FROM   employees e1
WHERE  e1.salary >= (SELECT    TRUNC(AVG(NVL(salary,0)),0)
                     FROM      employees e2
                     WHERE     e1.department_id = e2.department_id);
                   
SELECT    TRUNC(AVG(NVL(salary,0)),0)
FROM      employees e2
WHERE     e2.department_id = 60;

