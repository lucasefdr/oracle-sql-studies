DECLARE
  -- Declaração do Cursor
  CURSOR employees_cursor IS
    SELECT * FROM EMPLOYEES;

  -- RECORD com a mesma estrutura do Cursor
  employees_record employees_cursor%ROWTYPE;
BEGIN
  -- Inicializa o Cursor
  OPEN employees_cursor;

  FETCH employees_cursor
    INTO employees_record;

  -- Loop
  WHILE employees_cursor%FOUND LOOP
  
    DBMS_OUTPUT.PUT_LINE('Employee name: ' || employees_record.first_name || ' ' ||
                         employees_record.last_name);
  
    FETCH employees_cursor
      INTO employees_record;
  END LOOP;

  -- Fechando o Cursor
  CLOSE employees_cursor;

END;
