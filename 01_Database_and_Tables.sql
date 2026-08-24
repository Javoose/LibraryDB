--Create the database
USE master;
GO

CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

--Authors table
CREATE TABLE Authors
(
	AuthorID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	BirthDate DATE,
	Country VARCHAR(50)
);

--Categories table
CREATE TABLE Categories
(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL
);

--Books table
CREATE TABLE Books
(
	BookID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(150) NOT NULL,
	AuthorID INT NOT NULL,
	CategoryID INT NOT NULL,
	PublishYear INT,
	PageCount INT,
	StockQuantity INT,
	Language VARCHAR(50),

	CONSTRAINT FK_Books_Authors 
	FOREIGN KEY (AuthorID)
	REFERENCES Authors(AuthorID),

	CONSTRAINT FK_Books_Categories
	FOREIGN KEY (CategoryID)
	REFERENCES Categories(CategoryID)
);

--Customers table
CREATE TABLE Customers
(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	RegistrationDate DATE NOT NULL
);

--Loans table
CREATE TABLE Loans
(
	LoanID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL,
	CustomerID INT NOT NULL,
	LoanDate DATE NOT NULL,
	DueDate DATE NOT NULL,
	ReturnDate DATE,

	CONSTRAINT FK_Loans_Books
	FOREIGN KEY (BookID)
	REFERENCES Books(BookID),

	CONSTRAINT FK_Loans_Customers
	FOREIGN KEY (CustomerID)
	REFERENCES Customers(CustomerID)
);

