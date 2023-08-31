-- MERGE
MERGE INTO tabela aliastabela
USING tabela | visao | subquery ALIAS
ON (condicao)
WHEN MATCHED THEN
  UPDATE SET coluna1 = valor1, coluna2 = valor2 DELETE WHERE .. .
WHEN NOT MATCHED THEN
  INSERT (coluna1.. .) VALUES (valor1.. .);

-- Criando tabela employees_copy
CREATE TABLE employees_copy AS
  SELECT * FROM employees WHERE 1 = 2;

-- MERGE
MERGE INTO employees_copy c
USING employees e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
  UPDATE
     SET c.first_name = e.first_name, c.last_name = e.last_name DELETE
   WHERE c.department_id IS NULL
WHEN NOT MATCHED THEN
  INSERT
  VALUES
    (e.employee_id,
     e.first_name,
     e.last_name,
     e.email,
     e.phone_number,
     e.hire_date,
     e.job_id,
     e.salary,
     e.commission_pct,
     e.manager_id,
     e.department_id);
