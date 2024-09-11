use assinmengt;


CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

-- 1) Statement to create the Contact table .

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- 2) Statement to create the Employee table .

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

/* 3) Statement to create the ContactEmployee table */
 
 CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- 4) In the Employee table, the statement that changes 
-- Lesley Bland’s phone number to 215-555-8800 .
/*ans  
UPDATE Employee 
SET Phone = '215-555-8800' 
WHERE FirstName = 'Lesley' AND LastName = 'Bland'; */

/*5) In the Company table, the statement that changes the name of “Urban 
Outfitters, Inc.” to “Urban Outfitters” .
ans-- 
UPDATE Company 
SET CompanyName = 'Urban Outfitters' 
WHERE CompanyName = 'Urban Outfitters, Inc.';
*/

/*6) In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement).
ans--
DELETE FROM ContactEmployee 
WHERE ContactEmployeeID = (SELECT ce.ContactEmployeeID  FROM ContactEmployee ce
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
WHERE c.FirstName = 'Dianne' AND c.LastName = 'Connor'
AND e.FirstName = 'Jack' AND e.LastName = 'Lee');
*/

/*7)Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well.
answer --

SELECT e.FirstName, e.LastName
FROM ContactEmployee ce
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';
 */
 
 -- 8) What is the significance of “%” and “_” operators in the LIKE statement? 
 /*
 anser -
   In like statement 
	The %  matches 0 or more characters in a string. 
    LIKE 'a%' would match any string that starts with 'a'.
and  
 (_) this operator matches only  one character.
 LIKE 'a_' would match any two-character string starting with 'a' like 'ab'*/
 
 -- 9) Explain normalization in the context of databases. 
 /*
 -Normalization is the process of organizing the columns (attributes) and 
 tables (relations) of a database to reduce data redundancy and improve data integrity. 
 -It involves dividing large tables into smaller, less redundant ones and defining relationships between them. 
 -The goal is to ensure that the data is stored efficiently without duplication and inconsistencies.
- levels of normalization is  1NF, 2NF, 3NF, and BCNF, each adding more restrictions to eliminate redundancy.
 */
 
 -- 10) What does a join in MySQL mean? 
 -- ans
 -- the JOIN in MySQL is used to combine rows from two or more tables based on
 -- a related column between them. 
 
 -- 11) DDL, DCL, and DML in MySQL
/*DDL (Data Definition Language)
- Used to define and modify database structure. 
- LIKE CREATE, ALTER, DROP statements.
DCL (Data Control Language)
- Used to control access to the database. 
- GRANT and REVOKE statements.
DML (Data Manipulation Language)
- Used to manage data within tables. 
-INSERT, UPDATE, DELETE, and SELECT.
*/

-- 12) What is the role of the MySQL JOIN clause in a query, and what are some 
-- common types of joins?
 
 /* JOIN clause  combines rows from two or more tables based on a related column. 
 It retrieves related data from multiple tables as if they were a single table.
 types :
INNER JOIN: Returns rows when there is at least one match in both tables.
LEFT JOIN : Returns all rows from the left table and the matched rows from the right table. Unmatched rows in the right table result in NULLs.
RIGHT JOIN: Returns all rows from the right table and the matched rows from the left table.
FULL JOIN : Returns all rows when there is a match in one of the tables, but not commonly supported in MySQL.
 */