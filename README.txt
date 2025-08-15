# Lab 2(Take Home Activity) – SQL Stored Procedures and Cursors

## Steps to Execute

1. Open MySQL Workbench and connect to your MySQL server.

2. Create the database and use it:
   CREATE DATABASE lab2;
   USE lab2;

3. Create tables and populate them;
    - Table structure
        CREATE TABLE Shows (
            ShowID INT PRIMARY KEY,
            Title VARCHAR(100),
            Genre VARCHAR(50),
            ReleaseYear INT
        );
        CREATE TABLE Subscribers (
            SubscriberID INT AUTO_INCREMENT PRIMARY KEY,
            SubscriberName VARCHAR(100),
            SubscriptionDate DATE
        );
        CREATE TABLE WatchHistory (
            HistoryID INT PRIMARY KEY,
            ShowID INT,
            SubscriberID INT,
            WatchTime INT, -- Duration in minutes
            FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
            FOREIGN KEY (SubscriberID) REFERENCES
            Subscribers(SubscriberID)
        );

4. For each .sql file (q1.sql, q2.sql, q3.sql, q4.sql, q5.sql):
   - Go to File → Open SQL Script
   - Select the file
   - Execute it to store the procedure.

5. Test each procedure:
   CALL ListAllSubscribers();
   CALL GetWatchHistoryBySubscriber(1);
   CALL AddSubscriberIfNotExists('<Subscriber_Name>');
   CALL SendWatchTimeReport();
   CALL ListAllSubscribersWatchHistory();

## Git Repository Link
https://github.com/SohailTSM/2025201075_lab2

