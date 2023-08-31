DECLARE
  vnSalary NUMBER;
BEGIN
  SELECT PKG_EMPLOYEES.FNC_CONSULTA_SALARIO_EMPREGADO(100)
    INTO vnSalary
    FROM DUAL;

  DBMS_OUTPUT.PUT_LINE('The salary of employees with ID 100 is R$ ' ||
                       vnSalary);
END;
