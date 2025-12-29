CREATE OR REPLACE PROCEDURE withdraw_money (
    acc_no   IN NUMBER,
    amt      IN NUMBER,
    acc_pin  IN NUMBER
) AS
    v_balance NUMBER;
BEGIN
    -- Validate amount
    IF amt <= 0 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Invalid withdrawal amount');
    END IF;

    -- Get balance with PIN validation
    SELECT balance
    INTO v_balance
    FROM accounts
    WHERE account_no = acc_no
      AND pin = acc_pin;

    -- Check sufficient balance
    IF v_balance < amt THEN
        RAISE_APPLICATION_ERROR(-20012, 'Insufficient balance');
    END IF;

    -- Withdraw amount
    UPDATE accounts
    SET balance = balance - amt
    WHERE account_no = acc_no;

    -- Insert transaction record
    INSERT INTO transactions (account_no, txn_type, amount)
    VALUES (acc_no, 'WITHDRAW', amt);

    COMMIT;
END;
/
