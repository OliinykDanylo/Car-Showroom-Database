-- DROP TABLE statements (to ensure clean slate before creating tables)
DROP TABLE IF EXISTS Car_Option;
DROP TABLE IF EXISTS Purchase;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Type;
DROP TABLE IF EXISTS Payment_Type;
DROP TABLE IF EXISTS Position;
DROP TABLE IF EXISTS "Option";
DROP TABLE IF EXISTS Price_Change;

-- Table: Car
CREATE TABLE Car (
    CarID INT NOT NULL PRIMARY KEY,
    Brand NVARCHAR(20) NOT NULL,
    Model NVARCHAR(20) NOT NULL,
    TypeID INT NOT NULL,
    Description NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 4) NOT NULL,
    SupplierID INT NOT NULL,
    Waiting_Time INT NOT NULL
);

-- Table: Car_Option
CREATE TABLE Car_Option (
    CarID INT NOT NULL,
    OptionID INT NOT NULL,
    PRIMARY KEY (CarID, OptionID)
);

-- Table: Customer
CREATE TABLE Customer (
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address NVARCHAR(100) NOT NULL
);

-- Table: Employee
CREATE TABLE Employee (
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    PositionID INT NOT NULL,
    JoiningDate DATE NOT NULL,
    LeavingDate DATE NULL
);

-- Table: Option
CREATE TABLE "Option" (
    OptionID INT NOT NULL PRIMARY KEY,
    "Option" NVARCHAR(50) NOT NULL,
    Price DECIMAL(10, 4) NOT NULL
);

-- Table: Payment_Type
CREATE TABLE Payment_Type (
    Payment_TypeID INT NOT NULL PRIMARY KEY,
    Payment_Type NVARCHAR(20) NOT NULL
);

-- Table: Position
CREATE TABLE Position (
    PositionID INT NOT NULL PRIMARY KEY,
    Position NVARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 4) NOT NULL
);

-- Table: Price_Change
CREATE TABLE Price_Change (
    Price_ChangeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CarID INT NOT NULL,
    Old_Price DECIMAL(10,4) NOT NULL,
    New_Price DECIMAL(10,4) NOT NULL,
    Change_Date DATE NOT NULL
);

-- Table: Purchase
CREATE TABLE Purchase (
    PurchaseID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
    CustomerID INT NOT NULL,
    CarID INT NOT NULL,
    TotalPrice DECIMAL(10, 4) NOT NULL,
    "Date" DATE NOT NULL,
    Payment_TypeID INT NOT NULL
);

-- Table: Supplier
CREATE TABLE Supplier (
    SupplierID INT NOT NULL PRIMARY KEY,
    Supplier NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    OfficeAddress NVARCHAR(50) NOT NULL
);

-- Table: Type
CREATE TABLE Type (
    TypeID INT NOT NULL PRIMARY KEY,
    Type NVARCHAR(20) NOT NULL
);

-- Add relationships
ALTER TABLE Car_Option ADD CONSTRAINT Car_Option_Car
    FOREIGN KEY (CarID) REFERENCES Car (CarID);
ALTER TABLE Car_Option ADD CONSTRAINT Car_Option_Options
    FOREIGN KEY (OptionID) REFERENCES "Option" (OptionID);
ALTER TABLE Car ADD CONSTRAINT Car_Supplier
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID);
ALTER TABLE Car ADD CONSTRAINT Car_Type
    FOREIGN KEY (TypeID) REFERENCES Type (TypeID);
ALTER TABLE Employee ADD CONSTRAINT Employee_Position
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Car
    FOREIGN KEY (CarID) REFERENCES Car (CarID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Customer
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Employee
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Payment_Type
    FOREIGN KEY (Payment_TypeID) REFERENCES Payment_Type (Payment_TypeID);