DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    invoice_no TEXT,
    customer_id TEXT,
    gender TEXT,
    age INTEGER,
    category TEXT,
    quantity INTEGER,
    price REAL,
    payment_method TEXT,
    invoice_date DATE,
    shopping_mall TEXT
);
