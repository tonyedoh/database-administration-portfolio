--Create the database:

CREATE DATABASE
UserAccessLab;
GO

--Create the table:

USE UserAccessLab;
GO


CREATE TABLE dbo.Customers
(
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  Email VARCHAR(100),
  City VARCHAR(50)
);
GO

--Insert sample records:

INSERT INTO Customers
(CustomerID, CustomerName, Email, City)
VALUES
(1,'John Smith','john@email.com','London'),
(2,'Mary Johnson','mary@email.com','Manchester'),
(3,'David Brown','david@email.com','Birmingham'),
(4,'Sarah Wilson','sarah@email.com','Liverpool'),
(5,'Peter Adams','peter@email.com','Leeds');
GO


--Verify the records:

SELECT * FROM Customers;
GO


--Create login:

CREATE LOGIN developer01
WITH PASSWORD = 'LabOnly@2222',
 CHECK_POLICY = ON,
 CHECK_EXPIRATION = OFF;
GO


--Create database user: 

CREATE USER developer01
FOR LOGIN developer01;
GO


--db_datareader assignment:

ALTER ROLE db_datareader
ADD MEMBER developer01;
GO


--Permission verification queries:

--01: SELECT

SELECT * FROM Customers;
GO


--02: INSERT

INSERT INTO dbo.Customers
(CustomerId, CustomerName, Email, City)
VALUES
(6,'Tony Smith','tony@email.com','London');
GO


--03: UPDATE

UPDATE Customers
SET City = 'Paris'
WHERE CustomerID = 1;
GO

--04: DELETE

DELETE FROM Customers
WHERE CustomerID = 1;
GO
