CREATE OR REPLACE TRIGGER prevent_negative_balance
BEFORE UPDATE ON accounts
FOR EACH ROW
BEGIN
    IF :NEW.balance < 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Balance cannot be negative');
    END IF;
END;
/
