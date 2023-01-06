  -- Criando uma Procedure
  CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO(pfirst_name    employees.first_name%TYPE,
                                                   plast_name     employees.last_name%TYPE,
                                                   pemail         employees.email%TYPE,
                                                   pphone_number  employees.phone_number%TYPE,
                                                   phire_date     employees.hire_date%TYPE DEFAULT SYSDATE,
                                                   pjob_id        employees.job_id%TYPE,
                                                   psalary        employees.salary%TYPE,
                                                   pcommicion_pct employees.commicion_pct%TYPE,
                                                   pmanager_id    employees.manager_id%TYPE,
                                                   pdepartment_id employees.department_id%TYPE)

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
		RAISE_APPLICATION_ERROR(-20201, 'Error ' || SQLCODE || ', message: ' || SQLERRM);
END;
