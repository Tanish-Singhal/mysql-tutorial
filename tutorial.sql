-- creating the database
-- CREATE DATABASE IF NOT EXISTS demoDatabase;

-- after creating, we have to use it
-- USE demoDatabase;


-- creating the table
CREATE TABLE demoTable1 (
  id INT PRIMARY KEY,   -- primary key means unique value and not null
  name VARCHAR(50),
  age INT NOT NULL
);


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


-- how to make two column pair a single primary key 
CREATE TABLE demoTable2 (
  id INT,
  name VARCHAR(50),
  city VARCHAR(50) DEFAULT "Faridabad",
  marks INT NOT NULL,
  PRIMARY KEY (id, name)
);


-- inserting things in the table
INSERT INTO demoTable1 VALUES (1, "Tanish", 20);
INSERT INTO demoTable1 VALUES (2, "Pratyush", 17);

INSERT INTO demoTable2 VALUES (1, 'Tanish', 'Gurgaon', 100);
INSERT INTO demoTable2 VALUES (1, 'Pratyush', 'Noida', 76);
INSERT INTO demoTable2 VALUES (2, 'Pratyush', 'Delhi', 50);
INSERT INTO demoTable2 VALUES (3, 'Ram', 'Banglore', 100);


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


-- Having clause
SELECT city, count(name) FROM demoTable2 GROUP BY city HAVING MAX(marks) > 50;


-- deleting the database
-- DROP DATABASE IF EXISTS demoTable1;
