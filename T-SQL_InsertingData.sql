-- Suppliers
INSERT INTO Supplier (SupplierID, Supplier, PhoneNumber, Email, OfficeAddress)
VALUES (1, 'Supplier A', '1234567890', 'contact@supplierA.com', '123 Supplier Street');
INSERT INTO Supplier (SupplierID, Supplier, PhoneNumber, Email, OfficeAddress)
VALUES (2, 'Supplier B', '0987654321', 'contact@supplierB.com', '456 Supplier Avenue');
INSERT INTO Supplier (SupplierID, Supplier, PhoneNumber, Email, OfficeAddress)
VALUES (3, 'Supplier C', '7908453890', 'contact@supplierC.com', '789 Supplier District');

-- Types
INSERT INTO Type (TypeID, Type) VALUES (1, 'Sedan');
INSERT INTO Type (TypeID, Type) VALUES (2, 'SUV');
INSERT INTO Type (TypeID, Type) VALUES (3, 'Coupe');
INSERT INTO Type (TypeID, Type) VALUES (4, 'Sports car');

-- Cars
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

-- Positions
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

-- Options
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (1, 'Sunroof', 1000.0000);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (2, 'Leather Seats', 1500.0000);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (3, 'Carbon body kit', 40000.0000);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (4, 'Improved sound system', 4000.0000);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (5, 'Back Camera', 500.0000);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (6, 'Heated Back Seats', 800.0000);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (7, 'Fridge', 10000.00);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (8, 'Custom front sport seats', 5000.00);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (9, 'Mansory body kit', 150000.00);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (10, 'Massage seats', 20000.00);
INSERT INTO [Option] (OptionID, [Option], Price)
VALUES (11, 'Akrapovich exhaust system', 15000.00);
INSERT INTO [Option] (OptionID, [Option], Price)
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

-- Customers
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (1, 'John', 'Ditch', CAST('1980-01-15' AS DATE), '123 Main St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (2, 'Jane', 'Smith', CAST('1990-02-20' AS DATE), '456 Elm St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (3, 'Alice', 'Johnson', CAST('1985-03-10' AS DATE), '789 Maple Ave');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (4, 'Bob', 'Brown', CAST('1975-04-05' AS DATE), '101 Oak St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (5, 'Charlie', 'Davis', CAST('2000-05-25' AS DATE), '202 Pine St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (6, 'Diana', 'Wilson', CAST('1995-06-15' AS DATE), '303 Cedar St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (7, 'Eve', 'Miller', CAST('1982-07-30' AS DATE), '404 Birch Rd');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (8, 'Frank', 'Garcia', CAST('1999-08-10' AS DATE), '505 Walnut St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (9, 'Grace', 'Martinez', CAST('1987-09-22' AS DATE), '606 Chestnut St');
INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address)
VALUES (10, 'Henry', 'Rodriguez', CAST('1978-10-17' AS DATE), '707 Spruce St');

-- Employees
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (1, 'James', 'Smith', CAST('1985-01-10' AS DATE), '123-456-7890', 'james.smith@example.com', 1, CAST('2015-03-01' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (2, 'Kyle', 'Green', CAST('1985-01-10' AS DATE), '123-456-7890', 'kyle.green@example.com', 2, CAST('2017-03-11' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (3, 'Mary', 'Johnson', CAST('1978-04-22' AS DATE), '234-567-8901', 'mary.johnson@example.com', 2, CAST('2019-07-15' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (4, 'Robert', 'Williams', CAST('1990-06-17' AS DATE), '345-678-9012', 'robert.williams@example.com', 3, CAST('2018-01-20' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (5, 'Anthony', 'Bulter', CAST('1985-01-10' AS DATE), '123-456-7890', 'anthony.butler@example.com', 3, CAST('2018-04-01' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (6, 'Patricia', 'Brown', CAST('1982-09-05' AS DATE), '456-789-0123', 'patricia.brown@example.com', 4, CAST('2016-04-10' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (7, 'Linda', 'Garcia', CAST('1975-12-15' AS DATE), '678-901-2345', 'linda.garcia@example.com', 5, CAST('2008-09-25' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (8, 'Michele', 'Ross', CAST('1988-11-23' AS DATE), '567-890-1234', 'michele.ross@example.com', 6, CAST('2016-08-05' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (9, 'Michael', 'Jones', CAST('1988-11-23' AS DATE), '567-890-1234', 'michael.jones@example.com', 7, CAST('2017-05-05' AS DATE), NULL);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, PositionID, JoiningDate, LeavingDate)
VALUES (10, 'Tom', 'Hulk', CAST('1988-11-23' AS DATE), '567-890-1234', 'tom.hulk@example.com', 8, CAST('2014-05-05' AS DATE), NULL);

-- Payment Types
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

-- Purchases
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (1, 2, 1, 1, 25000.0000, CAST('2023-01-15' AS DATE), 1);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (2, 2, 2, 2, 22000.0000, CAST('2023-02-20' AS DATE), 2);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (3, 3, 3, 3, 35000.0000, CAST('2023-03-10' AS DATE), 3);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (4, 3, 4, 4, 70000.0000, CAST('2023-04-05' AS DATE), 4);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (5, 2, 5, 5, 45000.0000, CAST('2023-05-25' AS DATE), 5);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (6, 1, 6, 6, 700000.0000, CAST('2023-06-15' AS DATE), 6);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (7, 1, 7, 7, 550000.0000, CAST('2023-07-30' AS DATE), 5);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (8, 3, 8, 5, 45000.0000, CAST('2023-08-10' AS DATE), 4);
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (9, 1, 10, 4, 70000.0000, CAST('2023-10-17' AS DATE), 2);