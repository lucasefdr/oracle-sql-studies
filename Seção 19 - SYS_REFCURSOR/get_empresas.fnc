CREATE OR REPLACE FUNCTION get_empresas RETURN SYS_REFCURSOR 
IS
  return_cursor SYS_REFCURSOR;
BEGIN
  OPEN return_cursor FOR
    SELECT *
      FROM max_empresa;
  RETURN return_cursor;
END;
/
