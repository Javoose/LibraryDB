USE LibraryDB;
GO

-- SUBQUERY PRACTICE

-- 1. Find books with more pages than the average page count of all books
SELECT 
	Title, 
	PageCount
FROM Books
WHERE PageCount > 
	(SELECT AVG(PageCount) 
	FROM Books);

-- 2. Find books with a stock quantity higher than the average stock quantity
SELECT 
	Title, 
	StockQuantity
FROM Books
WHERE StockQuantity > 
	(SELECT AVG(StockQuantity) 
	FROM Books);

-- 3. Find the book or books with the highest page count
SELECT 
	Title, 
	PageCount
FROM Books
WHERE PageCount = 
	(SELECT MAX(PageCount)
	FROM Books);

-- 4. Find the book or books with the lowest stock quantity
SELECT 
	Title, 
	StockQuantity
FROM Books
WHERE StockQuantity =
	(SELECT MIN(StockQuantity)
	FROM Books);

-- 5. Find books written by authors from the United Kingdom
SELECT Title
FROM Books
WHERE AuthorID IN
	(SELECT AuthorID 
	FROM Authors
	WHERE Country = 'United Kingdom');

-- 6. Find books that belong to the Classic category
SELECT Title
FROM Books
WHERE CategoryID IN
	(SELECT CategoryID
	FROM Categories 
	WHERE CategoryName = 'Classic');

-- 7. Find customers who have borrowed at least one book
SELECT FirstName + ' ' + LastName AS [Customer Name]
FROM Customers
WHERE CustomerID IN 
	(SELECT CustomerID FROM Loans);

-- 8. Find customers who have never borrowed a book
SELECT FirstName + ' ' + LastName AS [Customer Name]
FROM Customers
WHERE CustomerID NOT IN
	(SELECT CustomerID FROM Loans);

-- NESTED SUBQUERIES

-- 1. Find books written by authors who have written
-- at least one book with more pages than the average
-- page count of all books.
-- Display the title, author ID, and page count.
SELECT 
	Title,
	AuthorID,
	PageCount
FROM Books
WHERE AuthorID IN
(
	SELECT AuthorID 
	FROM Books
	WHERE PageCount >
	(
		SELECT AVG(PageCount)
		FROM Books
	)
);

-- 2. Find customers who have borrowed a book written by
-- an author who has at least one book with more pages than
-- the average page count of all books.
-- Display the customer's first name, last name, and city.
SELECT 
	FirstName,
	LastName,
	City
FROM Customers
WHERE CustomerID IN
(
	SELECT CustomerID
	FROM Loans 
	WHERE BookID IN
	(
		SELECT BookID
		FROM Books
		WHERE AuthorID IN
		(
			SELECT AuthorID 
			FROM Books
			WHERE PageCount > 
			(
				SELECT AVG(PageCount)
				FROM Books
			)
		)
	)
);

-- 3. Find books borrowed by customers who have borrowed
-- a book written by an author whose books have an average
-- page count greater than the average page count of all books.
-- Display the book title, publication year, and page count.
SELECT 
	Title,
	PublishYear,
	PageCount
FROM Books
WHERE BookID IN
(
	SELECT BookID 
	FROM Loans
	WHERE CustomerID IN
	(
		SELECT CustomerID
		FROM Loans
		WHERE BookID IN
		(
			SELECT BookID
			FROM Books
			WHERE AuthorID IN
			(
				SELECT AuthorID
				FROM Books
				GROUP BY AuthorID
				HAVING AVG(PageCount) > 
				(
					SELECT AVG(PageCount)
					FROM Books
				)
			)
		)
	)
);

