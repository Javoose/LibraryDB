USE LibraryDB;
GO

-- AGGREGATE FUNCTION PRACTICE

-- 1. Count the total number of books
SELECT COUNT(*) 
FROM Books;

-- 2. Count the total number of authors
SELECT COUNT(*)
FROM Authors;

-- 3. Count how many loans have been returned
SELECT COUNT(ReturnDate)
FROM Loans;

-- 4. Calculate the total stock quantity of all books
SELECT SUM(StockQuantity)
FROM Books;

-- 5. Find the lowest stock quantity among all books
SELECT MIN(StockQuantity)
FROM Books;

-- 6. Find the highest stock quantity among all books
SELECT MAX(StockQuantity)
FROM Books;

-- 7. Find the minimum page count
SELECT MIN(PageCount) 
FROM Books;

-- 8. Find the maximum page count
SELECT MAX(PageCount)
FROM Books;

-- 9. Calculate the average page count of all books
SELECT AVG(PageCount)
FROM Books;

-- 10. Calculate the average stock quantity of all books
SELECT AVG(StockQuantity)
FROM Books;