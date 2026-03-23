-- 1. Create Tables
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_city VARCHAR(50)
);

CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address TEXT
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

CREATE TABLE OrderItems (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 2. Insert Sample Data (Extracted from your CSV)
INSERT INTO Customers VALUES 
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO SalesReps VALUES 
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'Bangalore Hub, Indiranagar');

INSERT INTO Products VALUES 
('P001', 'Laptop', 'Electronics', 55000.00),
('P004', 'Notebook', 'Stationery', 120.00),
('P005', 'Headphones', 'Electronics', 3200.00),
('P007', 'Pen Set', 'Stationery', 250.00),
('P009', 'Desk Chair', 'Furniture', 8500.00);

INSERT INTO Orders VALUES 
('ORD1027', '2023-11-02', 'C002', 'SR02'),
('ORD1114', '2023-08-06', 'C001', 'SR01'),
('ORD1002', '2023-01-17', 'C002', 'SR02'),
('ORD1005', '2023-05-22', 'C005', 'SR01'),
('ORD1120', '2023-12-01', 'C003', 'SR03');

INSERT INTO OrderItems VALUES 
('ORD1027', 'P004', 4),
('ORD1114', 'P007', 2),
('ORD1002', 'P005', 1),
('ORD1005', 'P001', 1),
('ORD1120', 'P009', 1);
