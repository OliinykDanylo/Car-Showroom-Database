-- alter session set nls_date_format = 'DD-MM-YYYY';

--Suppliers
INSERT INTO Supplier (SupplierID, Supplier, PhoneNumber, Email, OfficeAddress)
VALUES (1, 'Supplier A', '1234567890', 'contact@supplierA.com', '123 Supplier Street');
INSERT INTO Supplier (SupplierID, Supplier, PhoneNumber, Email, OfficeAddress)
VALUES (2, 'Supplier B', '0987654321', 'contact@supplierB.com', '456 Supplier Avenue');
INSERT INTO Supplier (SupplierID, Supplier, PhoneNumber, Email, OfficeAddress)
VALUES (3, 'Supplier C', '7908453890', 'contact@supplierC.com', '789 Supplier District');

--Type
INSERT INTO Type (TypeID, Type) VALUES (1, 'Sedan');
INSERT INTO Type (TypeID, Type) VALUES (2, 'SUV');
INSERT INTO Type (TypeID, Type) VALUES (3, 'Coupe');
INSERT INTO Type (TypeID, Type) VALUES (4, 'Sports car');

--Cars
INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (1, 'Toyota', 'Camry', 1, 'A reliable and fuel-efficient sedan.', 25000.0000, 1, 30);

INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (2, 'Honda', 'Civic', 1, 'A compact sedan with great mileage.', 22000.0000, 1, 25);

INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (3, 'Ford', 'Explorer', 2, 'A spacious and powerful SUV.', 35000.0000, 2, 40);

INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (4, 'BMW', 'M4', 3, 'A high-performance coupe.', 70000.0000, 2, 60);

INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (5, 'Audi', 'Q5', 2, 'A luxury SUV with advanced features.', 45000.0000, 1, 45);

INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (6, 'Porsche', 'GT3RS', 4, 'The most extreme street-legal Porsche car.', 700000.0000, 3, 365);

INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
VALUES (7, 'Rolls-Royce', 'Cullinan', 2, 'The first ever Rolls-Royce SUV and at the same time the most luxurious SUV.', 550000.0000, 3, 150);
--Position
INSERT INTO Position (PositionID, Position, Salary)
VALUES (1, 'Sales Manager', 15000.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (2, 'Sales Representative', 8000.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (3, 'Technician', 4500.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (4, 'Accountant', 6000.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (5, 'Receptionist', 3500.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (6, 'Customer Service Representative', 4000.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (7, 'Marketing Manager', 15000.0000);

INSERT INTO Position (PositionID, Position, Salary)
VALUES (8, 'Director', 20000.0000);
--ADDITIONAL_OPTION
INSERT INTO "Option" (OptionID, "Option", PRICE)
VALUES (1, 'Sunroof', 1000.0000);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (2, 'Leather Seats', 1500.0000);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (3, 'Carbon body kit', 40000.0000);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (4, 'Improved sound system', 4000.0000);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (5, 'Back Camera', 500.0000);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (6, 'Heated Back Seats', 800.0000);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (7, 'Fridge', 10000.00);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (8, 'Custom front sport seats ', 5000.00);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (9, 'Mansory body kit', 150000.00);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (10, 'Massage seats', 20000.00);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (11, 'Akrapovich exhaust system', 15000.00);

INSERT INTO "Option" (OptionID, "Option", Price)
VALUES (12, 'Desert body kit', 10000.00);
--Car_Option
--Camry
INSERT INTO Car_Option (CarID, OptionID)
VALUES (1, 1);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (1, 2);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (1, 4);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (1, 5);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (1, 6);

--Honda Civic
INSERT INTO Car_Option (CarID, OptionID)
VALUES (2, 1);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (2, 2);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (2, 4);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (2, 5);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (2, 6);

--Ford Explorer
INSERT INTO Car_Option (CarID, OptionID)
VALUES (3, 1);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (3, 2);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (3, 4);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (3, 5);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (3, 6);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (3, 12);

--BMW M4
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 1);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 2);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 3);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 4);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 5);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 6);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 8);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (4, 11);

--Audi Q5
INSERT INTO Car_Option (CarID, OptionID)
VALUES (5, 1);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (5, 2);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (5, 4);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (5, 5);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (5, 6);

--GT3 RS
INSERT INTO Car_Option (CarID, OptionID)
VALUES (6, 3);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (6, 4);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (6, 9);

