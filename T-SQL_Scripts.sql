-- Procedure 1: UpdateCarPriceWithLog
-- This procedure updates the price of a car in the database and logs the price change into the Price_Change table.
-- It first checks if the car exists, retrieves the old price, updates it with the new price, and records the change along with the timestamp for historical tracking.
CREATE PROCEDURE UpdateCarPriceWithLog
    @CarID INT,
    @NewPrice DECIMAL(10, 4)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @OldPrice DECIMAL(10, 4);

    -- the old price
    SELECT @OldPrice = Price
    FROM Car
    WHERE CarID = @CarID;

    -- check if the car exists
    IF @OldPrice IS NULL
    BEGIN
        PRINT 'Car does not exist.';
        RETURN;
    END;

    -- update the car price
    UPDATE Car
    SET Price = @NewPrice
    WHERE CarID = @CarID;

    -- log the price change
    INSERT INTO Price_Change (CarID, Old_Price, New_Price, Change_Date)
    VALUES (@CarID, @OldPrice, @NewPrice, GETDATE());

    PRINT 'Car price updated successfully.';
END;
GO

-- test Procedure 1
PRINT 'Testing Procedure: UpdateCarPriceWithLog';
EXEC UpdateCarPriceWithLog @CarID = 1, @NewPrice = 35000;
EXEC UpdateCarPriceWithLog @CarID = 999, @NewPrice = 40000; -- print: Car does not exist
GO

DROP PROCEDURE UpdateCarPriceWithLog;
GO

-- Procedure 2: ListCarsBySupplier (cursor)
-- This procedure retrieves and displays all cars supplied by a specific supplier using a cursor.
-- It processes each car row-by-row, prints the details, and identifies high-value cars by checking if their price exceeds a threshold.
-- This is useful for supplier-specific inventory reviews or analysis.
CREATE PROCEDURE ListCarsBySupplier
    @SupplierID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CarID INT, @Brand NVARCHAR(50), @Model NVARCHAR(50), @Price DECIMAL(10, 4);
    DECLARE car_cursor CURSOR FOR
        SELECT CarID, Brand, Model, Price
        FROM Car
        WHERE SupplierID = @SupplierID;

    -- open the cursor
    OPEN car_cursor;

    -- fetch and process data row-by-row
    FETCH NEXT FROM car_cursor INTO @CarID, @Brand, @Model, @Price;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'CarID: ' + CAST(@CarID AS NVARCHAR) + ', Brand: ' + @Brand +
              ', Model: ' + @Model + ', Price: ' + CAST(@Price AS NVARCHAR);

        -- additional processing (e.g., discount calculations)
        IF @Price > 40000
            PRINT 'High-value car detected.';

        FETCH NEXT FROM car_cursor INTO @CarID, @Brand, @Model, @Price;
    END;

    -- close and deallocate the cursor
    CLOSE car_cursor;
    DEALLOCATE car_cursor;
END;
GO

-- Test Procedure 2
PRINT 'Testing Procedure: ListCarsBySupplier';
EXEC ListCarsBySupplier @SupplierID = 1;
EXEC ListCarsBySupplier @SupplierID = 999; -- should return no rows
GO

DROP PROCEDURE ListCarsBySupplier;
GO

-- Trigger 1: LogCarPriceUpdate
-- This trigger automatically logs changes to car prices in the Price_Change table whenever a price update occurs.
-- It ensures that historical price changes are consistently tracked and outputs a message confirming the logging of the update.
-- This enhances data traceability and supports auditing processes.
CREATE TRIGGER LogCarPriceUpdate
ON Car
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- check if the Price column was updated
    IF UPDATE(Price)
    BEGIN
        -- a variable to store the CarID
        DECLARE @CarID INT;

        -- log the old and new prices into the Price_Change table
        INSERT INTO Price_Change (CarID, Old_Price, New_Price, Change_Date)
        SELECT d.CarID, d.Price, i.Price, GETDATE()
        FROM deleted d
        INNER JOIN inserted i ON d.CarID = i.CarID;

        -- retrieve the CarID for logging purposes
        SELECT TOP 1 @CarID = CarID FROM inserted;

        -- output a message to confirm logging
        PRINT 'Price update logged for CarID: ' + CAST(@CarID AS NVARCHAR);
    END;
END;
GO

PRINT 'Testing Trigger: LogCarPriceUpdate';

-- Test 1: update the price of an existing car
UPDATE Car
SET Price = 35000
WHERE CarID = 1;

-- Test 2: attempt to update the price of a non-existent car (should do nothing)
UPDATE Car
SET Price = 55000
WHERE CarID = 999;

DROP TRIGGER IF EXISTS LogCarPriceUpdate;
GO

-- Trigger 2: ValidatePurchaseTotal
-- This trigger validates the total price of purchases to ensure they fall within acceptable ranges.
-- It rolls back transactions if the total price is invalid (e.g., negative or unreasonably high) and outputs a warning message for high-value purchases.
-- This helps maintain data integrity and flags significant transactions for review.
CREATE TRIGGER ValidatePurchaseTotal
ON Purchase
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- validate the total price
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE TotalPrice < 0 OR TotalPrice > 1000000
    )
    BEGIN
        PRINT 'Invalid total price detected.';
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- identify high-value purchases and output a message
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE TotalPrice > 500000
    )
    BEGIN
        PRINT 'High-value purchase detected.';
    END;

    -- output a confirmation message
    PRINT 'Purchase validated successfully.';
END;
GO

PRINT 'Testing Trigger: ValidatePurchaseTotal';

-- Test 1: Insert a purchase with a valid total price
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (10, 1, 1, 1, 200000, GETDATE(), 1); -- Should succeed

-- Test 2: Insert a purchase with an invalid total price (negative)
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (11, 1, 1, 1, -5000, GETDATE(), 1); -- Should fail and rollback

-- Test 3: Insert a high-value purchase
INSERT INTO Purchase (PurchaseID, EmployeeID, CustomerID, CarID, TotalPrice, Date, Payment_TypeID)
VALUES (11, 1, 1, 7, 600000, GETDATE(), 1); -- Should log as high-value

DROP TRIGGER IF EXISTS ValidatePurchaseTotal;
GO