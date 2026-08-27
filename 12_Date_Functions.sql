USE LibraryDB;
GO

-- DATE FUNCTIONS

-- 1. Display each customer's full name, registration date,
-- and the year they registered.
SELECT 
	FirstName + ' ' + LastName AS [Customer Name], 
	RegistrationDate,
	DATEPART(YEAR, RegistrationDate) AS [Registration Year]
FROM Customers;

-- 2. Display each loan's loan date and the name of the month
-- in which the loan was created.
SELECT 
	LoanDate,
	DATENAME(MONTH, LoanDate) AS [Loan Month]
FROM Loans;

-- 3. Display each loan's loan date, due date,
-- and the number of days allowed for the loan.
SELECT 
	LoanDate,
	DueDate,
	DATEDIFF(DAY, LoanDate, DueDate) AS [Allowed Loan Days]
FROM Loans;

-- 4. Display all returned loans and calculate
-- how many days each customer kept the book.
SELECT
	BookID,
	CustomerID,
	LoanDate,
	DueDate,
	ReturnDate,
	DATEDIFF(DAY, LoanDate, ReturnDate) AS [Loan Days]
FROM Loans
WHERE ReturnDate IS NOT NULL;

-- 5. Display each loan's due date and calculate
-- a reminder date that is 3 days before the due date.
SELECT 
	BookID,
	CustomerID,
	LoanDate,
	DueDate,
	DATEADD(DAY, -3, DueDate) AS [Reminder Day]
FROM Loans;

-- 6. Display each customer's full name and calculate
-- how many years have passed since their registration date.
SELECT
	FirstName + ' ' + LastName AS [Customer Name],
	RegistrationDate,
	DATEDIFF(YEAR, RegistrationDate, GETDATE()) AS [Years Passed Since Registration]
FROM Customers;