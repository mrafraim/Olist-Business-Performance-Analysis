/*******************************************************************************
Script Name:  01_schema_setup.sql
Description:  Build the database tables and relationships
Author:       Mostafizur Rahman
*******************************************************************************/

-- 1. Create Customers Table (Dimension)
CREATE TABLE olist_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

-- 2. Create Products Table (Dimension)
CREATE TABLE olist_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT, -- Keeping original dataset spelling
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- 3. Create Orders Table (Central Fact Table)
CREATE TABLE olist_orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) REFERENCES olist_customers(customer_id),
    order_status VARCHAR(30),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- 4. Create Order Items Table (Transaction Detail Fact Table)
CREATE TABLE olist_order_items (
    order_id VARCHAR(50) REFERENCES olist_orders(order_id),
    order_item_id INT,
    product_id VARCHAR(50) REFERENCES olist_products(product_id),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id) -- Composite Primary Key
);

-- 5. Create Order Payments Table (Fact Detail)
CREATE TABLE olist_order_payments (
    order_id VARCHAR(50) REFERENCES olist_orders(order_id),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10, 2)
);

-- 6. Create Order Reviews Table (Fact Detail)
CREATE TABLE olist_order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50) REFERENCES olist_orders(order_id),
    review_score INT,
    review_comment_title VARCHAR(200),
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);