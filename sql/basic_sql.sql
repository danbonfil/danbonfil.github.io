-- SELECT, FROM, DISTINCT
SELECT 
    *
FROM
    parks_and_recreation.employee_demographics;
--

SELECT 
    first_name, last_name, age, age + 5
FROM
    parks_and_recreation.employee_demographics;

--
SELECT 
    DISTINCT gender, first_name
FROM
    parks_and_recreation.employee_demographics;

-- WHERE STATEMENT
SELECT 
    *
FROM
    employee_salary
WHERE
    first_name = 'Leslie';

--
SELECT 
    *
FROM
    employee_salary
WHERE
    salary <= 50000;

--
SELECT 
    *
FROM
    employee_salary
WHERE
    salary < 50000;

--
SELECT 
    *
FROM
    employee_salary
WHERE
    salary <= 50000;
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    gender != 'Female';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
AND gender = 'Male';

--
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
OR gender = 'Male';

--
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
OR NOT gender = 'Male';

--
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
OR gender != 'Male';

--
SELECT 
    *
FROM
    employee_demographics
WHERE
    (first_name = 'Leslie' AND age = 44)
OR age > 55;

-- LIKE STATEMENT
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name = 'Jer';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE 'Jer%';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE '%Jer%';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE 'A%';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE 'A__';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE 'A__%';
    
--
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE '%an%';
    
-- GROUP BY STATEMENT
SELECT 
    gender
FROM
    employee_demographics
GROUP BY gender;

-- AGGREGATING FUNCTIONS
SELECT 
    gender, AVG(age) -- Average is an aggregate function that can be applied to age by gender
FROM
    employee_demographics
GROUP BY gender;

--
SELECT 
    gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM
    employee_demographics
GROUP BY gender;

--
SELECT 
    occupation, salary -- select two, group two, otherwise you only get the selected or error
FROM
    employee_salary
GROUP BY occupation, salary;

-- ORDER BY STATEMENT
SELECT *
FROM employee_demographics
ORDER BY first_name ASC; -- ASC DEFAULT

--
SELECT *
FROM employee_demographics
ORDER BY gender;

--
SELECT *
FROM employee_demographics
ORDER BY gender, age;

--
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;

--
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 1;

--
SELECT *
FROM employee_demographics
WHERE gender = 'Male'
ORDER BY age DESC
LIMIT 1;

--
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

--
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'	-- FILTER AT THE ROW LEVEL, MAINLY FOR FILTERING 
GROUP BY occupation
HAVING AVG(salary) > 75000	-- FILTER AT THE AGGREGATE LEVEL (MUST USE HAVING WITH AGG AV, MIN, MAX, COUNT)
;

--
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
;

-- LIMIT AND ALIASING
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

-- START AT 3 AND TAKE ONE AFTER
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3,1;

-- ALIAS TO RENAME COLUMN, USE AS
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

-- ####### INTERMEDIATE
-- JOINTS: BIND TWO OR MORE TABLES IF THEY HAVE A COMMON COLUMN

-- INNER same columns from both tables
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;
    -- USING ON MUST SPECIFY THE PROCEDENCE OF VARIABLE WITH DATAFRAME.VARIABLE

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    -- USING ON MUST SPECIFY THE PROCEDENCE OF VARIABLE WITH DATAFRAME.VARIABLE

-- OUTTER JOIN. CAN BE LEFT OR RIGHT (EVERYTHING FROM LEFT WITH MATCHES RIGHT)
SELECT *
FROM employee_demographics AS dem -- LEFT TABLE
LEFT JOIN employee_salary AS sal -- RIGHT TABLE
	ON dem.employee_id = sal.employee_id;
    -- USING ON MUST SPECIFY THE PROCEDENCE OF VARIABLE WITH DATAFRAME.VARIABLE

SELECT *
FROM employee_demographics AS dem -- LEFT TABLE
RIGHT JOIN employee_salary AS sal -- RIGHT TABLE
	ON dem.employee_id = sal.employee_id;
    -- USING ON MUST SPECIFY THE PROCEDENCE OF VARIABLE WITH DATAFRAME.VARIABLE

-- SELF JOIN (TIE THE TABLE TO ITSELF)
SELECT *
FROM employee_salary AS emp1
JOIN employee_salary emp2 -- SAME WITHOUT AS
	ON emp1.employee_id = emp2.employee_id
;

SELECT *
FROM employee_salary AS emp1
JOIN employee_salary emp2 -- SAME WITHOUT AS
	ON emp1.employee_id + 1 = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.first_name AS first_name_santa,
emp2.last_name AS last_name_santa
FROM employee_salary AS emp1
JOIN employee_salary emp2 -- SAME WITHOUT AS
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- JOIN MULTIPLE TABLES TOGETHER, 1, 2, 3
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

