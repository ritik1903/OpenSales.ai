create database onlinesales;
show databases;
use onlinesales;
 SHOW VARIABLES LIKE 'secure_file_priv';   -- first you have to see the file location
										-- which is allowed to do import operations paste your CSV file there
 
CREATE TABLE department_table (     -- create department table as shown 
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);


 LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\departments.csv'      -- location got from secure_file_priv variable 
INTO TABLE department_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 lines;

CREATE TABLE employee_table (   -- creating  employee table 
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    `DEPT ID` int not null
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\employees.csv' -- location got from secure_file_priv variable 
INTO TABLE employee_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 lines;

CREATE TABLE salaries_table (    -- create salary table 
   EMP_ID INT not null,
    `MONTH (YYYYMM)` int NOT NULL,
    `AMT (USD)` int not null
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\salaries.csv'         -- location got from the secure-file-priv variable
INTO TABLE salaries_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 lines;

-------------------------------SQL Query Solution--------------------------------------------------------
---------------------------------------------------------------------------------------------------------

SELECT dt.name as DEPT_NAME,   
 AVG(s.amt (USD)) AS AVG_MONTHLY_SALARY (USD)    
FROM department_table dt
INNER JOIN employee_table et ON dt.ID = et.dept id
INNER JOIN salaries_table s ON et.id = s.emp_id
GROUP BY dt.name
LIMIT 3;     -- this query will fetch top there departments with average monthly salary preserving the order in department table


-----------Assumptions-----------------
---------------------------------------
-- 1->  The "department_table" table has a column named "dept_id" that serves as the primary key.
-- 2->  The "employee_table" table has a foreign key column named "dept_id" that references the "dept_id" column in the "department_table" table.
-- 3->  The "employee_table" table has a column named "amt (USD)" which represents the monthly salary of each employee.


----------Test Cases-------------------
---------------------------------------
-- 1-> The SQL query assumes the existence of the required tables and columns in the database. Make sure to create and populate the tables with appropriate data to obtain meaningful results.
-- 2-> Verify the results by checking the top 3 departments along with their average monthly salary.

----------Instructions-------------------
-----------------------------------------
-- 1-> Create the necessary tables in a relational database system (e.g., MySQL, PostgreSQL).
-- 2-> Import the data from the provided worksheets into the corresponding tables.
-- 3-> Execute the SQL query in the database to fetch the top 3 departments with their average monthly salary.
