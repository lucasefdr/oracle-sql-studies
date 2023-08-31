-- FLASHBACK QUERY 
SELECT coluna | expressao [, coluna | expressao ]
  FROM tabela AS OF TIMESTAMP TO_TIMESTAMP('dd/mm/yyyy hh24:mi:ss', 'data hora no formato');

SELECT coluna | expressao [, coluna | expressao ]
  FROM tabela AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL 'X' MINUTE);

-- FLASHBACK QUERY na prática
SELECT e.employee_id, e.first_name, e.last_name, e.job_id, e.salary
  FROM employees e
 WHERE e.job_id = 'FI_ACCOUNT';

UPDATE employees e
   SET e.salary = e.salary * 2
 WHERE e.job_id = 'FI_ACCOUNT';

DECLARE
  CURSOR c_employees IS
    SELECT *
      FROM employees AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '15' MINUTE);

  r_employees c_employees%ROWTYPE;
BEGIN
  OPEN c_employees;

  LOOP
    FETCH c_employees
      INTO r_employees;
  
    EXIT WHEN c_employees%NOTFOUND;
  
    UPDATE employees e
       SET e.salary = r_employees.salary
     WHERE e.employee_id = r_employees.employee_id;
  END LOOP;

  CLOSE c_employees;

  COMMIT;
END;
