PL/SQL Developer Test script 3.0
15
DECLARE
  emps max_empresa%ROWTYPE;
  my_ref_cursor SYS_REFCURSOR;
BEGIN
  my_ref_cursor := get_empresas();
  
  LOOP
    FETCH my_ref_cursor
      INTO emps;
    EXIT WHEN my_ref_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Nome da empresa: ' || emps.razaosocial);
  END LOOP;
  
  CLOSE my_ref_cursor;
END;
0
3
emps.razaosocial
my_ref_cursor
