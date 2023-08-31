CREATE OR REPLACE PROCEDURE prc_consulta_empregado(pemployee_id    IN employees.employee_id%TYPE,
                                                   pfirst_name     OUT employees.first_name%TYPE,
                                                   plast_name      OUT employees.last_name%TYPE,
                                                   pemail          OUT employees.email%TYPE,
                                                   pphone_number   OUT employees.phone_number%TYPE,
                                                   phire_date      OUT employees.hire_date%TYPE,
                                                   pjob_id         OUT employees.job_id%TYPE,
                                                   psalary         OUT employees.salary%TYPE,
                                                   pcommission_pct OUT employees.commission_pct%TYPE,
                                                   pmanager_id     OUT employees.manager_id%TYPE,
                                                   pdepartment_id  OUT employees.department_id%TYPE)

 IS
  -- nenhuma variável para declarar
BEGIN
  SELECT e.first_name,
         e.last_name,
         e.email,
         e.phone_number,
         e.hire_date,
         e.job_id,
         e.salary,
         e.commission_pct,
         e.manager_id,
         e.department_id
    INTO pfirst_name,
         plast_name,
         pemail,
         pphone_number,
         phire_date,
         pjob_id,
         psalary,
         pcommission_pct,
         pmanager_id,
         pdepartment_id
    FROM employees e
   WHERE e.employee_id = pemployee_id;

EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20001,
                            'Empregado não existe: ' || pemployee_id);
  WHEN OTHERS THEN
    raise_application_error(-20002,
                            'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
