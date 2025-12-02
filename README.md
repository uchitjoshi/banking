# Fraud Detection System (SQL Project)

This project is a **Fraud Detection System** built using **MySQL**. It is designed to simulate how banks detect suspicious activities such as large withdrawals or frequent transactions within a short period of time.

The system includes:

* User Management
* Bank Accounts
* Transactions
* Automatic Suspicious Activity Detection via SQL Trigger
* Fraud Analytics Query

---

## 📌 **Project Overview**

This project demonstrates how SQL can be used to:

* Create relational tables for storing banking information
* Enforce data integrity using **PRIMARY KEY**, **FOREIGN KEY**, and **CHECK constraints**
* Insert realistic sample data for users, accounts, and transactions
* Detect suspicious activities using SQL queries and triggers
* Automatically store alerts in a dedicated `Suspicious_Activity` table

This is a great structure for anyone building SQL-based fraud monitoring systems.

---

## 🏛️ **Database Structure**

Below is a summary of all tables in the project:

### **1. Users Table**

Stores customer information.

* `user_id` (PK)
* `full_name`
* `email`
* `phone`
* `created_at`

### **2. Accounts Table**

Stores account types and balances.

* `account_id` (PK)
* `user_id` (FK → Users)
* `account_type` (`Saving` or `Checking`)
* `balance`

### **3. Transactions Table**

Stores user transactions.

* `transaction_id` (PK)
* `account_id` (FK → Accounts)
* `transaction_type` (`Deposit`, `Withdrawn`, `Transfer`)
* `amount`
* `location`
* `transaction_time`

### **4. Suspicious_Activity Table**

Stores automatically detected fraud alerts.

* `alert_id` (PK)
* `transaction_id` (FK → Transactions)
* `reason`
* `alert_time`

---

## ⚙️ **Key Features**

### ✔ **1. Automatic Fraud Detection Trigger**

Detects unusually large withdrawals (> 30,000) and logs them.
This enhances system automation and quick monitoring.

### ✔ **2. Withdrawal Frequency Detection Query**

SQL analytic window functions detect accounts making **2+ withdrawals within 1 hour**, a common fraud pattern.

### ✔ **3. Data Integrity & Constraints**

* Unique emails
* Valid account types
* Valid transaction types
* Proper relationships via foreign keys

---

## 🧪 **Sample Fraud Detection Logic**

### **Trigger: Large Withdrawal Alert**

Automatically logs suspicious withdrawals.

### **Query: Frequent Withdrawals**

Find users who withdraw multiple times in under one hour.

---

## 🚀 **How to Run This Project**

1. Open **MySQL Workbench** or any SQL client.
2. Copy-paste the SQL script.
3. Run the database creation and table creation commands.
4. Insert sample data.
5. Test transactions to see fraud alerts generated automatically.

---

## ⭐ **Why This Project Is Useful**

This project is helpful for:

* Students learning database management
* Beginners learning SQL triggers and analytic functions
* Developers designing fraud detection logic
* Anyone exploring relational database security features

It demonstrates a real-world use case of SQL beyond basic CRUD.

---

## 📄 **Author**

Developed for educational and demonstration purposes.

If you need **ER diagrams**, **workflow diagrams**, or a **Python API** for this SQL system, feel free to ask! 🎉
