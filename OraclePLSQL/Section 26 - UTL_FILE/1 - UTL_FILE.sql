/* Create a directory reference */
CREATE OR REPLACE DIRECTORY FILES AS 'C:\oracle21c\files';
/

/* === Writing a file ===*/
DECLARE
  vfFile UTL_FILE.FILE_TYPE;

  CURSOR vcEmployees IS
    SELECT employee_id, first_name, last_name, job_id, salary
      FROM employees;
BEGIN
  -- UTL_FILE.FOPEN(directory, filename, type, size)
  vfFile := UTL_FILE.FOPEN('FILES', 'employees.txt', 'w', 32767);

  FOR vrEmployees IN vcEmployees LOOP
    UTL_FILE.PUT_LINE(vfFile,
                      vrEmployees.employee_id || ';' ||
                      vremployees.first_name  || ';' ||
                      vrEmployees.last_name   || ';' || 
                      vrEmployees.job_id      || ';' ||
                      vrEmployees.salary);
  END LOOP;

  UTL_FILE.FCLOSE(vfFile);

EXCEPTION
  WHEN UTL_FILE.INVALID_PATH THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Invalid path.');
  WHEN UTL_FILE.INVALID_OPERATION THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Invalid operation.');
  WHEN UTL_FILE.WRITE_ERROR THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Error writing file.');
  WHEN UTL_FILE.INVALID_MODE THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Invalid access mode.');
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Error:' || SQLCODE || SQLERRM);
END;
/

/* === Reading a file ===*/
DECLARE
  vfFile     UTL_FILE.FILE_TYPE;
  vsRegistro VARCHAR2(400);
BEGIN
  vfFile := UTL_FILE.FOPEN('FILES', 'employees.txt', 'r', 32767);
  LOOP
    UTL_FILE.GET_LINE(vfFile, vsRegistro);
    DBMS_OUTPUT.PUT_LINE(vsRegistro);
  END LOOP;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('File successfully read.');
  WHEN UTL_FILE.INVALID_PATH THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Invalid path.');
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(vfFile);
    DBMS_OUTPUT.PUT_LINE('Error:' || SQLCODE || SQLERRM);
  
END;
