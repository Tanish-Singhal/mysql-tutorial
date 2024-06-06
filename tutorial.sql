-- creating the database
-- CREATE DATABASE IF NOT EXISTS demoDatabase;

-- after creating, we have to use it
-- USE demoDatabase;

-- Datatypes
-- CHAR 
-- VARCHAR
-- INT      (SIGNED/UNSIGNED) => store -ve and +ve number/ store only +ve numbers
-- TINYINT  (SIGNED/UNSIGNED) => store -ve and +ve number/ store only +ve numbers
-- BIGINT   (SIGNED/UNSIGNED) => store -ve and +ve number/ store only +ve numbers
-- FLOAT    (SIGNED/UNSIGNED) => store -ve and +ve number/ store only +ve numbers
-- DOUBLE   (SIGNED/UNSIGNED) => store -ve and +ve number/ store only +ve numbers
-- BOOLEAN
-- DATE
-- YEAR
-- TIME


-- Constraints
-- PRIMARY KEY => column which uniqueky identifies each row. (1 PK and NOT NULL)
-- FOREIGN KEY => column which refs to primary key of another table. ((multiple FK and duplicate and have NULL))
-- NOT NULL
-- UNIQUE


-- creating the table
CREATE TABLE demoTable1 (
  id INT PRIMARY KEY,   -- primary key means unique value and not null
  name VARCHAR(50),
  age INT NOT NULL
);

-- how to make two column pair a single primary key 
CREATE TABLE demoTable2 (
  id INT,
  name VARCHAR(50),
  city VARCHAR(50) DEFAULT "Faridabad",
  marks INT NOT NULL,
  PRIMARY KEY (id, name)
);

CREATE TABLE tableA (
  name VARCHAR(50),
  age INT NOT NULL
);

CREATE TABLE tableB (
  name VARCHAR(50),
  age INT NOT NULL
);


-- Foreign Key
CREATE TABLE dept (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE teacher (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES dept(id)
  ON UPDATE CASCADE        -- help to update the changes done in dept or teacher
  ON DELETE CASCADE        -- help t o delete the chnages done in dept or teacher
);


-- Table related queries
-- ADD COLUMN
-- MODIFY       -> to modify the datatypes of the column
-- CHANGE       -> change the name of the column
-- DROP COLUMN
-- REMANCE TO
ALTER TABLE demoTable1 ADD COLUMN phone_number INT DEFAULT 55555;
ALTER TABLE demoTable1 MODIFY COLUMN phone_number VARCHAR(10) DEFAULT 55555;
ALTER TABLE demoTable1 CHANGE phone_number contact_no INT DEFAULT 55555;
-- ALTER TABLE demoTable1 RENAME TO demo;
-- ALTER TABLE demoTable1 DROP COLUMN phone_number;


-- inserting things in the table
INSERT INTO demoTable1 VALUES (1, "Tanish", 20, 99999);
INSERT INTO demoTable1 (id, name, age) VALUES (2, "Pratyush", 17);

INSERT INTO demoTable2 VALUES (1, 'Tanish', 'Gurgaon', 95);
INSERT INTO demoTable2 VALUES (1, 'Pratyush', 'Noida', 76);
INSERT INTO demoTable2 VALUES (2, 'Pratyush', 'Delhi', 30);
INSERT INTO demoTable2 VALUES (3, 'Ram', 'Gurgaon', 100);

INSERT INTO dept VALUES (101, 'English');
INSERT INTO dept VALUES (102, 'IT');

INSERT INTO teacher VALUES (101, 'Baburao', 101);
INSERT INTO teacher VALUES (102, 'Raju', 102);
INSERT INTO teacher VALUES (103, 'Ghanshyam', 102);

INSERT INTO tableA VALUES ("Ram", 20);
INSERT INTO tableA VALUES ("Shyam", 26);
INSERT INTO tableA VALUES ("Rahul", 75);

INSERT INTO tableB VALUES ("Tanish", 20);
INSERT INTO tableB VALUES ("Pratyush", 17);


-- printing
SELECT * FROM demoTable1;
SELECT * FROM demoTable2;

SELECT name, age FROM demoTable1;
SELECT DISTINCT name FROM demoTable2;


-- clauses
SELECT * FROM demoTable2 WHERE marks > 70 AND city = "Gurgaon";
SELECT * FROM demoTable2 WHERE city IN ("Delhi", "Mumbai");
SELECT * FROM demoTable2 WHERE city NOT IN ("Delhi", "Noida");
SELECT * FROM demoTable2 ORDER BY marks DESC LIMIT 2;


-- Aggregate Function
-- COUNT()
-- MAX()
-- MIN()
-- SUM()
-- AVG()
SELECT AVG(marks) from demoTable2;


-- Group By
SELECT city, COUNT(name) FROM demoTable2 GROUP BY city;


-- Having clause (similar to WHERE)
SELECT city, count(name) FROM demoTable2 GROUP BY city HAVING MAX(marks) > 50;


-- General Order
-- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY


-- Updates in table
UPDATE demoTable2 SET marks = 95 WHERE name = "Tanish";


-- Delete things from table
DELETE FROM demoTable2 WHERE marks = 49; 


-- SELECT * FROM demoTable1;
SELECT * FROM demoTable2;


-- Foreign keys task
SELECT * FROM dept;
SELECT * FROM teacher;

UPDATE dept SET name = "Computer Science" WHERE id = 102;

SELECT * FROM dept;
SELECT * FROM teacher;


-- Joining Table
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
SELECT * FROM tableA as A INNER JOIN tableB as B ON A.age = B.age;
-- FULL JOIN
SELECT * FROM tableA as A LEFT JOIN tableB as B ON A.age = B.age
UNION
SELECT * FROM tableA as A RIGHT JOIN tableB as B ON A.age = B.age;


-- Joining two queries
SELECT name, marks FROM demoTable2 WHERE marks > (SELECT AVG(marks) FROM demoTable2);

-- deleting the database
-- DROP DATABASE IF EXISTS demoTable1;
