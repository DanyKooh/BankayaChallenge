-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'GeneralDB'
)
CREATE DATABASE GeneralDB
GO

-- Create a new table called 'customer' in schema 'sales'
-- Drop the table if it already exists
IF OBJECT_ID('sales.customer', 'U') IS NOT NULL
DROP TABLE sales.customer
GO
-- Create the table in the specified schema
CREATE TABLE sales.customer
(
    customerId INT NOT NULL PRIMARY KEY, -- primary key column
    firstname NVARCHAR(50) NOT NULL,
    lastname NVARCHAR(50) NOT NULL,
    phone INT,
    curp NVARCHAR(18),
    rfc NVARCHAR(13),
    adress NVARCHAR(50)
    -- specify more columns here
);
GO

-- Create a new table called 'items' in schema 'sales'
-- Drop the table if it already exists
IF OBJECT_ID('sales.items', 'U') IS NOT NULL
DROP TABLE sales.items
GO
-- Create the table in the specified schema
CREATE TABLE sales.items
(
    itemsId INT NOT NULL PRIMARY KEY, -- primary key column
    itemname NVARCHAR(50) NOT NULL,
    itemprice FLOAT NOT NULL
    -- specify more columns here
);
GO

-- Create a new table called 'itemsbought' in schema 'sales'
-- Drop the table if it already exists
IF OBJECT_ID('sales.itemsbougth', 'U') IS NOT NULL
DROP TABLE sales.itemsbought
GO
-- Create the table in the specified schema
CREATE TABLE sales.itemsbought 
(
    itemsbought INT NOT NULL PRIMARY KEY, -- primary key column
    customerId INT NOT NULL,
    itemsId INT NOT NULL,
    ordernumber NVARCHAR(50) NOT NULL,
    fecha NVARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    comments NVARCHAR(50),
    CONSTRAINT fk_customer FOREIGN KEY (customerId) REFERENCES sales.customer (customerId),
    CONSTRAINT fk_items FOREIGN KEY (itemsId) REFERENCES sales.items (itemsId)
    -- specify more columns here
);
GO

