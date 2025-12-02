-- Create Database 

	CREATE DATABASE Fraud_Detection_System;
    USE Fraud_Detection_System;
    
    
    -- User Table 
    
    CREATE TABLE Users(
		user_id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        phone VARCHAR(15),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
    -- Account Table 
    CREATE TABLE Accounts(
		account_id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT,
        account_type VARCHAR(20) CHECK(account_type IN ('Saving', 'Checking')),
        balance DECIMAL(15,2) DEFAULT 0.00,
        FOREIGN KEY(user_id) REFERENCES Users(user_id)
    );
    
    -- Transactions
    CREATE TABLE Transactions(
		transaction_id INT AUTO_INCREMENT PRIMARY KEY,
        account_id INT,
        transaction_type VARCHAR(20) CHECK(transaction_type IN ('Deposit', 'Withdrawn', 'Transfer')),
        amount DECIMAL(15,2) NOT NULL,
        location VARCHAR(100),
        transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY(account_id) REFERENCES Accounts(account_id)
    );
  
    
		-- Supicious Activity Table 
	CREATE TABLE Suspicious_Activity(
		alert_id INT AUTO_INCREMENT PRIMARY KEY,
		transaction_id	INT,
        reason VARCHAR(255),
        alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id)
    );
    
    
    -- Insert Users
INSERT INTO Users (full_name, email, phone)
VALUES ('Alice Sharma', 'alice@example.com', '9812345678'),
       ('Bob Thapa', 'bob@example.com', '9823456789');
       
       SELECT *FROM Users;

-- Insert Accounts
INSERT INTO Accounts (user_id, account_type, balance)
VALUES (1, 'Saving', 50000),
       (2, 'Checking', 20000);
       SHOW CREATE TABLE Accounts;


-- Insert Transactions
INSERT INTO Transactions (account_id, transaction_type, amount, location)
VALUES (1, 'Withdrawn', 10000, 'Kathmandu'),
       (1, 'Withdrawn', 25000, 'Pokhara'),
       (2, 'Deposit', 15000, 'Kathmandu'),
       (1, 'Withdrawn', 40000, 'Kathmandu'); -- suspicious

SELECT * FROM Transactions;

	-- DEtect user making 2 + withdewals in less than 1 hr
    
    SELECT t.account_id, t.transaction_id, t.amount, t.transaction_time,
		COUNT(*) OVER (PARTITION BY t.account_id
						Order BY t.transaction_time
                        RANGE BETWEEN INTERVAL 1 HOUR PRECEDING AND CURRENT ROW) AS withdrawals_in_1hr
					FROM Transactions t 
                    WHERE t.transaction_type ='Withdrawn';
                    
                    
		-- Trigger for automatic fraud alerts 
        
         DELIMITER $$ 
         
         CREATE TRIGGER check_larger_withdrawl
         AFTER INSERT ON Transactions 
         FOR EACH ROW 
         BEGIN 
			IF NEW.transaction_type = 'Withdrawn' AND NEW.amount > 30000 THEN 
				INSERT INTO Suspicious_Activity (transaction_id, reason)
                VALUES(NEW.transaction_id, 'Large Withdrawal above limit');
			END IF ;
		END $$
        
        DELIMITER ;
	SHOW TABLES;
    
    INSERT INTO Transactions(account_id, transaction_type,amount, location)
    VALUES(1,'Withdrawn',50000,'Kathmadnu');
	
    SELECT *FROM Transactions ;
    SELECT * FROM Suspicious_Activity  Suspicious_Activity;
    
    INSERT INTO Transactions(account_id, transaction_type, amount, location)
VALUES (1, 'Withdrawn', 50000, 'Kathmandu');



