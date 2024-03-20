CREATE DATABASE capstone_db;

-- Use the Database
USE capstone_db;
-- Table for Users
CREATE TABLE users (
id INT NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(250) NOT NULL,
age INT NOT NULL,
gender VARCHAR(4) NOT NULL,
state VARCHAR(100) NOT NULL,
street_address VARCHAR(250) NOT NULL,
postal_code VARCHAR (250) NOT NULL,
city VARCHAR (100) NOT NULL,
country VARCHAR(100) NOT NULL,
latitude DECIMAL(10, 8) NOT NULL,
longitude DECIMAL(10, 8) NOT NULL,
traffic_source VARCHAR(50) NOT NULL,
created_at DATETIME NOT NULL,
PRIMARY KEY (id)
);

USE capstone_db;
-- -- Table for Products
CREATE TABLE products (
id INT NOT NULL,
cost DECIMAL(10, 8) NOT NULL,
category VARCHAR(50) NOT NULL,
name VARCHAR(250) NOT NULL,
brand VARCHAR(10) NOT NULL,
retail_price DECIMAL(10, 10) NOT NULL,
department VARCHAR(10) NOT NULL,
sku VARCHAR(100) NOT NULL,
distribution_center_id INT NOT NULL,
PRIMARY KEY (id)
);

USE capstone_db;
-- Table for Orders
CREATE TABLE orders (
order_id INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
status VARCHAR(20) NOT NULL,
gender VARCHAR(4) NOT NULL,
created_at DATETIME NOT NULL,
returned_at INT NULL,
shipped_at DATETIME NOT NULL,
delivered_at INT NULL,
num_of_item INT NOT NULL,
PRIMARY KEY (order_id)
);

USE capstone_db;
-- Table for Order_Items
CREATE TABLE order_items (
id INT NOT NULL,
order_id INT NOT NULL,
user_id INT NOT NULL,
product_id INT NOT NULL,
inventory_item_id INT NOT NULL,
status VARCHAR(20) NOT NULL,
created_at DATETIME NOT NULL,
shipped_at DATETIME NULL, 
delivered_at DATETIME NULL,
returned_at DATETIME NULL,
sale_price DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (id)
);

USE capstone_db;
-- Table for Inventory_Items
CREATE TABLE inventory_items (
id INT NOT NULL,
product_id INT NOT NULL,
created_at DATETIME NOT NULL,
sold_at DATETIME NULL,
cost DECIMAL(11, 10) NOT NULL,
product_category VARCHAR(100) NOT NULL,
product_name VARCHAR(250) NOT NULL,
product_brand VARCHAR(250) NULL,
product_retail_price DECIMAL(11, 10) NOT NULL,
product_department VARCHAR(50) NULL,
product_sku VARCHAR(100) NOT NULL,
product_distribution_center_id INT NOT NULL,
PRIMARY KEY (id)
);

USE capstone_db;
-- Table for Events
CREATE TABLE events (
id INT NOT NULL,
user_id INT NULL,
sequence INT NOT NULL,
session_id VARCHAR(100) NOT NULL,
created_at DATETIME NOT NULL,
ip_address VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL,
postal_code INT NOT NULL,
browser VARCHAR(50) NOT NULL,
traffic_source VARCHAR(50) NOT NULL,
uri VARCHAR(250) NOT NULL,
event_type VARCHAR(250) NOT NULL,
PRIMARY KEY (id)
);

USE capstone_db;
-- Table for Distribution_Centers
CREATE TABLE distribution_centers (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(250) NOT NULL,
latitude DECIMAL(10, 8) NOT NULL,
longitude DECIMAL(10, 8) NOT NULL,
PRIMARY KEY (id)
);
