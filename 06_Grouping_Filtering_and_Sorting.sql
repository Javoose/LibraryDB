USE LibraryDB;
GO

-- GROUP BY AND HAVING PRACTICE

-- 1. Count the number of books for each language
SELECT Language, COUNT(*) AS [Number of Books]
FROM Books
GROUP BY Language;

-- 2. Calculate the average page count for each language
SELECT Language, AVG(PageCount) AS [Average Page Count]
FROM Books
GROUP BY Language;

-- 3. Count the number of authors from each country
SELECT Country, COUNT(*) AS Authors
FROM Authors
GROUP BY Country;

-- 4. Show languages used by more than three books
SELECT Language
FROM Books
GROUP BY Language
HAVING COUNT(*) > 3;

-- 5. Show languages whose average book length is greater than 300 pages
SELECT Language
FROM Books
GROUP BY Language
HAVING AVG(PageCount) > 300;

-- 6. Show countries with more than one author
SELECT Country
FROM Authors
GROUP BY Country
HAVING COUNT(*) > 1;

-- LIKE AND NOT LIKE PRACTICE

-- 1. Find books whose titles start with 'The'
SELECT Title
FROM Books
WHERE Title LIKE 'The%';

-- 2. Find books whose titles don't contain the word 'and'
SELECT Title
FROM Books
WHERE Title NOT LIKE '%and%';

-- DISTINCT PRACTICE

-- 1. List all unique languages in the Books table
SELECT DISTINCT Language
FROM Books;

-- 2. List all unique cities in the Customers table
SELECT DISTINCT City
FROM Customers;

-- ORDER BY PRACTICE

-- 1. List books from the longest to the shortest
SELECT Title, PageCount
FROM Books
ORDER BY PageCount DESC;

-- 2. List customers from the newest to the oldest registration date
SELECT FirstName + ' ' + LastName AS Name, RegistrationDate
FROM Customers
ORDER BY RegistrationDate DESC;

-- TOP AND PERCENT PRACTICE

-- 1. Retrieve the five longest books
SELECT TOP 5 Title, PageCount
FROM Books
ORDER BY PageCount DESC;

-- 2. Retrieve the top 25 percent of books with the highest stock quantity
SELECT TOP 25 PERCENT Title, StockQuantity
FROM Books
ORDER BY StockQuantity DESC;

-- IN AND NOT IN PRACTICE

-- 1. Find books written in English, French or German
SELECT Title
FROM Books
WHERE Language IN ('English', 'French', 'German');

-- 2. Find books that are not written in English or German
SELECT Title
FROM Books
WHERE Language NOT IN ('English', 'German');

-- BETWEEN PRACTICE

-- 1. Find books published between 1900 and 1950
SELECT Title
FROM Books
WHERE PublishYear BETWEEN 1900 AND 1950;

-- 2. Find books with page counts between 200 and 400
SELECT Title
FROM Books
WHERE PageCount BETWEEN 200 AND 400;
