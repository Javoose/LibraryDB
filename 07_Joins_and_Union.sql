USE LibraryDB;
GO

-- INNER JOIN PRACTICE

-- 1. List all books with their authors' first and last names
SELECT B.Title AS Book, A.FirstName + ' ' + A.LastName AS Author
FROM Books AS B
INNER JOIN Authors AS A
	ON B.AuthorID = A.AuthorID;

-- 2. List all books with their category names
SELECT B.Title AS Book, Cat.CategoryName AS Category
FROM Books AS B
INNER JOIN Categories AS Cat
	ON B.CategoryID = Cat.CategoryID;

-- 3. List all loans with book titles and customer names
SELECT B.Title AS Book, Cus.FirstName + ' ' + Cus.LastName AS [Customer Name]
FROM Books AS B
INNER JOIN Loans AS L
	ON B.BookID = L.BookID
INNER JOIN Customers AS Cus
	ON Cus.CustomerID = L.CustomerID;

-- 4. List all books with both their authors and categories
SELECT B.Title AS Book, A.FirstName + ' ' + A.LastName AS Author, Cat.CategoryName AS Category
FROM Books AS B
INNER JOIN Authors AS A
	ON B.AuthorID = A.AuthorID
INNER JOIN Categories AS Cat
	ON B.CategoryID = Cat.CategoryID;

-- LEFT JOIN PRACTICE

-- 1. List all customers and their loan IDs, including customers who have never borrowed a book 
SELECT Cus.FirstName + ' ' + Cus.LastName AS [Customer Name], L.LoanID
FROM Customers AS Cus
LEFT JOIN Loans AS L
	ON Cus.CustomerID = L.CustomerID;

-- 2. List all books and their loan IDs, including books that have never been borrowed
SELECT B.Title AS Book, L.LoanID
FROM Books AS B
LEFT JOIN Loans AS L
	ON B.BookID = L.BookID;

-- RIGHT JOIN PRACTICE

-- 1. List all loans and their customers using RIGHT JOIN
SELECT Cus.FirstName + ' ' + Cus.LastName AS [Customer Name], L.LoanID
FROM Customers AS Cus
RIGHT JOIN Loans AS L
	ON Cus.CustomerID = L.CustomerID;

-- FULL JOIN PRACTICE

-- 1. List all customers and loans using FULL JOIN, including unmatched rows from both tables
SELECT 
	Cus.CustomerID, 
	Cus.FirstName + ' ' + Cus.LastName AS [Customer Name], 
	L.LoanID, 
	L.BookID, 
	L.LoanDate
FROM Customers AS Cus
FULL JOIN Loans AS L
	ON Cus.CustomerID = L.CustomerID;

-- UNION PRACTICE

-- 1. Combine author first names and customer first names into a single list
SELECT FirstName 
FROM Authors
UNION
SELECT FirstName
FROM Customers;

-- 2. Combine author countries and customer cities into a single list
SELECT Country
FROM Authors
UNION
SELECT City
FROM Customers;


