-- Procedures for the Database

-- Procedure 1: AddCar
-- This procedure adds a new car to the Car table. It performs validations to ensure that
-- the car type exists and prevents duplicate entries for the same brand and model.
-- If all validations pass, it inserts the car details and confirms successful addition.
CREATE OR REPLACE PROCEDURE AddCar (
    p_car_id IN NUMBER,
    p_brand IN NVARCHAR2,
    p_model IN NVARCHAR2,
    p_type_id IN NUMBER,
    p_description IN NVARCHAR2,
    p_price IN NUMBER,
    p_supplier_id IN NUMBER,
    p_waiting_time IN NUMBER
) AS
    v_type_count NUMBER := 0;
    v_car_count NUMBER := 0;
BEGIN
    -- Check if the car type exists
    SELECT COUNT(*) INTO v_type_count
    FROM Type
    WHERE TypeID = p_type_id;

    IF v_type_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20201, 'Car type does not exist.');
    END IF;

    -- Check if the car already exists
    SELECT COUNT(*) INTO v_car_count
    FROM Car
    WHERE Brand = p_brand AND Model = p_model;

    IF v_car_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20202, 'Car with this brand and model already exists.');
    END IF;

    -- Insert the car if validations pass
    INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
    VALUES (p_car_id, p_brand, p_model, p_type_id, p_description, p_price, p_supplier_id, p_waiting_time);
    DBMS_OUTPUT.PUT_LINE('Car added successfully.');
END;
/

-- Test AddCar Procedure
BEGIN
    AddCar(8, 'Toyota', 'Awensis', 1, 'Reliable sedan', 20000, 1, 30);
END;
/
-- Expected Outcome: Car added successfully.

BEGIN
    AddCar(1002, 'Ford', 'Focus', 999, 'Compact car', 20000, 2, 25);
END;
/
-- Expected Outcome: ORA-20201: Car type does not exist.

BEGIN
    AddCar(1003, 'Toyota', 'Camry', 1, 'Reliable sedan', 25000, 1, 30);
END;
/
-- Expected Outcome: ORA-20202: Car with this brand and model already exists.

Drop procedure AddCar;

-- Procedure 2: DeleteCar
-- This procedure deletes a car from the Car table after validating its existence.
-- It iterates through associated purchases using a cursor and logs their details before deletion.
-- If the car is linked to active purchases, deletion raise errors.
CREATE OR REPLACE PROCEDURE DeleteCar (
    p_car_id IN NUMBER
) AS
    CURSOR purchase_cursor IS
        SELECT PurchaseID, CustomerID
        FROM Purchase
        WHERE CarID = p_car_id;
    v_purchase_id NUMBER;
    v_customer_id NUMBER;
    v_car_exists NUMBER;
BEGIN
    -- Check if the car exists
    SELECT COUNT(*) INTO v_car_exists
    FROM Car
    WHERE CarID = p_car_id;

    IF v_car_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20203, 'Car does not exist.');
    END IF;

    -- Open the cursor to iterate through associated purchases
    OPEN purchase_cursor;
    LOOP
        FETCH purchase_cursor INTO v_purchase_id, v_customer_id;
        EXIT WHEN purchase_cursor%NOTFOUND;

        -- Log details of associated purchases (or perform other logic)
        DBMS_OUTPUT.PUT_LINE('Associated PurchaseID: ' || v_purchase_id || ' for CustomerID: ' || v_customer_id);

    END LOOP;
    CLOSE purchase_cursor;

    -- If no associated purchases were found, delete the car
    DELETE FROM Car
    WHERE CarID = p_car_id;

    DBMS_OUTPUT.PUT_LINE('Car with ID ' || p_car_id || ' has been successfully deleted.');
END;
/

-- Test DeleteCar Procedure
BEGIN
    DeleteCar(8);
END;
/
-- Expected Outcome: Car with id (id) has been successfully deleted.

BEGIN
    DeleteCar(9999); -- Replace 9999 with an invalid CarID
END;
/
-- Expected Outcome: ORA-20203: Car does not exist.

BEGIN
    DeleteCar(1);
END;
/
-- Expected Outcome: ORA-02292: integrity constraint violated - child record found

drop procedure deleteCar;

