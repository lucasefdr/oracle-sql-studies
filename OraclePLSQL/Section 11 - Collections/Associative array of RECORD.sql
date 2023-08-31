DECLARE
  TYPE employees_table_type IS TABLE OF employees%ROWTYPE;

  employees_table employees_table_type;
BEGIN
  SELECT * BULK COLLECT INTO employees_table FROM employees;

  FOR i IN employees_table.first .. employees_table.last LOOP
    DBMS_OUTPUT.PUT_LINE('Employee name: ' || employees_table(i).first_name || ' ' || employees_table(i).last_name);
  END LOOP;
END;

