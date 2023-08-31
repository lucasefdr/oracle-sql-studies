CREATE OR REPLACE PROCEDURE prc_consulta_empregado(pemployee_id    IN NUMBER,
                                                   pfirst_name     OUT VARCHAR2,
                                                   plast_name      OUT VARCHAR2,
                                                   pemail          OUT VARCHAR2,
                                                   pphone_number   OUT VARCHAR2,
                                                   phire_date      OUT DATE,
                                                   pjob_id         OUT VARCHAR2,
                                                   psalary         OUT NUMBER,
                                                   pcommission_pct OUT NUMBER,
                                                   pmanager_id     OUT NUMBER,
                                                   pdepartment_id  OUT NUMBER)

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
   WHERE e.employee_id = pemployeeid;

EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20001,
                            'Empregado não existe: ' || pemployee_id);
  WHEN OTHERS THEN
    raise_application_error(-20002,
                            'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;
