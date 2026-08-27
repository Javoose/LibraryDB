USE LibraryDB;
GO

-- STORED PROCEDURES

-- 1. Create a procedure that lists all books currently in stock,
-- displaying the title, publication year, and stock quantity. 
-- Order the results by stock quantity from highest to lowest.
CREATE PROCEDURE GetBooksInStock
AS
BEGIN
	SELECT 
		Title, 
		PublishYear, 
		StockQuantity
	FROM Books
	WHERE StockQuantity > 0
	ORDER BY StockQuantity DESC;
END;
GO

EXEC GetBooksInStock;
GO

-- 2. Create a procedure that accepts a minimum page count as a parameter
-- and returns all books with at least that many pages.
-- Display the title, page count, and publication year.
-- Order the results by page count from highest to lowest.
CREATE PROCEDURE GetBooksByMinPages
	@MinPageCount INT
AS
BEGIN
	SELECT 
		Title, 
		PageCount, 
		PublishYear
	FROM Books
	WHERE PageCount >= @MinPageCount
	ORDER BY PageCount DESC;
END;
GO

EXEC GetBooksByMinPages 300;
GO

-- 3. Create a procedure that accepts a minimum and maximum page count
-- and returns all books whose page count falls within that range.
-- Display the title, page count, and publication year.
-- Order the results by page count from lowest to highest.
CREATE PROCEDURE GetBooksInRange
	@MinRange INT,
	@MaxRange INT
AS
BEGIN
	SELECT 
		Title, 
		PageCount, 
		PublishYear
	FROM Books
	WHERE PageCount BETWEEN @MinRange AND @MaxRange
	ORDER BY PageCount ASC;
END;
GO

EXEC GetBooksInRange 300, 700;
GO

-- 4. Create a procedure that accepts a city name as a parameter
-- and returns all customers from that city.
-- Display the customer's first name, last name, city, and registration date.
CREATE PROCEDURE GetCustomersFromCity
	@CityInput VARCHAR(50)
AS
BEGIN
	SELECT 
		FirstName, 
		LastName, 
		City, 
		RegistrationDate
	FROM Customers
	WHERE City = @CityInput;
END;
GO

EXEC GetCustomersFromCity 'London';
GO

-- 5. Create a procedure that accepts a minimum loan count as a parameter
-- and returns customers who have borrowed at least that many books.
-- Display the customer's first name, last name, and total loan count.
-- Order the results by loan count from highest to lowest.
CREATE PROCEDURE GetCustomersByMinLoanCount
	@MinLoanCount INT
AS
BEGIN
	SELECT 
		Cus.FirstName, 
		Cus.LastName, 
		COUNT(L.CustomerID) AS [Loan Count]
	FROM Customers AS Cus
	INNER JOIN Loans AS L
		ON Cus.CustomerID = L.CustomerID
	GROUP BY Cus.CustomerID, Cus.FirstName, Cus.LastName
	HAVING COUNT(L.CustomerID) >= @MinLoanCount
	ORDER BY [Loan Count] DESC;
END;
GO

EXEC GetCustomersByMinLoanCount 2;
GO

-- 6. Create a procedure that adds a new customer to the Customers table.
-- The procedure should accept the customer's first name, last name, city, and registration date as parameters.
CREATE PROCEDURE AddCustomer
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@City VARCHAR(50),
	@RegistrationDate DATE
AS
BEGIN
	INSERT INTO Customers 
		(FirstName, LastName, City, RegistrationDate)
	VALUES
		(@FirstName, @LastName, @City, @RegistrationDate);
END;
GO

-- Example execution (modifies data):
-- EXEC AddCustomer 'John', 'Smith', 'London', '2026-08-26';
GO

-- 7. Create a procedure that updates the stock quantity of a specific book.
-- The procedure should accept the book ID and the new stock quantity as parameters.
CREATE PROCEDURE UpdateStockQuantity
	@BookID INT,
	@NewStockQuantity INT
AS
BEGIN
	UPDATE Books
	SET StockQuantity = @NewStockQuantity
	WHERE BookID = @BookID;
END;
GO

-- Example execution (modifies data):
-- EXEC UpdateStockQuantity 5, 10;
