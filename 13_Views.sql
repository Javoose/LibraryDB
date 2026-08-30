USE LibraryDB;
GO

-- VIEWS

-- 1. Create a view that displays the title, publication year,
-- and stock quantity of all books that are currently in stock.
-- Then, query the view and order the books by stock quantity
-- from highest to lowest.
CREATE VIEW BooksInStock
AS
SELECT 
	Title,
	PublishYear,
	StockQuantity
FROM Books
WHERE StockQuantity > 0;
GO

SELECT *
FROM BooksInStock
ORDER BY StockQuantity DESC;
GO

-- 2. Create a view that displays each book's title, author's full name,
-- category name, publication year, and language.
-- Then, query the view and display the number of books in each category,
-- ordered from the category with the most books to the least.
CREATE VIEW DetailedBookView
AS
SELECT 
	B.Title,
	A.FirstName + ' ' + A.LastName AS [Author Name],
	Cat.CategoryName AS Category,
	B.PublishYear,
	B.Language
FROM Books AS B
INNER JOIN Authors AS A
	ON B.AuthorID = A.AuthorID
INNER JOIN Categories AS Cat
	ON Cat.CategoryID = B.CategoryID;
GO

SELECT 
	Category,
	COUNT(*) AS [Number of Books]
FROM DetailedBookView
GROUP BY Category
ORDER BY [Number of Books] DESC;
GO

-- 3. Create a view that displays all loan details, including the book title,
-- customer's full name, loan date, due date, and return date.
-- Then, query the view and display the total number of loans for each customer,
-- ordered from highest to lowest.
CREATE VIEW LoanDetails
AS
SELECT
	B.Title,
	Cus.FirstName + ' ' + Cus.LastName AS [Customer Name],
	L.LoanDate,
	L.DueDate,
	L.ReturnDate
FROM Loans AS L
INNER JOIN Books AS B
	ON B.BookID = L.BookID
INNER JOIN Customers AS Cus
	ON Cus.CustomerID = L.CustomerID;
GO

SELECT 
	[Customer Name],
	COUNT(*) AS [Loan Count]
FROM LoanDetails
GROUP BY [Customer Name]
ORDER BY [Loan Count] DESC;
GO

-- 4. Create a view that displays only the books that have not yet been returned.
-- Include the book title, customer's full name, loan date, and due date.
-- Then, query the view and list the records ordered by due date
-- from earliest to latest.
CREATE VIEW NotReturnedBooks
AS
SELECT 
	B.Title,
	Cus.FirstName + ' ' + Cus.LastName AS [Customer Name],
	L.LoanDate,
	L.DueDate
FROM Loans AS L
INNER JOIN Books AS B
	ON B.BookID = L.BookID
INNER JOIN Customers AS Cus
	ON Cus.CustomerID = L.CustomerID
WHERE L.ReturnDate IS NULL;
GO

SELECT *
FROM NotReturnedBooks
ORDER BY DueDate ASC;
GO

-- 5. Create a view that displays each category and the total number of books
-- belonging to that category.
-- Then, query the view and display only the categories that contain
-- more than one book, ordered by total book count from highest to lowest.
CREATE VIEW BookCountByCategory
AS
SELECT 
	Cat.CategoryName AS Category,
	COUNT(*) AS [Number of Books]
FROM Categories AS Cat
INNER JOIN Books AS B
	ON B.CategoryID = Cat.CategoryID
GROUP BY Cat.CategoryName;
GO

SELECT *
FROM BookCountByCategory
WHERE [Number of Books] >= 2
ORDER BY [Number of Books] DESC;
GO

