CREATE TABLE employees (
    employee_id     INT             NOT NULL PRIMARY KEY,
    first_name      VARCHAR(50)     NOT NULL,
    last_name       VARCHAR(50)     NOT NULL,
    email           VARCHAR(100)    NOT NULL UNIQUE,
    phone_number    VARCHAR(20),
    hire_date       DATE            NOT NULL,
    job_id          VARCHAR(10)     NOT NULL,
    salary          DECIMAL(10, 2)  NOT NULL,
    commission_pct  DECIMAL(5, 2),
    manager_id      INT,
    department_id   INT
);

INSERT INTO EMPLOYEES VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90);
INSERT INTO EMPLOYEES VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000.00, 0.00, 100, 90);
INSERT INTO EMPLOYEES VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000.00, 0.00, 100, 90);
INSERT INTO EMPLOYEES VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000.00, 0.00, 102, 60);
INSERT INTO EMPLOYEES VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000.00, 0.00, 103, 60);
INSERT INTO EMPLOYEES VALUES (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800.00, 0.00, 103, 60);
INSERT INTO EMPLOYEES VALUES (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800.00, 0.00, 103, 60);
INSERT INTO EMPLOYEES VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200.00, 0.00, 103, 60);
INSERT INTO EMPLOYEES VALUES (108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008.00, 0.00, 101, 100);
INSERT INTO EMPLOYEES VALUES (109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100);
INSERT INTO EMPLOYEES VALUES (110, 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100);


SELECT * FROM employees;

SELECT E2.manager_id, E1.first_name , E2.employee_id, E2.first_name FROM 
employees AS E1
INNER JOIN 
employees AS E2
ON E1.employee_id = E2.manager_id;


---
GO
DROP PROCEDURE TOP_10_EMPLOYEE_SALARY;
ALTER PROCEDURE  TOP_10_EMPLOYEE_SALARY
	@MAX_SALARY DECIMAL(8,2)
AS 
	BEGIN
	SET NOCOUNT ON;


		WITH RANK_SALARY AS (
			SELECT
			CONCAT_WS(' ',first_name,last_name) FULL_NAME, 
			employee_id,
			DENSE_RANK() OVER(ORDER BY SALARY DESC) AS TOP_10_SALARY
		FROM employees WHERE salary <= @MAX_SALARY)

	SELECT * FROM RANK_SALARY WHERE TOP_10_SALARY < 10;

END;

EXEC TOP_10_EMPLOYEE_SALARY @MAX_SALARY = 120000;

GO 

CREATE PROCEDURE GetHighEarningEmployees
    @SalaryThreshold DECIMAL(10, 2),
    @TotalEmployees INT OUTPUT,
    @AvgSalary DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Main result set
    SELECT 
        employee_id,
        first_name,
        last_name,
        job_id,
        salary,
        department_id
    FROM 
        employees
    WHERE 
        salary > @SalaryThreshold
    ORDER BY 
        salary DESC;

    -- Set output parameters
    SELECT 
        @TotalEmployees = COUNT(*),
        @AvgSalary = AVG(salary)
    FROM 
        employees
    WHERE 
        salary > @SalaryThreshold;
END;


DECLARE @Count INT, @Avg DECIMAL(10,2);

EXEC GetHighEarningEmployees 
    @SalaryThreshold = 8000.00, 
    @TotalEmployees = @Count OUTPUT, 
    @AvgSalary = @Avg OUTPUT;

SELECT @Count AS TotalEmployees, @Avg AS AverageSalary;


SELECT * FROM employees


GO

ALTER PROCEDURE GET_SALARY_BY_DEPARTMENT_GET_AVG_SALARY 
	@MAX_SALARY DECIMAL(10,2),
	@AGV_SALARY DECIMAL(10,2) OUT,
	@EMPLOYEE_COUNT INT OUT
AS 
SET NOCOUNT ON;
BEGIN 

	SELECT  department_id, SUM(salary) AS TOTAL_SALARY , COUNT(*) TOTAL_EMPLOYEES_IN_DEPARTMENT
	FROM employees WHERE salary <= @MAX_SALARY
	GROUP BY department_id
	ORDER BY TOTAL_SALARY;
	

	SELECT @AGV_SALARY = AVG(salary), @EMPLOYEE_COUNT = COUNT(*)
	FROM employees; 
END;

DECLARE @AVG DECIMAL(10,2), @TOTAL_EMPLOYEES INT
EXEC GET_SALARY_BY_DEPARTMENT_GET_AVG_SALARY @MAX_SALARY = 120000, 
			               @AGV_SALARY = @AVG OUT, 
				     @EMPLOYEE_COUNT = @TOTAL_EMPLOYEES OUT

SELECT @AVG AS AGARAVE_SALARY, @TOTAL_EMPLOYEES AS TOTAL_EMPLOYEES

