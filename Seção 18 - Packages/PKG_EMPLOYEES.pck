CREATE OR REPLACE PACKAGE PKG_EMPLOYEES

 IS
  gMinSalary employees.salary%TYPE;

  PROCEDURE PRC_CONSULTA_EMPREGADO(pemployee_id    IN employees.employee_id%TYPE,
                                   pfirst_name     OUT employees.first_name%TYPE,
                                   plast_name      OUT employees.last_name%TYPE,
                                   pemail          OUT employees.email%TYPE,
                                   pphone_number   OUT employees.phone_number%TYPE,
                                   phire_date      OUT employees.hire_date%TYPE,
                                   pjob_id         OUT employees.job_id%TYPE,
                                   psalary         OUT employees.salary%TYPE,
                                   pcommission_pct OUT employees.commission_pct%TYPE,
                                   pmanager_id     OUT employees.manager_id%TYPE,
                                   pdepartment_id  OUT employees.department_id%TYPE);

  PROCEDURE PRC_INSERE_EMPREGADO(pfirst_name     IN employees.first_name%TYPE,
                                 plast_name      IN employees.last_name%TYPE,
                                 pemail          IN employees.email%TYPE,
                                 pphone_number   IN employees.phone_number%TYPE,
                                 phire_date      IN employees.hire_date%TYPE DEFAULT SYSDATE,
                                 pjob_id         IN employees.job_id%TYPE,
                                 psalary         IN employees.salary%TYPE,
                                 pcommission_pct IN employees.commission_pct%TYPE,
                                 pmanager_id     IN employees.manager_id%TYPE,
                                 pdepartment_id  IN employees.department_id%TYPE);

  PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO(pnemployee_id IN employees.employee_id%TYPE,
                                          pnpercentual  IN NUMBER);

  FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO(pemployee_id IN employees.employee_id%TYPE)
    RETURN NUMBER;

  FUNCTION FNC_CONSULTA_TITULO_CARGO(pjob_id IN jobs.job_id%TYPE)
    RETURN VARCHAR2;

END PKG_EMPLOYEES;
/
CREATE OR REPLACE PACKAGE BODY PKG_EMPLOYEES

 IS
  PROCEDURE PRC_CONSULTA_EMPREGADO(pemployee_id    IN employees.employee_id%TYPE,
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
                              'Erro Oracle: ' || SQLCODE || ' - ' ||
                              SQLERRM);
  END PRC_CONSULTA_EMPREGADO;

  PROCEDURE PRC_INSERE_EMPREGADO(pfirst_name     IN employees.first_name%TYPE,
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
    IF pSalary < PKG_EMPLOYEES.gMinSalary
    THEN
      RAISE_APPLICATION_ERROR(-20002,
                              'Salário não pode ser inferior à R$ ' ||
                              PKG_EMPLOYEES.gMinSalary);
    END IF;
  
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
                              'Error ' || SQLCODE || ', message: ' ||
                              SQLERRM);
  END PRC_INSERE_EMPREGADO;

  PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO(pnemployee_id IN employees.employee_id%TYPE,
                                          pnpercentual  IN NUMBER)
  
   IS
    -- Nenhuma declaração de variável
  BEGIN
    UPDATE employees e
       SET e.salary = e.salary * (1 + pnpercentual / 100)
     WHERE e.employee_id = pnemployee_id;
  
  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20001, 'Erro Oracle ' || SQLCODE || SQLERRM);
  END PRC_AUMENTA_SALARIO_EMPREGADO;

  FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO(pemployee_id IN employees.employee_id%TYPE)
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
                              'Erro Oracle: ' || SQLCODE || ' - ' ||
                              SQLERRM);
  END FNC_CONSULTA_SALARIO_EMPREGADO;

  FUNCTION FNC_CONSULTA_TITULO_CARGO(pjob_id IN jobs.job_id%TYPE)
    RETURN VARCHAR2 IS
    vjob_title jobs.job_title%TYPE;
  BEGIN
  
    SELECT j.job_title
      INTO vjob_title
      FROM jobs j
     WHERE j.job_id = pjob_id;
  
    RETURN vjob_title;
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(-20001, 'Cargo não existe: ' || pjob_id);
    WHEN OTHERS THEN
      raise_application_error(-20002,
                              'Erro Oracle: ' || SQLCODE || ' - ' ||
                              SQLERRM);
  END FNC_CONSULTA_TITULO_CARGO;

-- Iniciando a variável global quando a PKG é instanciada
BEGIN
  SELECT MIN(salary) INTO PKG_EMPLOYEES.gMinSalary FROM EMPLOYEES;

END PKG_EMPLOYEES;
/
