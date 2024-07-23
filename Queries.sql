--Tasks:
--1ST TASK
-- Get details of purchases made by a specific customer
SELECT
    P.PurchaseID,
    P."Date",
    C.FirstName,
    C.LastName,
    CAR.Brand,
    CAR.Model,
    P.TotalPrice
FROM
    Purchase P
JOIN
    Customer C ON P.CustomerID = C.CustomerID
JOIN
    Car CAR ON P.CarID = CAR.CarID
WHERE
    C.FirstName = 'John' AND C.LastName = 'Ditch';

--Find employees who made sales within a specific date range
SELECT
    E.FirstName,
    E.LastName,
    P.PurchaseID,
    P."Date",
    C.BRAND,
    C.MODEL,
    P.TotalPrice
FROM
    Employee E
JOIN
    Purchase P ON E.EmployeeID = P.EmployeeID
JOIN
    CAR C ON P.CARID = C.CARID
WHERE
    P."Date" BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-03-31', 'YYYY-MM-DD');

--List cars along with their suppliers and specific options
SELECT
    CAR.CarID,
    CAR.Brand,
    CAR.Model,
    S.Supplier,
    AO."Option",
    AO.Price
FROM
    Car CAR
JOIN
    Supplier S ON CAR.SupplierID = S.SupplierID
JOIN
    CAR_OPTION CO ON CAR.CarID = CO.CarID
JOIN
    ADDITIONAL_OPTION AO ON CO.OptionID = AO.OptionID
WHERE
    AO.Price > 5000
ORDER BY CARID;

        --2ND TASK
--This query calculates the average price of cars provided by each supplier, includes the supplier and employee details,
-- and shows only those suppliers with an average car price above a certain threshold.
SELECT
    Supplier.SupplierID,
    Supplier.Supplier,
    ROUND(AVG(Car.Price)) AS Average_Price,
    Employee.FirstName,
    Employee.LastName
FROM
    Car
INNER JOIN
    Supplier ON Car.SupplierID = Supplier.SupplierID
INNER JOIN
    Employee ON Supplier.SupplierID = Employee.EmployeeID  -- Assuming an employee is linked to a supplier
GROUP BY
    Supplier.SupplierID, Supplier.Supplier, Employee.FirstName, Employee.LastName
HAVING
    AVG(Car.Price) > 30000;

--Total price of options for each car, only include cars where the total price of options is greater than $10,000
SELECT
    CAR.CarID,
    CAR.Brand,
    CAR.Model,
    SUM(AO.Price) AS TotalOptionsPrice
FROM
    Car CAR
JOIN
    CAR_OPTION CAO ON CAR.CarID = CAO.CarID
JOIN
    ADDITIONAL_OPTION AO ON CAO.OptionID = AO.OptionID
GROUP BY
    CAR.CarID, CAR.Brand, CAR.Model
HAVING
    SUM(AO.Price) > 10000;

--This query calculates the total salary for each position and includes details of employees holding those positions.
-- It only includes positions with a total salary above a certain amount.
SELECT
    Position.PositionID,
    Position.Position,
    SUM(Position.Salary) AS Total_Salary,
    Employee.FirstName,
    Employee.LastName
FROM
    Employee
INNER JOIN
    Position ON Employee.PositionID = Position.PositionID
INNER JOIN
    Supplier ON Employee.EmployeeID = Supplier.SupplierID  -- Assuming employees are linked to suppliers
GROUP BY
    Position.PositionID, Position.Position, Employee.FirstName, Employee.LastName
HAVING
    SUM(Position.Salary) > 5000;

        --3RD TASK
--Cars with Price Above Average
SELECT
    CarID,
    Brand,
    Model,
    Price
FROM
    Car
WHERE
    Price > (SELECT AVG(Price) FROM Car);

--Suppliers Providing More Than One Car
SELECT
    SupplierID,
    Supplier,
    PhoneNumber,
    Email,
    OfficeAddress
FROM
    Supplier
WHERE
    SupplierID IN (SELECT SupplierID FROM Car GROUP BY SupplierID HAVING COUNT(CarID) > 1);

        --4TH TASK
--Cars Priced Above Supplier Average
SELECT
    CarID,
    Brand,
    Model,
    Price,
    SupplierID
FROM
    Car c1
WHERE
    Price > (SELECT AVG(Price)
             FROM Car c2
             WHERE c2.SupplierID = c1.SupplierID);

--Cars with Above-Average Price for Their Type
SELECT
    CarID,
    Brand,
    Model,
    Price,
    TypeID
FROM
    Car c1
WHERE
    Price > (SELECT AVG(Price)
             FROM Car c2
             WHERE c2.TypeID = c1.TypeID);