-- UNIONS allows to join rows from other or same tables (bad data different rows)
SELECT age, gender
FROM employee_demographics 
UNION
SELECT first_name, last_name
FROM employee_salary
;

-- SAME CASES 
SELECT first_name, last_name
FROM employee_demographics 
UNION
SELECT first_name, last_name
FROM employee_salary
;

-- DISTINCT, SAME AS UNION ALONE
SELECT first_name, last_name
FROM employee_demographics 
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

-- ALL, INCLUDES REPEATED OBSERVATIONS
SELECT first_name, last_name
FROM employee_demographics 
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;


-- LABELS employees that meet WHERE CRITERIA
SELECT first_name, last_name, 'Old' AS Label
FROM employee_demographics 
WHERE age > 50 
;

-- LABELS employees that meet WHERE CRITERIA
-- UNION with high paid employee
SELECT first_name, last_name, 'Old' AS Label
FROM employee_demographics 
WHERE age > 50 
UNION
SELECT first_name, last_name, 'Highly Paid' AS HighPay
FROM employee_salary
WHERE salary > 50000
;

-- LABELS employees that meet WHERE CRITERIA
-- UNION with high paid employee
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics 
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics 
WHERE age > 40 AND gender = 'Female'
;

-- LABELS employees that meet WHERE CRITERIA
-- 3 UNIONS with high paid employee
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics 
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics 
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid' AS HighPay
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;


-- STRING FUNCTIONS

-- LENGHT
SELECT length('hellowhellow');

SELECT first_name, length(first_name) characters
FROM employee_demographics
ORDER BY 1 -- ALPHA
;

SELECT first_name, length(first_name) characters
FROM employee_demographics
ORDER BY 2 -- ASCENDING
;

-- UPPER, change lower to upper case
SELECT UPPER('hellowhellow');

SELECT first_name, UPPER(first_name) characters
FROM employee_demographics
ORDER BY 1 -- ALPHA
;

SELECT first_name, UPPER(first_name) characters
FROM employee_demographics
ORDER BY 2 -- ASCENDING
;


-- TRIMP, remove part from beginning L or end R
SELECT TRIM('    hellow    ');
SELECT LTRIM('    hellow    ');
SELECT RTRIM('    hellow    ');
SELECT first_name, UPPER(first_name) characters
FROM employee_demographics
ORDER BY 1 -- ALPHA
;

-- SUBSTRING, START POSITION AND NUMBER OF CHARS N,N
SELECT first_name, 
LEFT(first_name, 4), -- HOW MANY characters FROM LEFT DO I WANT
RIGHT(first_name, 4), -- HOW MANY characters FROM LEFT DO I WANT
substring(first_name,3,2), -- START on position 3 from left, and give 2 characters
birth_date,
substring(birth_date,6,2)
FROM employee_demographics
;


-- REPLACE
SELECT first_name, replace(first_name,'a','z')
FROM employee_demographics
;

-- LOCATE
SELECT locate('n','Daniel')
;

-- LOCATE
SELECT first_name, locate('na',first_name)
FROM employee_demographics
;


-- CONCAT, combine columns
SELECT first_name, last_name,
CONCAT(first_name,' ', last_name)
FROM employee_demographics
;


-- CASE STATEMENTS, allows logic if else
SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM employee_demographics
;

-- CASE STATEMENTS, allows logic if else
SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN 'BYE'
END AS Age_Bracket
FROM employee_demographics
;


-- CASE STATEMENTS, allows logic if else
-- PAY INCREASE
-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10% bonus
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary*1.05
    WHEN salary > 50000 THEN salary*1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary*.1
END AS Bonus
FROM employee_salary
;

-- SUBQUERIES (WHERE AND IN)
SELECT * FROM parks_and_recreation.employee_demographics
WHERE employee_id IN (
					SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1
					)
;

-- SUBQUERIES (WHERE AND IN) WRONG BECAUSE AVERAGE PER ROW
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- SUBQUERIES (WHERE AND IN), NOW SUBQUERY GETS THE AVERAGE OF ALL
SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

--
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

--
SELECT *
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_tab
 ;
 
 --
