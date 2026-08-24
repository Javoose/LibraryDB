USE LibraryDB;
GO

--Insert authors
INSERT INTO Authors 
	(FirstName, LastName, BirthDate, Country)
VALUES 
	('George', 'Orwell', '1903-06-25', 'United Kingdom'),
	('Fyodor', 'Dostoevsky', '1821-11-11', 'Russia'),
	('Jane', 'Austen', '1775-12-16', 'United Kingdom'),
	('Franz', 'Kafka', '1883-07-03', 'Czech Republic'),
	('Albert', 'Camus', '1913-11-07', 'France'),
	('J.R.R.', 'Tolkien', '1892-01-03', 'United Kingdom'),
	('Harper', 'Lee', '1926-04-28', 'United States'),
	('Aldous', 'Huxley', '1894-07-26', 'United Kingdom'),
	('Ernest', 'Hemingway', '1899-07-21', 'United States'),
	('Mary', 'Shelley', '1797-08-30', 'United Kingdom');

--Insert categories
INSERT INTO Categories
	(CategoryName)
VALUES
	('Fiction'),
	('Dystopian'),
	('Classic'),
	('Fantasy'),
	('Philosophy'),
	('Science Fiction'),
	('Mystery'),
	('Historical Fiction');

--Insert books
INSERT INTO Books
	(Title, AuthorID, CategoryID, PublishYear, PageCount, StockQuantity, Language)
VALUES
	('1984', 1, 2, 1949, 328, 5, 'English'),
	('Animal Farm', 1, 1, 1945, 112, 4, 'English'),
	('Crime and Punishment', 2, 3, 1866, 671, 3, 'Russian'),
	('The Brothers Karamazov', 2, 3, 1880, 824, 2, 'Russian'),
	('Pride and Prejudice', 3, 3, 1813, 432, 6, 'English'),
	('Emma', 3, 3, 1815, 474, 3, 'English'),
	('The Metamorphosis', 4, 1, 1915, 201, 4, 'German'),
	('The Trial', 4, 1, 1925, 255, 3, 'German'),
	('The Stranger', 5, 5, 1942, 123, 5, 'French'),
	('The Plague', 5, 1, 1947, 308, 2, 'French'),
	('The Hobbit', 6, 4, 1937, 310, 7, 'English'),
	('The Lord of the Rings', 6, 4, 1954, 1178, 5, 'English'),
	('To Kill a Mockingbird', 7, 3, 1960, 281, 6, 'English'),
	('Brave New World', 8, 2, 1932, 311, 4, 'English'),
	('The Old Man and the Sea', 9, 3, 1952, 127, 5, 'English'),
	('A Farewell to Arms', 9, 8, 1929, 355, 2, 'English'),
	('Frankenstein', 10, 6, 1818, 280, 5, 'English'),
	('Sense and Sensibility', 3, 3, 1811, 409, 3, 'English'),
	('Notes from Underground', 2, 5, 1864, 136, 2, 'Russian'),
	('The Castle', 4, 1, 1926, 352, 3, 'German');

--Insert customers
INSERT INTO Customers
	(FirstName, LastName, City, RegistrationDate)
VALUES
	('Daniel', 'Carter', 'London', '2024-01-15'),
	('Emma', 'Brooks', 'Manchester', '2024-02-03'),
	('Liam', 'Turner', 'Birmingham', '2024-02-18'),
	('Olivia', 'Parker', 'Liverpool', '2024-03-07'),
	('Noah', 'Bennett', 'Bristol', '2024-03-21'),
	('Ava', 'Collins', 'Leeds', '2024-04-02'),
	('Ethan', 'Foster', 'Sheffield', '2024-04-17'),
	('Mia', 'Cooper', 'Nottingham', '2024-05-01'),
	('Lucas', 'Reed', 'Glasgow', '2024-05-16'),
	('Sophia', 'Ward', 'Edinburgh', '2024-06-03'),
	('Jacob', 'Morris', 'Cardiff', '2024-06-19'),
	('Isabella', 'Hughes', 'Oxford', '2024-07-01'),
	('Henry', 'Bell', 'Cambridge', '2024-07-14'),
	('Amelia', 'Price', 'York', '2024-08-02'),
	('Leo', 'Richardson', 'Bath', '2024-08-18');

--Insert loan records
INSERT INTO Loans
	(BookID, CustomerID, LoanDate, DueDate, ReturnDate)
VALUES
	(1, 1, '2024-09-02', '2024-09-16', '2024-09-14'),
	(5, 2, '2024-09-05', '2024-09-19', '2024-09-19'),
	(11, 3, '2024-09-08', '2024-09-22', '2024-09-25'),
	(3, 4, '2024-09-12', '2024-09-26', '2024-09-24'),
	(14, 5, '2024-09-18', '2024-10-02', '2024-10-07'),
	(7, 1, '2024-10-03', '2024-10-17', '2024-10-15'),
	(17, 6, '2024-10-08', '2024-10-22', '2024-10-20'),
	(2, 7, '2024-10-14', '2024-10-28', '2024-10-28'),
	(12, 8, '2024-10-20', '2024-11-03', '2024-11-08'),
	(9, 9, '2024-11-01', '2024-11-15', '2024-11-12'),
	(15, 10, '2024-11-06', '2024-11-20', '2024-11-19'),
	(4, 11, '2024-11-12', '2024-11-26', '2024-12-01'),
	(18, 12, '2024-11-20', '2024-12-04', '2024-12-03'),
	(6, 13, '2024-12-02', '2024-12-16', '2024-12-14'),
	(10, 2, '2024-12-10', '2024-12-24', '2024-12-29'),
	(20, 3, '2025-01-05', '2025-01-19', '2025-01-17'),
	(8, 4, '2025-01-12', '2025-01-26', '2025-01-30'),
	(13, 5, '2025-01-20', '2025-02-03', '2025-02-01'),
	(16, 6, '2025-02-03', '2025-02-17', '2025-02-22'),
	(19, 7, '2025-02-10', '2025-02-24', '2025-02-21'),
	(1, 8, '2025-03-01', '2025-03-15', NULL),
	(11, 9, '2025-03-05', '2025-03-19', NULL),
	(3, 10, '2025-03-10', '2025-03-24', NULL),
	(5, 11, '2025-03-14', '2025-03-28', NULL),
	(14, 12, '2025-03-20', '2025-04-03', NULL);