--ROLLS
INSERT INTO Car_Option (CarID, OptionID)
VALUES (7, 3);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (7, 7);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (7, 9);
INSERT INTO Car_Option (CarID, OptionID)
VALUES (7, 10);
--Customers
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (1, 'John', 'Ditch', TO_DATE('1980-01-15', 'YYYY-MM-DD'), '123 Main St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (2, 'Jane', 'Smith', TO_DATE('1990-02-20', 'YYYY-MM-DD'), '456 Elm St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (3, 'Alice', 'Johnson', TO_DATE('1985-03-10', 'YYYY-MM-DD'), '789 Maple Ave');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (4, 'Bob', 'Brown', TO_DATE('1975-04-05', 'YYYY-MM-DD'), '101 Oak St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (5, 'Charlie', 'Davis', TO_DATE('2000-05-25', 'YYYY-MM-DD'), '202 Pine St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (6, 'Diana', 'Wilson', TO_DATE('1995-06-15', 'YYYY-MM-DD'), '303 Cedar St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (7, 'Eve', 'Miller', TO_DATE('1982-07-30', 'YYYY-MM-DD'), '404 Birch Rd');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (8, 'Frank', 'Garcia', TO_DATE('1999-08-10', 'YYYY-MM-DD'), '505 Walnut St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (9, 'Grace', 'Martinez', TO_DATE('1987-09-22', 'YYYY-MM-DD'), '606 Chestnut St');

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (10, 'Henry', 'Rodriguez', TO_DATE('1978-10-17', 'YYYY-MM-DD'), '707 Spruce St');
--Employee
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (1, 'James', 'Smith', TO_DATE('1985-01-10', 'YYYY-MM-DD'), '123-456-7890', 'james.smith@example.com', 1, TO_DATE('2015-03-01', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (2, 'Kyle', 'Green', TO_DATE('1985-01-10', 'YYYY-MM-DD'), '123-456-7890', 'kyle.green@example.com', 2, TO_DATE('2017-03-11', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (3, 'Mary', 'Johnson', TO_DATE('1978-04-22', 'YYYY-MM-DD'), '234-567-8901', 'mary.johnson@example.com', 2, TO_DATE('2019-07-15', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (4, 'Robert', 'Williams', TO_DATE('1990-06-17', 'YYYY-MM-DD'), '345-678-9012', 'robert.williams@example.com', 3, TO_DATE('2018-01-20', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (5, 'Anthony', 'Bulter', TO_DATE('1985-01-10', 'YYYY-MM-DD'), '123-456-7890', 'anthony.butler@example.com', 3, TO_DATE('2018-04-01', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (6, 'Patricia', 'Brown', TO_DATE('1982-09-05', 'YYYY-MM-DD'), '456-789-0123', 'patricia.brown@example.com', 4, TO_DATE('2016-04-10', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (7, 'Linda', 'Garcia', TO_DATE('1975-12-15', 'YYYY-MM-DD'), '678-901-2345', 'linda.garcia@example.com', 5, TO_DATE('2008-09-25', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (8, 'Michele', 'Ross', TO_DATE('1988-11-23', 'YYYY-MM-DD'), '567-890-1234', 'michele.ross@example.com', 6, TO_DATE('2016-08-05', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (9, 'Michael', 'Jones', TO_DATE('1988-11-23', 'YYYY-MM-DD'), '567-890-1234', 'michael.jones@example.com', 7, TO_DATE('2017-05-05', 'YYYY-MM-DD'), NULL);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (10, 'Tom', 'Hulk', TO_DATE('1988-11-23', 'YYYY-MM-DD'), '567-890-1234', 'tom.hulk@example.com', 8, TO_DATE('2014-05-05', 'YYYY-MM-DD'), NULL);
--Payment_type
INSERT INTO Payment_Type (Payment_TypeID, Payment_Type)
VALUES (1, 'Cash');

INSERT INTO Payment_Type (Payment_TypeID, Payment_Type)
VALUES (2, 'Credit Card');

INSERT INTO Payment_Type (Payment_TypeID, Payment_Type)
VALUES (3, 'Debit Card');

INSERT INTO Payment_Type (Payment_TypeID, Payment_Type)
VALUES (4, 'Bank Transfer');

INSERT INTO Payment_Type (Payment_TypeID, Payment_Type)
VALUES (5, 'Cheque');

INSERT INTO Payment_Type (Payment_TypeID, Payment_Type)
VALUES (6, 'Cryptocurrency');
--Purchase
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (1, 2, 1, 1, 25000.0000, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (2, 2, 2, 2, 22000.0000, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 2);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (3, 3, 3, 3, 35000.0000, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 3);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (4, 3, 4, 4, 70000.0000, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 4);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (5, 2, 5, 5, 45000.0000, TO_DATE('2023-05-25', 'YYYY-MM-DD'), 5);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (6, 1, 6, 6, 700000.0000, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 6);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (7, 1, 7, 7, 550000.0000, TO_DATE('2023-07-30', 'YYYY-MM-DD'), 5);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (8, 3, 8, 5, 45000.0000, TO_DATE('2023-08-10', 'YYYY-MM-DD'), 4);

INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, "Date", Payment_TypeID)
VALUES (9, 1, 10, 4, 70000.0000, TO_DATE('2023-10-17', 'YYYY-MM-DD'), 2);

commit;