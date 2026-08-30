USE LibraryDB;
GO

-- TRIGGERS

-- 1. Create a trigger on the Loans table that automatically decreases
-- the stock quantity of the borrowed book by 1 whenever a new loan is added.
-- Use the inserted table to determine which book was borrowed.
CREATE TRIGGER DecreaseStock
ON Loans
AFTER INSERT
AS
BEGIN
	DECLARE @BookID INT;

	SELECT @BookID = BookID
	FROM inserted;

	UPDATE Books
	SET StockQuantity = StockQuantity - 1
	WHERE BookID = @BookID;
END;
GO

-- 2. Create a trigger on the Loans table that automatically increases
-- the stock quantity of the corresponding book by 1 whenever a loan is deleted.
-- Use the deleted table to determine which book belonged to the deleted loan.
CREATE TRIGGER IncreaseStock
ON Loans
AFTER DELETE
AS
BEGIN
	DECLARE @BookID INT;

	SELECT @BookID = BookID
	FROM deleted;

	UPDATE Books
	SET StockQuantity = StockQuantity + 1
	WHERE BookID = @BookID;
END;
GO

-- 3. Create a trigger on the Books table that displays a message
-- whenever the stock quantity of a book is updated.
-- The trigger should execute only when the StockQuantity column is affected.
CREATE TRIGGER UpdateStock
ON Books
AFTER UPDATE
AS 
BEGIN
	IF UPDATE(StockQuantity)
	BEGIN
		PRINT 'Stock quantity of a book was updated.';
	END;
END;
GO
