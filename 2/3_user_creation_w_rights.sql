-- Дополнить скрипт из предыдущего задания (2) выдачей
-- достаточных системных привилегий создаваемому
-- пользователю-разработчику, создать объекты от имени
-- пользователя-разработчика (пару таблиц, пару процедур, пару
-- представлений), создать роль для пользователя приложения и
-- выдать этой роли привилегии на созданные объекты. Создать
-- пользователя приложения и убедиться, что объекты ему
-- доступны.

 REM
 REM                Version 0.01.0000
 REM             Database creation script
 REM
 REM      This script must be run under SYS account
 REM

set verify off

prompt Creating profile...

accept profile_name prompt 'Please enter the name of the profile to generate: '
accept profile_parallel prompt 'Please enter the limit of parallel profile sessions: '
accept profile_max_idle_time prompt 'Please enter max idle time for profile: '

rem dropping the profile if already exists
declare
        res number;
begin
        select count(1) into res from DBA_PROFILES where upper(profile) = upper('&profile_name');

        if res <> 0 then
                execute immediate 'drop profile ' || upper('&profile_name') || ' cascade';
        end if;
end;
/

create profile &profile_name limit IDLE_TIME &profile_max_idle_time SESSIONS_PER_USER &profile_parallel;

prompt profile created...


prompt Creating schema user...

accept schema_name prompt 'Please enter the name of the schema to generate: '
accept schema_password prompt 'Please enter the password of the schema: '
accept oracle_service prompt 'Please enter the Oracle service name: '

rem dropping the user if already exists
declare
        res number;
begin
        select count(1) into res from all_users where upper(username) = upper('&schema_name');

        if res <> 0 then
                execute immediate 'drop user ' || upper('&schema_name') || ' cascade';
        end if;
end;
/

create user &schema_name identified by &schema_password PROFILE &profile_name;
grant connect to &schema_name;
grant create table to &schema_name;
grant create sequence to &schema_name;
grant create view to &schema_name;
grant create procedure to &schema_name;
GRANT UNLIMITED TABLESPACE TO &schema_name;

prompt user created...


CREATE TABLE &schema_name.departments
(
dep_id  NUMBER(6) PRIMARY KEY,
dep_name  VARCHAR(20)
)
ENABLE PRIMARY KEY USING INDEX
TABLESPACE USERS;

CREATE TABLE &schema_name.employees
(
employee_id  NUMBER(6) PRIMARY KEY,
dep_id      NUMBER(6) NOT NULL,
first_name  VARCHAR(20),
last_name   VARCHAR(25),
email       VARCHAR(25),
sallary     NUMBER(8, 2)
)
ENABLE PRIMARY KEY USING INDEX
TABLESPACE USERS;

ALTER TABLE &schema_name.employees ADD CONSTRAINT emp_fk1
FOREIGN KEY (dep_id) REFERENCES &schema_name.departments (dep_id);

CREATE OR REPLACE FUNCTION &schema_name.my_random
RETURN number IS rnd number;
begin
  select round(dbms_random.value(1,10)) into rnd from dual;
  return a;
end;
/

CREATE OR REPLACE VIEW &schema_name.employees_view AS
SELECT employee_id, first_name, last_name, dep_name, my_random AS rnd
FROM employees e
INNER JOIN departments d ON e.dep_id = d.dep_id;

-- user: nikita_develop
-- pass: 1234
-- Login with this user
