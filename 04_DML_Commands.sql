USE LibraryDB;
GO

-- SELECT PRACTICE

-- 1. Retrieve all data from the Books table
SELECT *
FROM Books;

-- 2. Retrieve titles, publication years, and page counts of all books
SELECT 
	Title, 
	PublishYear, 
	PageCount 
FROM Books;

-- 3. Retrieve first names, last names, and countries of all authors
SELECT 
	FirstName, 
	LastName, 
	Country 
FROM Authors;

-- 4. Retrieve names, cities, and registration dates of all customers
SELECT 
	FirstName, 
	LastName, 
	City, 
	RegistrationDate
FROM Customers;

-- 5. Retrieve book IDs, customer IDs, and date information for all loans
SELECT 
	BookID, 
	CustomerID, 
	LoanDate, 
	DueDate, 
	ReturnDate
FROM Loans;

-- INSERT PRACTICE

-- 1. Insert a new author
INSERT INTO Authors
	(FirstName, LastName, BirthDate, Country)
VALUES
	('Tevfik', 'Fikret', '1867-12-24', 'Turkiye');

-- 2. Insert a new category
INSERT INTO Categories
	(CategoryName)
VALUES
	('Horror');

-- 3. Insert a new customer
INSERT INTO Customers
	(FirstName, LastName, City, RegistrationDate)
VALUES
	('Furkan', 'Yavuz', 'Istanbul', '2026-08-24');

-- UPDATE PRACTICE

-- 1. Update the country of the newly inserted author
UPDATE Authors 
SET Country = 'Japan'
WHERE AuthorID = 11;

-- 2. Update the name of the newly inserted category
UPDATE Categories
SET CategoryName = 'Adventure'
WHERE CategoryID = 9;

-- 3. Update the city of the newly inserted customer
UPDATE Customers
SET City = 'Sivas'
WHERE CustomerID = 16;

-- DELETE PRACTICE

-- 1. Delete the newly inserted author
DELETE FROM Authors
WHERE AuthorID = 11;

-- 2. Delete the newly inserted category
DELETE FROM Categories
WHERE CategoryID = 9;

-- 3. Delete the newly inserted customer
DELETE FROM Customers
WHERE CustomerID = 16;
