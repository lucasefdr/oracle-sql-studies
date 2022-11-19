DECLARE
  vnDepartmentId employees.department_id%type := &vnDdepartmentId;
  vnPercentual   NUMBER(3) := 10;
BEGIN
  UPDATE employees e
     SET e.salary = salary * (1 + vnPercentual / 100)
   WHERE e.department_id = vnDepartmentId;

  DBMS_OUTPUT.PUT_LINE('Número de empregados atualizados: ' || SQL%ROWCOUNT);
  ROLLBACK;
END;