-- Trigger 1: AddCarTrigger
-- This trigger prevents adding cars of a specific type (TypeID = 1) and ensures car model uniqueness.
-- It also logs a message upon successful execution of the trigger.
CREATE OR REPLACE TRIGGER AddCarTrigger
FOR INSERT OR UPDATE ON Car
COMPOUND TRIGGER
    TYPE ModelSet IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    existing_models ModelSet;

    BEFORE STATEMENT IS
    BEGIN
        SELECT Model
        BULK COLLECT INTO existing_models
        FROM Car;
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        -- Prevent adding cars with TypeID = 1
        IF :NEW.TypeID = 1 THEN
            RAISE_APPLICATION_ERROR(-20100, 'Cannot add a car of this type.');
        END IF;

        -- Prevent updating car model to an existing one
        IF UPDATING AND :OLD.Model <> :NEW.Model THEN
            FOR i IN existing_models.FIRST .. existing_models.LAST LOOP
                IF existing_models(i) = :NEW.Model THEN
                    RAISE_APPLICATION_ERROR(-20101, 'Car model must be unique.');
                END IF;
            END LOOP;
        END IF;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger executed successfully.');
    END AFTER STATEMENT;
END;
/

BEGIN
    -- Test 1: Insert a car with TypeID = 1 (should raise an error)
    INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
    VALUES (1, 'BrandA', 'ModelX', 1, 'Invalid car type', 30000, 1, 60);
END;
/

BEGIN
    UPDATE Car
    SET Model = 'Q5' -- model in the table cannot be duplicated
    WHERE CarID = 7;
END;
/

BEGIN
    INSERT INTO Car (CarID, Brand, Model, TypeID, Description, Price, SupplierID, Waiting_Time)
    VALUES (8, 'Toyota', 'Corolla', 2, 'Valid car type', 19000, 1, 90);
END;
/

DROP TRIGGER AddCarTrigger;

-- Trigger 2: PreventSupplierUpdate
-- This trigger enforces data integrity in the Supplier table by preventing unauthorized updates to critical fields, such as the supplier name.
-- It validates changes to the phone number and ensures it follows a proper format (10-15 digits). Additionally, it logs updates to the phone
-- number and email, providing feedback on changes while ensuring compliance with business rules.
CREATE OR REPLACE TRIGGER PreventSupplierUpdate
FOR UPDATE ON Supplier
COMPOUND TRIGGER
    -- Declare a collection to store updated SupplierIDs
    TYPE SupplierIDList IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    updated_supplier_ids SupplierIDList;

    BEFORE EACH ROW IS
    BEGIN
        -- prevent updates to the Supplier name
        IF :OLD.Supplier <> :NEW.Supplier THEN
            RAISE_APPLICATION_ERROR(-20350, 'Cannot change the supplier name.');
        END IF;

        IF :OLD.PhoneNumber <> :NEW.PhoneNumber THEN
            IF :NEW.PhoneNumber IS NULL OR NOT REGEXP_LIKE(:NEW.PhoneNumber, '^\d{10,15}$') THEN
                RAISE_APPLICATION_ERROR(-20351, 'Invalid phone number format. Must be 10-15 digits.');
            END IF;

            -- log a message for phone number update
            DBMS_OUTPUT.PUT_LINE('Phone number updated from ' || :OLD.PhoneNumber || ' to ' || :NEW.PhoneNumber);
        END IF;

        -- log email updates
        IF :OLD.Email <> :NEW.Email THEN
            DBMS_OUTPUT.PUT_LINE('Email updated from ' || :OLD.Email || ' to ' || :NEW.Email);
        END IF;

        -- SupplierID for later processing
        updated_supplier_ids(updated_supplier_ids.COUNT + 1) := :NEW.SupplierID;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- the number of suppliers updated in this transaction
        DBMS_OUTPUT.PUT_LINE('Number of suppliers updated: ' || updated_supplier_ids.COUNT);
    END AFTER STATEMENT;
END;
/

BEGIN
    UPDATE Supplier
    SET PhoneNumber = '9876543210', Email = 'updated@example.com'
    WHERE SupplierID = 1;
END;
/
-- Expected Output:
-- Phone number updated from <old number> to '9876543210'.
-- Email updated from <old email> to 'updated@example.com'.
-- Supplier with ID 1 was updated.

BEGIN
    UPDATE Supplier
    SET PhoneNumber = '123'
    WHERE SupplierID = 1;
END;
/
-- Expected Output:
-- ORA-20351: Invalid phone number format. Must be 10-15 digits.

BEGIN
    UPDATE Supplier
    SET Supplier = 'New Supplier Name'
    WHERE SupplierID = 1;
END;
/
-- Expected Output:
-- ORA-20350: Cannot change the supplier name.

drop trigger PreventSupplierUpdate;