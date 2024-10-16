--STEP 1: CREATE A DATABASE
CREATE DATABASE DELIVERY_2
GO
USE DELIVERY_2
GO

--STEP 2: CREATE CUSTOMERS TABLE
CREATE TABLE Customers
(
	CustomerID VARCHAR(10) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Phone VARCHAR(10) NOT NULL,
	Address NVARCHAR(100),
	PRIMARY KEY(CustomerID)
)

--STEP 3: CREATE SHIPPER TABLE
CREATE TABLE Shipper
(
	ShipperID VARCHAR(8) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Phone VARCHAR(10) NOT NULL,
	AssignedOrders INT DEFAULT 0,
	PRIMARY KEY(ShipperID)
)

--STEP 4: CREATE ORDERSTATUS TABLE
CREATE TABLE OrderStatus
(
	StatusID INT NOT NULL,
	StatusDescription NVARCHAR(50) NOT NULL,
	PRIMARY KEY(StatusID)
)

--STEP 5: CREATE RECEIVER TABLE
CREATE TABLE Receiver
(
	ReceiverID VARCHAR(10) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Phone VARCHAR(10) NOT NULL,
	DeliveryAddress NVARCHAR(100) NOT NULL,
	PRIMARY KEY(ReceiverID)
)



--STEP 6: CREATE RECEIVER TABLE
CREATE TABLE Orders
(
	OrderID VARCHAR(10) NOT NULL,
	CustomerID VARCHAR(10) FOREIGN KEY REFERENCES Customers(CustomerID),
	ShipperID VARCHAR(8) FOREIGN KEY REFERENCES Shipper(ShipperID),
	DeliveryAddress NVARCHAR(100) NOT NULL,
	OrderDate DATE NOT NULL,
	ReceiverID VARCHAR(10) FOREIGN KEY REFERENCES Receiver(ReceiverID),
	StatusID INT FOREIGN KEY REFERENCES OrderStatus(StatusID),
	PRIMARY KEY(OrderID)
)

--STEP 7: CREATE HISTORYSTATUS TABLE
CREATE TABLE HistoryStatus
(
	OrderID VARCHAR(10) NOT NULL,
	StatusID INT NOT NULL,
	PRIMARY KEY(OrderID, StatusID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID),
	Timestamp DATETIME,
	Note NVARCHAR(100)
)


