# Bank Database Management System (Oracle SQL & PL/SQL)

## 📌 Description
This is a Bank Database Management System built using Oracle SQL and PL/SQL.
It demonstrates database design, business logic implementation with stored procedures, and data integrity using triggers.

## 🛠 Technologies Used
- Oracle SQL
- PL/SQL (Procedures & Triggers)
- DDL & DML
- Constraints
- Transactions

## ✨ Features
- Create and manage customer & account records
- Deposit money using `deposit_money` procedure
- Withdraw money with PIN validation using `withdraw_money`
- Transfer money between accounts using `transfer_money`
- Transaction history logging
- Prevent negative balance using a trigger

## ▶ How to Run
1. Open Oracle SQL Developer or use **VS Code** with SQLTools/Oracle extension
2. Connect to your Oracle database
3. Run files in order:
   - `1_tables.sql`
   - `2_sample_data.sql`
   - `3_procedures.sql`
   - `4_triggers.sql`
   - `5_test_cases.sql`

## 🧪 Sample Commands
```sql
EXEC deposit_money(1001, 1000);
EXEC withdraw_money(1001, 500, 1234);
EXEC transfer_money(1001, 1002, 300, 1234);

SELECT * FROM accounts;
SELECT * FROM transactions;

👨‍💻 Author
Swagat Kumar Sahoo
