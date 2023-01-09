  -- Criando uma Procedure
CREATE OR REPLACE PROCEDURE prc_insere_empregado(pfirst_name     IN employees.first_name%TYPE,
                                                 plast_name      IN employees.last_name%TYPE,
                                                 pemail          IN employees.email%TYPE,
                                                 pphone_number   IN employees.phone_number%TYPE,
                                                 phire_date      IN employees.hire_date%TYPE DEFAULT SYSDATE,
                                                 pjob_id         IN employees.job_id%TYPE,
                                                 psalary         IN employees.salary%TYPE,
                                                 pcommission_pct IN employees.commission_pct%TYPE,
                                                 pmanager_id     IN employees.manager_id%TYPE,
                                                 pdepartment_id  IN employees.department_id%TYPE) IS

BEGIN

  INSERT INTO employees
    (employee_id,
     first_name,
     last_name,
     email,
     phone_number,
     hire_date,
     job_id,
     salary,
     commission_pct,
     manager_id,
     department_id)
  VALUES
    (employees_seq.nextval,
     pfirst_name,
     plast_name,
     pemail,
     pphone_number,
     phire_date,
     pjob_id,
     psalary,
     pcommission_pct,
     pmanager_id,
     pdepartment_id);

EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20201,
                            'Error ' || SQLCODE || ', message: ' || SQLERRM);
END;
/
