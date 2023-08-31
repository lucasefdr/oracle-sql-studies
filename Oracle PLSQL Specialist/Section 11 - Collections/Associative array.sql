DECLARE
  TYPE numero_table_type IS TABLE OF NUMBER(2) INDEX BY BINARY_INTEGER;

  numero_table numero_table_type;
BEGIN
  FOR i IN 1 .. 10 LOOP
    numero_table(i) := i;
  END LOOP;

  FOR i IN 1 .. 10 LOOP
    DBMS_OUTPUT.PUT_LINE('Associative array: Index: ' || i || ', valor: ' ||
                         numero_table(i));
  END LOOP;
END;
