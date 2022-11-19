DECLARE
  vsFirstName employees.first_name%type;
  vsLastName  employees.last_name%type;
  vnSalary    employees.salary%type;
  vnId        employees.employee_id%type := &vnId;
BEGIN
  SELECT e.first_name, e.last_name, e.salary
    INTO vsFirstName, vsLastName, vnSalary
    FROM employees e
   WHERE e.employee_id = vnId;

  DBMS_OUTPUT.PUT_LINE('ID: ' || vnId);
  DBMS_OUTPUT.PUT_LINE('First name: ' || vsFirstName);
  DBMS_OUTPUT.PUT_LINE('Last name: ' || vsLastName);
  DBMS_OUTPUT.PUT_LINE('Salary: ' || vnSalary);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20200, 'ID não encontrado');
  
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20200, 'Error ' || SQLERRM);
END;
