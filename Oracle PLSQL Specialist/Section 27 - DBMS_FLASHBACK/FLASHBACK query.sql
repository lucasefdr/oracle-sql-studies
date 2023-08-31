-- Query the table
SELECT * FROM employees;

-- Causing an error
UPDATE employees e SET e.salary = e.salary * 2;
COMMIT;

DECLARE
  CURSOR vcEmployees IS
    SELECT *
      FROM employees AS OF TIMESTAMP(systimestamp - INTERVAL '30' minute);

  vrEmployees employees%ROWTYPE;
BEGIN
  OPEN vcEmployees;

  LOOP
    FETCH vcEmployees
      INTO vrEmployees;
    EXIT WHEN vcEmployees%NOTFOUND;
  
    UPDATE employees e
       SET e.salary = vrEmployees.salary
     WHERE e.employee_id = vrEmployees.employee_id;
  END LOOP;
  CLOSE vcEmployees;
  COMMIT;
END;
/

-- undo_retention = 900s 
SELECT NAME, VALUE FROM v$parameter WHERE NAME LIKE '%undo%';

