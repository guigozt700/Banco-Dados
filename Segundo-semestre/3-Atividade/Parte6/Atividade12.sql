use Banco07_11

CREATE TABLE EMPLOYEES ( 
EMPLOYEE_ID INT PRIMARY KEY, 
FIRST_NAME VARCHAR(50), 
LAST_NAME VARCHAR(50), 
JOB_TITLE VARCHAR(50), 
SALARY DECIMAL(10,2), 
DEPARTMENT_ID INT, 
SEXO CHAR(1) 
); 

INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_ID, SEXO) VALUES 
(130, 'Carlos', 'Souza', 'Analista', 4500.00, 10, 'M'), 
(131, 'Mariana', 'Lima', 'Gerente', 7800.00, 20, 'F'), 
(132, 'Pedro', 'Silva', 'Assistente', 2800.00, 10, 'M'), 
(133, 'Juliana', 'Oliveira', 'Analista', 4200.00, 30, 'F'), 
(134, 'Rafael', 'Pereira', 'Diretor', 15000.00, 40, 'M'); 

-- 104----------------------

begin tran
	update EMPLOYEES
		set SALARY = 5000.00
	where EMPLOYEE_ID = 130
rollback

select * from EMPLOYEES

--105---------------------

begin tran
	delete EMPLOYEES
		where EMPLOYEE_ID = 130
commit
	
SELECT * FROM EMPLOYEES