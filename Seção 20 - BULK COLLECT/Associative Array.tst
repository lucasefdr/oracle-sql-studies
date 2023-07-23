PL/SQL Developer Test script 3.0
15
DECLARE
  -- Associative array
  TYPE max_empresa_table_type IS TABLE OF max_empresa%ROWTYPE INDEX BY BINARY_INTEGER;
  empresa_table max_empresa_table_type;
BEGIN
  SELECT *
    BULK COLLECT
    INTO empresa_table
    FROM max_empresa;
    
  FOR i IN empresa_table.FIRST .. empresa_table.LAST
  LOOP
    DBMS_OUTPUT.PUT_LINE('Nome da empresa: ' || empresa_table(i).razaosocial);
  END LOOP;
END;
1
empresa_table
0
0
5
empresa_table
empresa_table(i).nroempresa
empresa_table(i).razaosocial
i
