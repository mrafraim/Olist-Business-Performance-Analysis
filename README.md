# Olist E-Commerce Business Performance Analysis & Growth Strategy

**Lead Data Analyst:** Mostafizur Rahman

**Data Source:** [Olist Public E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 1. Executive Summary

This report presents the key findings from our analysis of the Olist e-commerce business data.

To conduct this analysis, we collected and organized data from multiple sources into a structured database, allowing us to accurately evaluate sales performance, customer behavior, product performance, and operational efficiency. During this process, data quality issues were identified and addressed to ensure reliable insights.

Our analysis highlights several important business findings:

* Revenue is highly concentrated among a relatively small number of products and sellers, following the common 80/20 (Pareto) pattern.
* The company maintains a healthy buffer between estimated and actual delivery times, helping ensure orders are delivered on time.
* However, delivery estimates may be more conservative than necessary, which can increase shipping expectations shown to customers during checkout.
* Longer or less competitive delivery estimates may contribute to customers abandoning their carts before completing purchases.
* The findings identify opportunities to improve customer experience, optimize delivery promises, and further increase sales performance.

Overall, this report converts raw transaction data into actionable business insights that can support better operational decisions, improve customer satisfaction, and drive future growth.


## 2. Financial Performance Baseline

To ensure accurate financial reporting, cancelled and unavailable orders were excluded from the analysis. The platform's core performance metrics are:

* **Gross Revenue:** $13.49 Million
* **Completed Orders:** 98,199
* **Average Order Value (AOV):** $137.42

### Revenue Concentration Analysis (80/20 Principle)

#### Key Finding

Although the platform offers products across **74 categories**, revenue is heavily concentrated in a small number of them.

Our analysis shows that:

* **18 categories (24% of all categories)** generate **81.26% of total revenue**.
* These categories contribute approximately **$10.96 Million** in sales.
* The remaining **56 categories** generate only **18.74% of revenue** despite representing the majority of the catalog.

This indicates that the business relies heavily on a relatively small group of high-performing categories.

| Rank | Category | Gross Revenue ($) | Cumulative Share (%) |
| --- | --- | --- | --- |
| 1 | beleza_saude (Health & Beauty) | 1,255,695.13 | 9.31% |
| 2 | relogios_presentes (Watches & Gifts) | 1,198,185.21 | 18.18% |
| 3 | cama_mesa_banho (Bed, Bath & Table) | 1,035,964.06 | 25.86% |
| 4 | esporte_lazer (Sports & Leisure) | 979,740.92 | 33.12% |
| ... | ... | ... | ... |
| 17 | pcs (Computers / Systems) | 222,963.13 | 79.68% |
| **18** | **pet_shop (Pet Supplies) [Pareto Cutoff]** | **213,766.63** | **81.26%** |
| - | Remaining 56 Categories | 2,530,111.90 | 18.74% |

### Business Impact

The data clearly shows that a small number of categories are driving the majority of the company's revenue. These categories should be treated as strategic priorities because their performance has a significant impact on overall business results.

### Recommendations

#### 1. Optimize Warehouse Operations

Place products from the top-performing categories closer to packing and shipping areas within fulfillment centers.

**Expected Benefits:**

* Faster order processing
* Reduced picker travel time
* Improved warehouse efficiency
* Faster shipment preparation

#### 2. Prioritize Marketing Investment

Focus marketing and promotional budgets on the highest-performing categories instead of distributing spending evenly across all categories.

**Expected Benefits:**

* Higher return on marketing investment (ROI)
* Increased customer acquisition in proven categories
* Stronger growth in the platform's primary revenue drivers

> #### Management Takeaway

> **Just 24% of product categories generate more than 81% of total revenue.** Protecting and growing these key categories should be a top business priority, while lower-performing categories should be reviewed for optimization, consolidation, or selective investment.

## 3. Delivery Performance & Customer Satisfaction

To evaluate delivery efficiency and customer experience, we analyzed **96,470 successfully delivered orders** and compared actual delivery times with the delivery estimates shown to customers at checkout.

### Delivery Performance Summary

* **Average Actual Delivery Time:** 12.6 days
* **Average Promised Delivery Time:** 23.7 days
* **Average Early Delivery:** 11.2 days ahead of schedule

### Key Finding

The platform consistently delivers orders much faster than promised. On average, customers receive their orders **11.2 days earlier** than the delivery estimate displayed during checkout.

While early delivery creates a positive customer experience, displaying a delivery estimate of nearly **24 days** may discourage some customers from completing their purchases. Long delivery promises can make the platform appear slower than competitors, potentially increasing cart abandonment before an order is placed.

### Delivery Time vs Customer Reviews

The analysis also shows a strong relationship between delivery speed and customer satisfaction.

| Review Score | Orders | Avg. Delivery Time (Days) | Avg. Days Early | Customer Sentiment  |
| ------------ | ------ | ------------------------- | --------------- | ------------------- |
| ⭐⭐⭐⭐⭐        | 56,810 | 10.7                      | 12.7            | Excellent           |
| ⭐⭐⭐⭐         | 18,943 | 12.3                      | 11.7            | Very Good           |
| ⭐⭐⭐          | 7,942  | 14.3                      | 10.1            | Neutral             |
| ⭐⭐           | 2,938  | 16.7                      | 7.9             | Dissatisfied        |
| ⭐            | 9,380  | 21.3                      | 3.4             | Highly Dissatisfied |

### Customer Experience Insight

Customer satisfaction remains strong when deliveries are completed within approximately **14 days**. However, ratings decline significantly as delivery times increase beyond this point.

Notably:

* Average delivery time for 5-star reviews is only **10.7 days**.
* Average delivery time for 1-star reviews rises to **21.3 days**.
* The decline in satisfaction accelerates after the **14-day mark**, indicating that delivery speed is a major driver of customer perception.

### Business Impact

Although most orders arrive earlier than promised, customers primarily judge their experience based on how long they actually wait, not how much earlier the order arrives compared to the estimate.

This means that deliveries taking more than two weeks present a higher risk of negative reviews, lower customer satisfaction, and reduced repeat purchases.

### Recommendations

#### 1. Review Delivery Promise Strategy

Consider reducing checkout delivery estimates from the current average of **23.7 days** to a more competitive range based on actual delivery performance and regional delivery history.

**Expected Benefits:**

* Improved conversion rates
* Reduced cart abandonment
* Stronger competitive positioning
* More accurate customer expectations

#### 2. Implement Delivery Risk Monitoring

Create automated alerts for orders approaching **14 days in transit** so customer service teams can proactively engage affected customers.

**Expected Benefits:**

* Reduced negative reviews
* Better customer communication
* Higher customer trust
* Improved retention and repeat purchases

> ### Management Takeaway

> The logistics network is performing well, delivering orders in an average of **12.6 days**. However, customer satisfaction declines sharply when delivery times exceed **14 days**. Improving delivery promises and proactively managing delayed orders represent significant opportunities to increase customer satisfaction, protect brand reputation, and improve conversion rates.

## 4. Data Quality & Governance

Ensuring data accuracy was a critical part of this analysis. During the project, several data quality issues were identified and addressed to improve the reliability of reporting and business insights.

### Key Data Quality Findings

#### 1. Missing Delivery Confirmation Dates

We identified **8 orders** that were marked as successfully delivered but did not contain a customer delivery confirmation date.

Further investigation showed that most of these records occurred during the same period (June–July 2018), suggesting a system synchronization or data integration issue rather than manual data entry errors.

**Action Taken:**

* These records were excluded from delivery-time calculations to prevent inaccurate performance metrics.
* The issue was documented for future system monitoring and investigation.

#### 2. Missing Product Categories

We identified **610 products** that did not have an assigned product category.

Without correction, sales generated by these products would not appear in category-level performance reports, leading to incomplete business analysis.

**Action Taken:**

* A data quality rule was implemented to automatically classify uncategorized products as **"Unassigned"**.
* This ensured that all product sales remained visible in reporting and analysis.

**Business Impact:**

* Recovered visibility for **$178,572.55** in revenue that would otherwise have been excluded from category-based reporting.

### Why This Matters

Reliable business decisions depend on reliable data. Addressing these issues improved the accuracy of revenue analysis, category performance reporting, and delivery performance metrics.

> ### Management Takeaway

> The overall data quality was strong, with only a small number of records requiring correction. By resolving these issues, we improved reporting accuracy and ensured that approximately **$178,000+ in sales** remained visible in business performance analyses. This strengthens confidence in the insights and recommendations presented throughout this report.

## 5. Future Growth Opportunities (Phase 2 Roadmap)

Phase 1 focused on establishing key business performance metrics and operational insights. The following areas are recommended for Phase 2 analysis:

### 1. Payment Behavior Analysis

**Data Source:** `olist_order_payments`

Analyze how payment methods and installment plans affect customer spending and Average Order Value (AOV).

**Opportunity:** Evaluate whether Buy Now, Pay Later (BNPL) or expanded installment options could increase sales and order values.

### 2. Seller Performance Analysis

**Data Source:** `olist_sellers`

Investigate seller-level fulfillment performance to identify the root causes of delivery delays.

**Opportunity:** Determine whether delays originate from seller operations or logistics infrastructure.

### 3. Customer & Geographic Analysis

**Data Sources:** `olist_customers`, `olist_geolocation`

Analyze customer demand across regions and identify high-growth markets.

**Opportunity:** Support decisions on future fulfillment center locations to reduce delivery times and shipping costs.

> ### Management Takeaway

> Phase 2 should focus on **customer spending behavior, seller performance, and geographic expansion opportunities** to drive revenue growth, improve operational efficiency, and strengthen customer experience.


---
<p style="text-align:center; color:skyblue; font-size:18px;">
© 2026 Mostafizur Rahman
</p>

