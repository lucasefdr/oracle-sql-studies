DECLARE
  vsalary NUMBER;
BEGIN
  vsalary := fnc_consulta_salario_empregado(100);

  dbms_output.put_line('Salary: $' || vsalary);
END;
