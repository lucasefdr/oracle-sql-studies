-- Exemplo de INSERT
INSERT INTO departments
  (department_id, department_name, manager_id, location_id)
VALUES
  (280, 'Project Management', 103, 1400);

-- Exemplo de INSERT com valores nulos método explícito - Ordem da estrutura de tabelas
INSERT INTO departments VALUES (290, 'Project Management', NULL, NULL);

-- Exemplo de INSERT com valores nulos método implícito - Ordem da estrutura de tabelas
INSERT INTO departments
  (department_id, department_name)
VALUES
  (300, 'Business Intelligence');

-- Inserindo valores especiais retornados em função
INSERT INTO employees
  (employee_id,
   first_name,
   last_name,
   email,
   phone_number,
   hire_date,
   job_id,
   salary,
   commission_pct,
   manager_id,
   department_id)
VALUES
  (employees_seq.nextval,
   'Lucas',
   'Rosa',
   'lucas@email.com',
   '222-222',
   SYSDATE,
   'IT_PROG',
   5000,
   0.1,
   100,
   90);

UPDATE employees
   SET email        = '&email',
       phone_number = '&phone_number',
       hire_date    = '&hire_date'
 WHERE employee_id = 207;

COMMIT;

SELECT * FROM departments d WHERE d.department_id IN (280, 290, 300);
SELECT * FROM jobs j;
SELECT * FROM employees e ORDER BY e.employee_id DESC;

-- CREATE TABLE
CREATE TABLE sales_reps(id NUMBER(6, 0),
                        name VARCHAR2(20),
                        salary NUMBER(8, 2),
                        comission_pct NUMBER(2, 2));

INSERT INTO sales_reps
  (id, name, salary, comission_pct)
  SELECT e.employee_id, e.last_name, e.salary, e.commission_pct
    FROM employees e
   WHERE e.job_id = 'SA_REP';

SELECT * FROM sales_reps; 
