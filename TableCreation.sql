-- Table: Car
CREATE TABLE Car (
    CarID integer  NOT NULL,
    Brand nvarchar2(20)  NOT NULL,
    Model nvarchar2(20)  NOT NULL,
    TypeID integer  NOT NULL,
    Description nvarchar2(100)  NOT NULL,
    Price number(10,4)  NOT NULL,
    SupplierID integer  NOT NULL,
    Waiting_Time integer  NOT NULL,
    CONSTRAINT Car_pk PRIMARY KEY (CarID)
) ;

-- Table: Car_Option
CREATE TABLE Car_Option (
    CarID integer  NOT NULL,
    OptionID integer  NOT NULL,
    CONSTRAINT Car_Option_pk PRIMARY KEY (CarID,OptionID)
) ;

-- Table: Customer
CREATE TABLE Customer (
    CustomerID integer  NOT NULL,
    FirstName nvarchar2(20)  NOT NULL,
    LastName nvarchar2(20)  NOT NULL,
    DateOfBirth date  NOT NULL,
    Address nvarchar2(20)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (CustomerID)
) ;

-- Table: Employee
CREATE TABLE Employee (
    EmployeeID integer  NOT NULL,
    FirstName nvarchar2(20)  NOT NULL,
    LastName nvarchar2(20)  NOT NULL,
    DateOfBirth date  NOT NULL,
    PhoneNumber nvarchar2(20)  NOT NULL,
    Email nvarchar2(50)  NOT NULL,
    PositionID integer  NOT NULL,
    JoiningDate date  NOT NULL,
    LeavingDate date  NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (EmployeeID)
) ;

-- Table: Option
CREATE TABLE ADDITIONAL_OPTION  (
    OptionID integer  NOT NULL,
    "Option" nvarchar2(50)  NOT NULL,
    Price number(10,4)  NOT NULL,
    CONSTRAINT Option_pk PRIMARY KEY (OptionID)
) ;

-- Table: Payment_Type
CREATE TABLE Payment_Type (
    Payment_TypeID integer  NOT NULL,
    Payment_Type nvarchar2(20)  NOT NULL,
    CONSTRAINT Payment_Type_pk PRIMARY KEY (Payment_TypeID)
) ;

-- Table: Position
CREATE TABLE Position (
    PositionID integer  NOT NULL,
    Position nvarchar2(50)  NOT NULL,
    Salary number(10,4)  NOT NULL,
    CONSTRAINT Position_pk PRIMARY KEY (PositionID)
) ;

-- Table: Purchase
CREATE TABLE Purchase (
    PurchaseID integer  NOT NULL,
    EmployeeID integer  NOT NULL,
    CustomerID integer  NOT NULL,
    CarID integer  NOT NULL,
    TotalPrice number(10,4)  NOT NULL,
    "Date" date  NOT NULL,
    Payment_TypeID integer  NOT NULL,
    CONSTRAINT Purchase_pk PRIMARY KEY (PurchaseID)
) ;

-- Table: Supplier
CREATE TABLE Supplier (
    SupplierID integer  NOT NULL,
    Supplier nvarchar2(50)  NOT NULL,
    PhoneNumber nvarchar2(20)  NOT NULL,
    Email nvarchar2(50)  NOT NULL,
    OfficeAddress nvarchar2(50)  NOT NULL,
    CONSTRAINT Supplier_pk PRIMARY KEY (SupplierID)
) ;

-- Table: Type
CREATE TABLE Type (
    TypeID integer  NOT NULL,
    Type nvarchar2(20)  NOT NULL,
    CONSTRAINT Type_pk PRIMARY KEY (TypeID)
) ;

-- foreign keys
-- Reference: Car_Option_Car (table: Car_Option)
ALTER TABLE Car_Option ADD CONSTRAINT Car_Option_Car
    FOREIGN KEY (CarID)
    REFERENCES Car (CarID);

-- Reference: Car_Option_Options (table: Car_Option)
ALTER TABLE Car_Option ADD CONSTRAINT Car_Option_Options
    FOREIGN KEY (OptionID)
    REFERENCES ADDITIONAL_OPTION (OptionID);

-- Reference: Car_Supplier (table: Car)
ALTER TABLE Car ADD CONSTRAINT Car_Supplier
    FOREIGN KEY (SupplierID)
    REFERENCES Supplier (SupplierID);

-- Reference: Car_Type (table: Car)
ALTER TABLE Car ADD CONSTRAINT Car_Type
    FOREIGN KEY (TypeID)
    REFERENCES Type (TypeID);

-- Reference: Employee_Position (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Position
    FOREIGN KEY (PositionID)
    REFERENCES Position (PositionID);

-- Reference: Purchase_Car (table: Purchase)
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Car
    FOREIGN KEY (CarID)
    REFERENCES Car (CarID);

-- Reference: Purchase_Customer (table: Purchase)
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customer (CustomerID);

-- Reference: Purchase_Employee (table: Purchase)
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Employee
    FOREIGN KEY (EmployeeID)
    REFERENCES Employee (EmployeeID);

-- Reference: Purchase_Payment_Type (table: Purchase)
ALTER TABLE Purchase ADD CONSTRAINT Purchase_Payment_Type
    FOREIGN KEY (Payment_TypeID)
    REFERENCES Payment_Type (Payment_TypeID);


