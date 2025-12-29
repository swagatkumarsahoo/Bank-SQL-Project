CREATE OR REPLACE PROCEDURE deposit_money (
    acc_no IN NUMBER,
    amt IN NUMBER
) AS
BEGIN
    IF amt <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid deposit amount');
    END IF;

    UPDATE accounts
    SET balance = balance + amt
    WHERE account_no = acc_no;

    INSERT INTO transactions (account_no, txn_type, amount)
    VALUES (acc_no, 'DEPOSIT', amt);

    COMMIT;
END;
/