SELECT gender, AVG(`MAX(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_tab
GROUP BY gender
 ;
 
  --
SELECT AVG(av_age)
FROM
(SELECT gender, AVG(age) AS av_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age) AS ct_age
FROM employee_demographics
GROUP BY gender) AS Agg_tab
 ;


-- WINDOW FUNCTIONS 
SELECT gender, AVG(salary) AS av_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- WINDOW FUNCTIONS (INSTEAD OF GROUP BY USE OVER)
SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- WINDOW FUNCTIONS (INSTEAD OF GROUP BY USE OVER) THEN PARTITION BY GENDER, you get the same as group by but in each row
SELECT gender, AVG(salary) OVER(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, gender, AVG(salary) as av_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender
;

SELECT dem.first_name, dem.last_name, gender, 
SUM(salary) OVER(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- ROLLING TOTAL
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(partition by gender order by dem.employee_id) AS rolltol
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- ROW NUMBER 
SELECT dem.first_name, dem.last_name, gender, salary,
row_number() OVER(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- ROW NUMBER 
SELECT dem.first_name, dem.last_name, gender, salary,
row_number() OVER(partition by gender ORDER BY salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- ROW NUMBER rank
SELECT dem.first_name, dem.last_name, gender, salary,
row_number() OVER(partition by gender ORDER BY salary DESC) as row_num,
RANK() OVER(partition by gender ORDER BY salary DESC) rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- ROW NUMBER dense rank
SELECT dem.first_name, dem.last_name, gender, salary,
row_number() OVER(partition by gender ORDER BY salary DESC) as row_num,
dense_RANK() OVER(partition by gender ORDER BY salary DESC) rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT * FROM parks_and_recreation.employee_demographics;
SELECT * FROM parks_and_recreation.employee_salary;
SELECT * FROM parks_departments ;

-- ####### ADVANCED
-- CTES: COMMNON TABLE EXPRESSIONS keyword CTE
-- Define subquery block that can be referenced in the main query. (Object to use immediately after only)
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- basically you create the subquery first and then call it in the select
WITH CTE_Example AS
(
SELECT gender, AVG(salary) avsal, MAX(salary) maxsal, MIN(salary) minsal, COUNT(salary) ctsal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

WITH CTE_Example AS -- NAME QUERY
( 
SELECT gender, AVG(salary) avsal, MAX(salary) maxsal, MIN(salary) minsal, COUNT(salary) ctsal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avsal)
FROM CTE_Example -- CALL IT
;

-- OR THE SAME
SELECT AVG(avsal)
FROM
( -- CALL QUERY
SELECT gender, AVG(salary) avsal, MAX(salary) maxsal, MIN(salary) minsal, COUNT(salary) ctsal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery -- NAME IT
;

--
-- CREATE MULTIPLE CTES IN ONE
WITH CTE_Example AS -- NAME QUERY
( 
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
( 
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example -- CALL IT
JOIN CTE_Example2 
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;

 -- CHANGE NAME FROM START 
WITH CTE_Example (GEN, AVSAL, MAXSAL, MINSAL, CTSAL) AS -- NAME QUERY
( 
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example -- CALL IT
;



-- %% TEMPORARY TABLES, ONLY USEFUL FOR CURRENT SESSION
CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
fav_movie varchar(100)
)
;

INSERT INTO temp_table
VALUES('Dan', 'Bon', 'JBond')
;

SELECT * FROM temp_table;

CREATE TEMPORARY TABLE sal_ov_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT * FROM sal_ov_50k;


-- STORED PROCEDURES. Function?
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

-- MORE COMPLEX PROCEDURES HAVE TO RENAME THE DELIMITER ; TO SMTH ELSE TO ALLOW FOR MORE QUERIES
-- OR ELSE IT WILL BE INCORRECT
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;

CALL large_salaries2();

-- CHANGE IT
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;
END $$
-- CHANGE IT BACK OR IT WILL STAY
DELIMITER ;

CALL large_salaries3();
CALL new_procedure();



-- PARAMETERS, VARIABLES PASSED AS INPUT INTO STORED PROCEDURES
DELIMITER $$
CREATE PROCEDURE large_salaries4(employee_id_param INT) -- instead of having two emp id
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = employee_id_param
    ;
END $$
-- CHANGE IT BACK OR IT WILL STAY
DELIMITER ;

CALL large_salaries4(5);



-- TRIGGERS AND EVENTS
-- CREATE TRIGGER, AFTER INSERT ON, FOR EACH ROW, BEGIN INSERT INTO VALUES, END
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
	FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, 
								last_name, occupation, 
                                salary, dept_id)
VALUES(14, 'Rafael', 'Vega', 'Pooper', 2000, NULL);

SELECT *
FROM employee_salary;

-- EVENTS, SIMILAR TO TRIGGER. TRIGGER HAPPENS WHEN EVENTS TAKES PLACE
-- EVENTS TAKE PLACE WHEN SCHEDULED, GREAT FOR IMPORTING DATA, DAILY, WEEKLY AUTOMATION

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE
	FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_raf
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE
	FROM employee_demographics
    WHERE first_name = 'JUAN RAFA';
END $$
DELIMITER ;

SELECT *
FROM employee_demographics;

SHOW VARIABLES LIKE 'event%';
