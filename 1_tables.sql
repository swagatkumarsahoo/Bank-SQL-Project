CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    email VARCHAR2(50),
    phone VARCHAR2(15)
);

CREATE TABLE accounts (
    account_no NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    balance NUMBER(10,2),
    pin NUMBER(4)
);

CREATE TABLE transactions (
    txn_id NUMBER GENERATED ALWAYS AS IDENTITY,
    account_no NUMBER,
    txn_type VARCHAR2(20),
    amount NUMBER(10,2),
    txn_date DATE DEFAULT SYSDATE
);
