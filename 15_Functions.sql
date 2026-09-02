USE LibraryDB;
GO

-- FUNCTIONS

-- 1. Create a scalar function named GetFullName
-- that accepts a first name and a last name as parameters
-- and returns the full name separated by a space.
-- After creating the function, use it in a SELECT query
-- to display the full names of all customers.
CREATE FUNCTION GetFullName
(
	@FirstName VARCHAR(50), 
	@LastName VARCHAR(50)
)
RETURNS VARCHAR(101)
AS
BEGIN
	RETURN @FirstName + ' ' + @LastName;
END;
GO

SELECT dbo.GetFullName(FirstName, LastName) AS [Customer Name]
FROM Customers;
GO

-- 2. Create a scalar function named GetLoanDuration
-- that accepts a LoanDate and a DueDate as parameters
-- and returns the number of days between these two dates.
-- After creating the function, use it to display:
-- Customer Name, Loan Date, Due Date, and Allowed Loan Days
-- for every loan.
CREATE FUNCTION GetLoanDuration
(
	@LoanDate DATE,
	@DueDate DATE
)
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(DAY, @LoanDate, @DueDate);
END;
GO

SELECT
	Cus.FirstName + ' ' + Cus.LastName AS [Customer Name],
	L.LoanDate,
	L.DueDate,
	dbo.GetLoanDuration(L.LoanDate, L.DueDate) AS [Allowed Loan Days]
FROM Loans AS L
INNER JOIN Customers AS Cus
	ON Cus.CustomerID = L.CustomerID;
GO

-- 3. Create a table-valued function named GetBooksByCategory
-- that accepts a category name as a parameter
-- and returns all books belonging to that category.
-- The returned table should contain:
-- Title
-- Author Name
-- Publish Year
-- Stock Quantity
-- Test the function using the category 'Fiction'.
CREATE FUNCTION GetBooksByCategory(@CategoryName VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
	SELECT 
		B.Title,
		A.FirstName + ' ' + A.LastName AS [Author Name],
		B.PublishYear,
		B.StockQuantity
	FROM Books AS B
	INNER JOIN Authors AS A 
		ON A.AuthorID = B.AuthorID
	INNER JOIN Categories AS Cat
		ON Cat.CategoryID = B.CategoryID
	WHERE Cat.CategoryName = @CategoryName
);
GO

SELECT * 
FROM dbo.GetBooksByCategory('Fiction');
GO

-- 4. Create a table-valued function named GetCustomerLoanHistory
-- that accepts a CustomerID as a parameter
-- and returns the customer's complete loan history.
-- The returned table should contain:
-- Book Title
-- Author Name
-- Loan Date
-- Due Date
-- Return Date
-- Loan Status
-- Loan Status should display:
-- 'Returned' if ReturnDate is not NULL
-- 'Not Returned' if ReturnDate is NULL.
-- Test the function with a CustomerID of your choice.
CREATE FUNCTION GetCustomerLoanHistory(@CustomerID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT
		B.Title,
		A.FirstName + ' ' + A.LastName AS [Author Name],
		L.LoanDate,
		L.DueDate,
		L.ReturnDate,
		CASE
			WHEN L.ReturnDate IS NULL THEN 'Not Returned'
			ELSE 'Returned'
		END AS [Loan Status]
	FROM Loans AS L 
	INNER JOIN Books AS B
		ON B.BookID = L.BookID
	INNER JOIN Authors AS A
		ON A.AuthorID = B.AuthorID
	WHERE L.CustomerID = @CustomerID
);
GO

SELECT * 
FROM dbo.GetCustomerLoanHistory(3);

