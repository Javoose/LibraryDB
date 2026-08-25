USE LibraryDB;
GO

-- GENERAL SQL REVIEW

-- 1. List all books published after 1940, ordered from the newest to the oldest
SELECT Title, PublishYear
FROM Books
WHERE PublishYear > 1940
ORDER BY PublishYear DESC;

-- 2. Find the three longest books and display their titles, authors, and page counts
SELECT TOP 3 
	B.Title, 
	A.FirstName + ' ' + A.LastName AS [Author Name], 
	B.PageCount
FROM Books AS B
INNER JOIN Authors AS A
ON B.AuthorID = A.AuthorID
ORDER BY PageCount DESC;

-- 3. List all books in the Classic category with their authors' full names
SELECT 
	B.Title, 
	Cat.CategoryName AS Category,
	A.FirstName + ' ' + A.LastName AS [Author Name]
FROM Books AS B
INNER JOIN Categories AS Cat
ON B.CategoryID = Cat.CategoryID
INNER JOIN Authors AS A
ON B.AuthorID = A.AuthorID
WHERE Cat.CategoryName = 'Classic';

-- 4. Find all customers who currently have at least one book that has not been returned
SELECT Cus.FirstName + ' ' + Cus.LastName AS [Customer Name]
FROM Customers AS Cus
WHERE Cus.CustomerID IN 
	(SELECT L.CustomerID 
	FROM Loans AS L
	WHERE ReturnDate IS NULL);

-- 5. Find books whose page count is greater than the average page count of all books
SELECT Title AS Book, PageCount
FROM Books
WHERE PageCount >
	(SELECT AVG(PageCount) FROM Books);

-- 6. Show each language and the number of books written in that language, but only include languages with at least three books
SELECT Language, COUNT(*) AS [Number of Books]
FROM Books
GROUP BY Language
HAVING COUNT(*) >= 3;

-- 7. Show each author and the number of books they have in the library
SELECT 
	A.FirstName + ' ' + A.LastName AS [Author Name], 
	COUNT(B.AuthorID) AS [Number of Books]
FROM Authors AS A
INNER JOIN Books AS B
ON A.AuthorID = B.AuthorID
GROUP BY A.FirstName + ' ' + A.LastName, A.AuthorID;

-- 8. Find authors whose books have an average page count greater than 300
SELECT 
	A.FirstName + ' ' + A.LastName AS [Author Name], 
	AVG(B.PageCount) AS [Average Page Count]
FROM Authors AS A
INNER JOIN Books AS B
ON A.AuthorID = B.AuthorID
GROUP BY A.FirstName + ' ' + A.LastName, A.AuthorID
HAVING AVG(B.PageCount) > 300;

-- 9. Show each customer and the total number of books they have borrowed, including customers who have never borrowed a book
SELECT 
	Cus.FirstName + ' ' + Cus.LastName AS [Customer Name],
	COUNT(L.CustomerID) AS [Number of Loans]
FROM Customers AS Cus
LEFT JOIN Loans AS L
ON Cus.CustomerID = L.CustomerID
GROUP BY Cus.FirstName + ' ' + Cus.LastName, Cus.CustomerID;

-- 10. Find the three most frequently borrowed books
SELECT TOP 3 B.Title AS Book, COUNT(L.BookID) AS [Number of Loans]
FROM Books AS B
INNER JOIN Loans AS L
ON B.BookID = L.BookID
GROUP BY B.Title, B.BookID
ORDER BY COUNT(L.BookID) DESC;

-- 11. Find books that have never been borrowed
SELECT B.Title AS [Never Been Borrowed]
FROM Books AS B
LEFT JOIN Loans AS L
ON B.BookID = L.BookID
WHERE L.BookID IS NULL;

-- 12. Find customers who have returned at least one book late
SELECT FirstName + ' ' + LastName AS [Customer Name]
FROM Customers
WHERE CustomerID IN 
	(SELECT CustomerID
	FROM Loans
	WHERE ReturnDate > DueDate);

-- 13. Show each category and the average page count of its books, ordered from the highest average to the lowest
SELECT Cat.CategoryName AS Category, AVG(B.PageCount) AS [Average Page Count]
FROM Categories AS Cat
INNER JOIN Books AS B
ON Cat.CategoryID = B.CategoryID
GROUP BY Cat.CategoryName
ORDER BY [Average Page Count] DESC;

-- 14. Find the author whose books have the highest total stock quantity, if there is a tie, order by first name
SELECT TOP 1
	A.FirstName + ' ' + A.LastName AS [Author Name], 
	SUM(B.StockQuantity) AS [Total Stock Quantity of Their Books]
FROM Authors AS A
INNER JOIN Books AS B
ON A.AuthorID = B.AuthorID
GROUP BY A.AuthorID, A.FirstName + ' ' + A.LastName, A.FirstName
ORDER BY [Total Stock Quantity of Their Books] DESC, A.FirstName ASC;

-- 15. Find customers who have borrowed books from more than one different category
SELECT Cus.FirstName + ' ' + Cus.LastName AS [Customers Who Like Different Categories]
FROM Customers AS Cus
INNER JOIN Loans AS L
ON Cus.CustomerID = L.CustomerID
INNER JOIN Books AS B
ON B.BookID = L.BookID
INNER JOIN Categories AS Cat
ON Cat.CategoryID = B.CategoryID
GROUP BY Cus.CustomerID, Cus.FirstName + ' ' + Cus.LastName
HAVING COUNT(DISTINCT Cat.CategoryID) > 1;