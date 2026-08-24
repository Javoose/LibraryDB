USE LibraryDB;
GO

--Create a temporary table to practice DDL commands
CREATE TABLE TestBooks
(
	TestBookID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	Price DECIMAL(10,2) NOT NULL
);

--Add a new column
ALTER TABLE TestBooks
ADD Publisher VARCHAR(50);

--Modify an existing column
ALTER TABLE TestBooks
ALTER COLUMN Title VARCHAR(100) NOT NULL;

--Drop an existing column
ALTER TABLE TestBooks
DROP COLUMN Publisher;

--Insert sample data for TRUNCATE practice
INSERT INTO TestBooks
	(Title, Price)
VALUES
	('Hyper English', 89.99),
	('Easy Maths', 59.99),
	('More and More', 79.99);

--Remove all rows with TRUNCATE
TRUNCATE TABLE TestBooks;

--Drop the TestBooks table
DROP TABLE TestBooks;


