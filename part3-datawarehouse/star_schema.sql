-- 1. Create Dimension Tables
CREATE TABLE DimDate (
    date_key DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    quarter INT
);

CREATE TABLE DimProduct (
    product_key SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE DimStore (
    store_key SERIAL PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

-- 2. Create the Fact Table (The center of the star)
CREATE TABLE FactSales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_key DATE,
    product_key INT,
    store_key INT,
    customer_id VARCHAR(20),
    units_sold INT,
    unit_price DECIMAL(10, 2),
    total_sales_amount DECIMAL(12, 2),
    FOREIGN KEY (date_key) REFERENCES DimDate(date_key),
    FOREIGN KEY (product_key) REFERENCES DimProduct(product_key),
    FOREIGN KEY (store_key) REFERENCES DimStore(store_key)
);
