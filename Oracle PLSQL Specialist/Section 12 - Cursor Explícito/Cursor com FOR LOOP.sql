DECLARE
  -- Declaração do Cursor
  CURSOR employees_cursor(pEmployee_id NUMBER) IS
    SELECT * FROM employees e WHERE e.employee_id = pEmployee_id;

BEGIN
  -- Loop
  FOR vEmployeesRecord IN employees_cursor(100) LOOP
  
    DBMS_OUTPUT.PUT_LINE('Employee name: ' || vEmployeesRecord.first_name || ' ' ||
                         vEmployeesRecord.last_name);
  
  END LOOP;
END;
