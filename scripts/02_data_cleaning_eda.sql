/*******************************************************************************
Script Name:  03_data_cleaning_eda.sql
Description:  Investigating data quality, missing metrics, and operational 
              timelines across the core e-commerce tables.
Author:       Mostafizur Rahman
*******************************************************************************/

-- =============================================================================
-- STEP 1: ANALYZING MISSING DELIVERY DATES BY ORDER STATUS
-- Goal: Understand if missing delivery dates represent system errors (dirty data)
--       or logical business states (e.g., a canceled order shouldn't have a delivery date).
-- =============================================================================

SELECT 
    order_status,
    COUNT(*) AS total_orders,
    
    -- COUNT(column) only counts non-null records; helps track actual completions
    COUNT(order_delivered_customer_date) AS non_null_deliveries,
    
    -- Subtracting non-null entries from total rows isolates the volume of missing data
    COUNT(*) - COUNT(order_delivered_customer_date) AS missing_delivery_dates

FROM olist_orders
GROUP BY order_status
ORDER BY missing_delivery_dates DESC;

-- =============================================================================
-- STEP 2: ISOLATING THE 8 DATA ANOMALIES
-- Goal: Extract the exact 'delivered' rows missing a customer timestamp.
--       We need to see if there is a pattern (e.g., did they all happen on the 
--       same day or during a specific system outage window?).
-- =============================================================================

SELECT 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_estimated_delivery_date
FROM olist_orders
WHERE order_status = 'delivered' 
  AND order_delivered_customer_date IS NULL;

-- =============================================================================
-- STEP 3: CATEGORICAL DATA AUDIT (PRODUCTS TABLE)
-- Goal: Identify all unique product categories, count how many products belong 
--       to each, and check for NULL or empty category names.
-- =============================================================================

SELECT 
    product_category_name,
    COUNT(*) AS total_products
FROM olist_products
GROUP BY product_category_name
ORDER BY total_products DESC;


-- =============================================================================
-- STEP 4: CLEANING MISSING PRODUCT CATEGORIES
-- Goal: Test a transformation that replaces blank/NULL category names with 
--       'unassigned'. This ensures all products can be counted in business reports.
-- =============================================================================

SELECT 
    -- COALESCE replaces a NULL value with whatever placeholder text we choose
    COALESCE(product_category_name, 'unassigned') AS cleaned_category_name,
    COUNT(*) AS total_products
FROM olist_products
GROUP BY cleaned_category_name
ORDER BY total_products DESC;