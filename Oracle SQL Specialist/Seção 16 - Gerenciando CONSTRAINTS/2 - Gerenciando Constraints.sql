--
-- Seção 16 
-- Criando e Gerenciando Constraints 
--
-- Aula 2 - Gerenciando Constraints
--

-- Consultando Constraints pelo Dicionário de Dados

SELECT co.constraint_name,
               co.constraint_type,
               co.search_condition,
               co.r_constraint_name,
               co.delete_rule,
               cc.column_name,
               cc.position,
               co.status
 FROM   user_constraints co
   JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND 
                                (co.table_name = cc.table_name)
 WHERE  co.table_name = 'PROJECTS'
 ORDER BY co.constraint_name,
          cc.position;
          
-- Removendo uma Constraint a uma Tabela

ALTER TABLE projects
DROP CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DROP CONSTRAINT projects_project_id_pk CASCADE;

-- Adicionando uma Constraint a uma Tabela

ALTER TABLE projects
ADD CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE projects
ADD CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id);

-- Desabilitando uma Constraint

ALTER TABLE projects
DISABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DISABLE CONSTRAINT projects_project_id_pk CASCADE;

-- Habilitando uma Constraint

ALTER TABLE projects
ENABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
ENABLE CONSTRAINT projects_project_id_pk;