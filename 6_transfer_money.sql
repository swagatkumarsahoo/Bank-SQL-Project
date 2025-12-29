CREATE OR REPLACE PROCEDURE transfer_money (
    from_acc IN NUMBER,
    to_acc   IN NUMBER,
    amt      IN NUMBER,
    acc_pin  IN NUMBER
) AS
    v_balance NUMBER;
BEGIN
    -- Validate amount
    IF amt <= 0 THEN
        RAISE_APPLICATION_ERROR(-20021, 'Invalid transfer amount');
    END IF;

    -- Validate sender balance & PIN
    SELECT balance
    INTO v_balance
    FROM accounts
    WHERE account_no = from_acc
      AND pin = acc_pin;

    IF v_balance < amt THEN
        RAISE_APPLICATION_ERROR(-20022, 'Insufficient balance');
    END IF;

    -- Debit sender
    UPDATE accounts
    SET balance = balance - amt
    WHERE account_no = from_acc;

    -- Credit receiver
    UPDATE accounts
    SET balance = balance + amt
    WHERE account_no = to_acc;

    -- Transaction records
    INSERT INTO transactions (account_no, txn_type, amount)
    VALUES (from_acc, 'TRANSFER-DEBIT', amt);

    INSERT INTO transactions (account_no, txn_type, amount)
    VALUES (to_acc, 'TRANSFER-CREDIT', amt);

    COMMIT;
END;
/

