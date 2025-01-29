#*  retrieves everything in the table 
SELECT *
 FROM parks_and_recreation.employee_demographics
 #adds a limit of 5 rows to be returned. restrict the number of rows returned by a query
 LIMIT 5 ;
 
 
 SELECT first_name,
 last_name, 
 age, 
 birth_date,
 #BODMAS/PEMDAS operations
 #starts with brackets then multiplaction, thensubtraction
 (age +10)*10-10
 FROM parks_and_recreation.employee_demographics;
 
 #DISTICT REMOVES DUPLICATES and returns two distinct results
 SELECT distinct gender
 FROM parks_and_recreation.employee_demographics;
 
 SELECT DISTINCT dept_id
 FROM parks_and_recreation.employee_salary ;
 
 #WHERE CLAUSE- used after FROM
 # used in filtering and retrieving specific rows from a database table based on a specified condition or set of conditions.
 SELECT first_name, occupation
 FROM parks_and_recreation.employee_salary
 #codntion is every salary greater or equal to 50000
 WHERE salary >=50000;
 
 SELECT *
 FROM parks_and_recreation.employee_demographics
 WHERE birth_date >='1979-09-25';
 
 #LOGICAL OPERTAORS
 #AND , OR
 #AND- combines multiple conditions in a WHERE clause to filter data from a database table
 SELECT * 
 FROM employee_demographics
 WHERE age >=25
 AND  gender = 'Female';
 #OR-explores the  next condition
 
 SELECT * 
 FROM employee_demographics
 WHERE age >=25
 AND  gender = 'Female'
 #OR- It allows you to retrieve rows that satisfy at least one of the specified conditions. 
 OR gender ='male'
 OR NOT gender ='male';
 
 SELECT 
    *
FROM
    employee_demographics
WHERE
    (first_name = 'TOM' AND age >= 40)
        OR birth_date = '1987-03-04';
 
 #Wildcards: includes  %,  _,  []
 #LIKE % , used in a WHILE clause
 SELECT *
 FROM employee_demographics
 # %-it is  a general quary for anything related to the filter
 # _ this is specific , should return the exact query
 WHERE (first_name LIKE '%e%'AND first_name LIKE 'B__' );
 
 SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '[a-p]%';
 
 #GROUPBY , ORDER BY 
 #GROUPBY:  used to group rows from a table based on the values of one or more columns.
 SELECT 
    *
FROM
    parks_and_recreation.employee_demographics
GROUP BY first_name DESC;
 
 SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
 #max() outputs the maxmum digit from the row, min()-minimum , COUNT()- counts numbers of columns in the row(age)
FROM  parks_and_recreation.employee_demographics
GROUP BY gender; 

#ORDER BY: commonly used to arrange data in ascending or descending(DESC) or ascending(ASC)
SELECT 
    *
FROM
    parks_and_recreation.employee_demographics
ORDER BY gender , age;

SELECT 
    *
FROM
    parks_and_recreation.employee_demographics
ORDER BY gender , age DESC; #age is in descending order
#NB , we dont have to use a column name , we can also use a column position
SELECT 
    *
FROM
    parks_and_recreation.employee_demographics
ORDER BY 5 , 3; # gender is on column 5, age is on column 3 NB: not recommended when some columns have been deleted


#HAVING vs WHERE
#HAVING : used when you want to filter  data based on aggregate data 
-- SELECT column1, column2, aggregate_function(column3)
-- FROM table_name
-- GROUP BY column1, column2
-- HAVING condition;

SELECT gender , AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT 
    occupation, AVG(salary)
FROM
    parks_and_recreation.employee_salary
WHERE
    occupation LIKE '%managers%'
HAVING AVG(salary) > 70000;

-- LIMIT AND ALIASING--  
#limit-specifies the number of rows you want to be returned
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 2,1; #skip the first 2 rows then return the 1 row after (third)

#RECOMMENDED: USE  OFFSET and FETCH
-- SELECT  *
-- FROM parks_and_recreation.employee_demographics
-- ORDER BY age DESC
-- OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY;

#ALIAS
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age> 40;

#JOINS:COMBINES TWO OR MORE TABLES  BASED ON THE COMMON NTABLE BTWN THEM
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;
#common columns are employee_id, first_name,last_name
SELECT 
    empdem.employee_id, 
    empdem.first_name, 
    empdem.last_name, 
    sal.salary
FROM 
    employee_demographics empdem
JOIN 
# aka inner join ,Returns records that have matching values in both tables.
    employee_salary sal 
ON 
    empdem.employee_id = sal.employee_id
   AND empdem.first_name = sal.first_name 
   AND empdem.last_name = sal.last_name;
    ;
    
SELECT * 
FROM employee_demographics empdem
#THIS IS AUTOMATICALLY INNER JOIN
JOIN employee_salary sal 
ON empdem.employee_id = sal.employee_id;

SELECT * 
FROM employee_demographics empdem
LEFT JOIN employee_salary sal 
ON empdem.employee_id = sal.employee_id;

SELECT * 
FROM employee_demographics empdem
-- right join takes everything on right table and matches it with left table
-- RIGHT JOIN includes all rows from the right table (in this case, employee_salary), 
-- and the matching rows from the left table (employee_demographics)
RIGHT JOIN employee_salary sal 
ON empdem.employee_id = sal.employee_id;

# OUTER JOIN (General Term) not supported on mysql
-- Refers to LEFT OUTER JOIN, RIGHT OUTER JOIN, and FULL OUTER JOIN. 
-- It ensures that unmatched rows from one or both tables are included in the result set.
-- SELECT *
-- FROM employee_demographics empdem
-- FULL OUTER JOIN employee_salary sal
-- ON empdem.employee_id = sal.employee_id;


-- SELF JOIN 
SELECT *
FROM employee_demographics empdem
LEFT JOIN employee_salary sal
ON empdem.employee_id = sal.employee_id
UNION
SELECT *
FROM employee_demographics empdem
RIGHT JOIN employee_salary sal
ON empdem.employee_id = sal.employee_id;











