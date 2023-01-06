CREATE OR REPLACE NONEDITIONABLE PROCEDURE prc_aumenta_salario_empregado(pnemployee_id IN NUMBER,
                                                                         pnpercentural IN NUMBER)

 IS
  -- Nenhuma declaração de variável
BEGIN
  UPDATE employees e
     SET e.salary = e.salary * (1 + pnpercentural / 100)
   WHERE e.employee_id = pnemployee_id;

EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20001, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;
/
