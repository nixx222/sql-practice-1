-- Write the SQL code for the following:

      -- CREATE a table for each of the tabs in your AirTable spreadsheet for the Wix Cookie Shop store. Be sure to pay attention to the data types.

      -- INSERT at least two rows of mock data for each table.

      -- Write a command to UPDATE one of the rows of the data. Change one of the names of the cookies (you can choose the name!)

      -- Write a command to DELETE one of the rows of data. You can decide which specific row to delete.

      -- IN SQL Playground, build your database tables and be sure that they are configured properly.

  
-- Write the SQL commands to get the following insights:

    -- What are all of the products in my store that have a quantity of greater than 10 in stock?

    -- What are all of the products in my store that cost more than $5?

    -- What are all of the orders that were placed after Jan 1, 2025?

    -- What are all of the orders that have more than one item in the order?

    -- What are all of the orders that contain the product with the SKU of 001?

    -- What is the sum of all of the amount purchased by product?

-- Creating Tables

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    sku VARCHAR(10),
    name VARCHAR(50),
    price DECIMAL(5,2),
    quantity_in_stock INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- Inserting Mock Data

INSERT INTO Products (product_id, sku, name, price, quantity_in_stock)
VALUES (1, '001', 'Chocolate Chip Cookie', 4.99, 20);

INSERT INTO Products (product_id, sku, name, price, quantity_in_stock)
VALUES (2, '002', 'Oatmeal Raisin Cookie', 3.99, 5);

INSERT INTO Orders (order_id, order_date, product_id, quantity)
VALUES (1, '2025-02-15', 1, 2);

INSERT INTO Orders (order_id, order_date, product_id, quantity)
VALUES (2, '2025-03-01', 2, 1);


-- Updating Data

UPDATE Products
SET name = 'Double Chocolate Chip Cookie'
WHERE product_id = 1;


-- Deleting Data

DELETE FROM Products
WHERE product_id = 2;


-- Queries to Gather Insights

-- Products with quantity greater than 10
SELECT * FROM Products WHERE quantity_in_stock > 10;

-- Products costing more than $5
SELECT * FROM Products WHERE price > 5;

-- Orders placed after Jan 1, 2025
SELECT * FROM Orders WHERE order_date > '2025-01-01';

-- Orders with more than one item
SELECT * FROM Orders WHERE quantity > 1;

-- Orders containing product with SKU of 001
SELECT * FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE p.sku = '001';

-- Sum of all amount purchased by product
SELECT p.name, SUM(o.quantity) as total_quantity
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name;
