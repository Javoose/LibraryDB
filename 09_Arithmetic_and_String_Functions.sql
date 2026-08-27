USE LibraryDB;
GO

-- ARITHMETIC OPERATIONS PRACTICE

-- 1. Calculate the total number of pages available in stock for each book
SELECT 
  Title, 
  (PageCount * StockQuantity) AS [Total Pages in Stock]
FROM Books;

-- 2. Calculate the stock value of each book if every copy is valued at 50
SELECT 
  Title, 
  (50 * StockQuantity) AS [Stock Value]
FROM Books;

-- 3. Calculate half of the page count of each book
SELECT 
  Title, 
  (PageCount / 2.0) AS [Half Page Count]
FROM Books;

-- MATHEMATICAL FUNCTIONS PRACTICE

-- 1. Round the average page count of all books to the nearest whole number
SELECT ROUND(AVG(PageCount),0) AS [Average Page Count]
FROM Books;

-- 2. Calculate the square root of the page count of each book
SELECT 
  Title, 
  ROUND(SQRT(PageCount),0) AS [Square Root of Page Count]
FROM Books;

-- 3. Calculate the square of each book's stock quantity
SELECT 
  Title, 
  POWER(StockQuantity,2) AS [Stock Quantity Squared]
FROM Books;

-- UPPER AND LOWER PRACTICE

-- 1. Display all book titles in uppercase
SELECT UPPER(Title) AS [Uppercase Title]
FROM Books;

-- 2. Display authors' first and last names in lowercase
SELECT LOWER(FirstName + ' ' + LastName) AS [Lowercase Author Name]
FROM Authors;

-- SUBSTRING, LEFT AND RIGHT PRACTICE

-- 1. Display the first five characters of each book title using SUBSTRING
SELECT SUBSTRING(Title,1,5) AS [First Five Characters]
FROM Books;

-- 2. Display the first three characters of each author's last name using LEFT
SELECT LEFT(LastName,3) AS [First Three Characters]
FROM Authors;

-- 3. Display the last three characters of each customer's city using RIGHT
SELECT RIGHT(City,3) AS [Last Three Characters]
FROM Customers;

-- LEN, TRIM AND REPLACE PRACTICE

-- 1. Display each book title and the number of characters in its title
SELECT 
  Title, 
  LEN(Title) AS [Number of Characters]
FROM Books;

-- 2. Remove leading and trailing spaces from a sample text using LTRIM and RTRIM
SELECT LTRIM(RTRIM('       Merhaba        ')) AS [Trimmed Text];

-- 3. Replace the word 'United' with 'UK' in author countries
SELECT 
  Country, 
  REPLACE(Country,'United','UK') AS [Modified Country]
FROM Authors;

-- CHARINDEX AND REVERSE PRACTICE

-- 1. Find the position of the letter 'a' in each book title
SELECT 
  Title, 
  CHARINDEX('a',Title) AS [Position of 'a']
FROM Books;

-- 2. Display each book title in reverse order
SELECT 
  Title, 
  REVERSE(Title) AS [Reversed Title]
FROM Books;

