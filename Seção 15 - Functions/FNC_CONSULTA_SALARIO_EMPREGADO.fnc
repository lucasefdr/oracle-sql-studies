CREATE OR REPLACE FUNCTION fnc_consulta_salario_empregado(pemployee_id IN NUMBER)
  RETURN NUMBER IS
  vsalary employees.salary%TYPE;
BEGIN
  SELECT e.salary
    INTO vsalary
    FROM employees e
   WHERE e.employee_id = pemployee_id;

  RETURN vsalary;

EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20001,
                            'Empregado não existe: ' || pemployee_id);
  WHEN OTHERS THEN
    raise_application_error(-20002,
                            'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;
