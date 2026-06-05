# Olist E-Commerce Ecosystem Optimization

**Lead Data Analyst:** Mostafizur Rahman

**Project Stage:** Phase 1

**Data Source:**[Olist Public E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 1. Executive Summary

This comprehensive performance report marks the completion of the baseline analytics audit for the Olist e-commerce ecosystem. By engineering an end-to-end relational data pipeline from fragmented source files into structured relational database environments, we isolated crucial technical anomalies, stabilized catalog metadata, and generated high-impact operational KPIs.

The objective of this analysis is to transform raw, transaction-level metrics into a definitive business strategy. The analysis reveals a highly concentrated revenue structure matching standard Pareto conditions alongside an operational shipping paradigm characterized by significant margin cushions but vulnerable to checkout cart abandonment due to over-conservative predictive algorithms.

## 2. Pillar 1: Financial Performance Baseline

To protect accounting integrity, global baselines were computed by filtering out non-transactional and non-realized order states (such as canceled and unavailable orders). The platform performance baseline is established as follows:

* **Gross Revenue:** $13,494,400.74
* **Successful Orders:** 98,199
* **Average Order Value (AOV):** $137.42

### Market Concentration Analysis (The 80/20 Rule)

* **The Situation:** The platform sells products across 74 different categories. Managing marketing budgets and warehouse space across that many departments is incredibly expensive and inefficient if some categories aren't selling well.
* **The Analysis:** By writing advanced ranking formulas, we discovered that **just 18 core categories (24% of the catalog) generate 81.26% of gross marketplace revenue ($10.96 Million).** The remaining 56 categories are a "long tail" of low-velocity items that take up space but contribute less than 19% of total revenue.

| Rank | Product Category Name (Raw) | Gross Revenue ($) | Cumulative Share (%) |
| --- | --- | --- | --- |
| 1 | beleza_saude (Health & Beauty) | 1,255,695.13 | 9.31% |
| 2 | relogios_presentes (Watches & Gifts) | 1,198,185.21 | 18.18% |
| 3 | cama_mesa_banho (Bed, Bath & Table) | 1,035,964.06 | 25.86% |
| 4 | esporte_lazer (Sports & Leisure) | 979,740.92 | 33.12% |
| ... | ... | ... | ... |
| 17 | pcs (Computers / Systems) | 222,963.13 | 79.68% |
| **18** | **pet_shop (Pet Supplies) [Pareto Cutoff]** | **213,766.63** | **81.26%** |
| - | Remaining 56 Long-Tail Categories | 2,530,111.90 | 18.74% |

* **The Strategic Recommendation:**
1. **Warehouse Layout Realignment:** Move these top 18 high-velocity categories to the front of the fulfillment centers (Zone-A racking) right next to the packing stations. This will drastically shorten walking distances for warehouse pickers and speed up packing times.
2. **Marketing Capital Allocation:** Stop spreading advertisement spending evenly across the entire catalog. Pivot the budget to aggressively focus on customer acquisition and retention within the top 5 flagship categories (like Health & Beauty and Watches) to protect and scale our primary revenue engine.

## 3. Pillars 2 & 3: Logistics Velocity & Customer Sentiment Intersection

An operational evaluation was performed across 96,470 validated deliveries to track exact transit durations against user-facing expectations established at checkout.

* **Avg. Actual Transit:** 12.6 Days
* **Avg. Promised Window:** 23.7 Days
* **Avg. Early Arrival Cushion:** 11.2 Days

### Shipping Velocity vs. Customer Sentiment

* **The Situation:** To protect against unexpected delays, our platform's checkout screen quotes a highly conservative delivery estimate of **23.7 days**. In reality, our logistics network delivers packages in an average of **12.6 days**—meaning orders arrive **11.2 days early**.
* **The Analysis:** While arriving early creates a great "surprise" experience, a 24-day shipping promise at checkout scares away potential buyers, causing massive shopping cart abandonment. Furthermore, looking at our customer reviews reveals a strict emotional breaking point: **customer patience drops off a cliff after 14 days in transit.** When a delivery stretches to 21.3 days, a 1-star review is practically guaranteed, completely destroying customer retention.

| Review Score | Volume (Orders) | Avg. Actual Transit (Days) | Avg. Days Ahead of Promised Schedule | Sentiment Status |
| --- | --- | --- | --- | --- |
| ⭐⭐⭐⭐⭐ | 56,810 | 10.7 | +12.7 | 😍 Excellent Compliance |
| ⭐⭐⭐⭐ | 18,943 | 12.3 | +11.7 | 🙂 High Compliance |
| ⭐⭐⭐ | 7,942 | 14.3 | +10.1 | 😐 Moderate Risk |
| ⭐⭐ | 2,938 | 16.7 | +7.9 | 🙁 High Degradation |
| ⭐ | 9,380 | 21.3 | +3.4 | 🤬 Severe Brand Damage |

> **Critical Finding:** 1-star reviews outnumber 2-star and 3-star reviews combined. The drop-off in customer sentiment is not linear. Once transit times cross the 14-day threshold, customer tolerance drops off entirely. A package taking 21.3 days triggers severe brand damage, even if it technically lands within the original over-conservative estimated window.

* **The Strategic Recommendation:**
1. **Algorithmic Calibration (The Sweet Spot):** Compress the public checkout delivery estimate down to a dynamic **14 to 15-day window**. This immediately makes our storefront highly competitive (reclaiming abandoned shopping carts) while still keeping a safe 2.4-day operational cushion above our actual 12.6-day delivery average.
2. **Proactive CRM Alerts:** Program an automated system alert that flags any order hitting day 14 in transit. This allows the customer service team to step in, proactively communicate delays, and issue a discount voucher *before* the customer gets angry and leaves a damaging 1-star review.

## 4. Technical Data Governance & Quality Logs

To ensure this pipeline remains production-grade, two core architectural transformations were written into the codebase to mitigate structural data errors:

* **Delivery Timestamp Gaps (8 Records):** Identified 8 orders explicitly flagged as "delivered" that lacked customer-receipt timestamps. Root-cause analysis isolated temporal clustering (75% occurred between June and July 2018), confirming an API sync or ERP connection error rather than manual typing mistakes.
*Action Taken:* Programmatically excluded from delivery latency calculations to avoid formula syntax errors.
* **Product Catalog Anomalies (610 Records):** Identified 610 inventory products lacking category designations. Left unaddressed, these items drop off categorical sales indices.
*Action Taken:* Implemented a SQL `COALESCE` fallback filter to dynamically re-index items as `'unassigned'`, recovering visibility for $178,572.55 in revenue.

## 5. Strategic Growth Horizon (Phase 2 Roadmap)

To maintain strict data governance boundaries and prevent scope creep, specific database entities were left untouched during Phase 1. These elements are mapped out below as part of the strategic Phase 2 platform deployment roadmap:

1. **`olist_order_payments` (Affordability Analytics):** Evaluate correlation between installment use and AOV. Determine if adding Buy-Now-Pay-Later options can expand customer order size.
2. **`olist_sellers` (Supply Chain Bottleneck Isolation):** Determine whether fulfillment delays stem from regional seller backlogs or carrier infrastructure deficits.
3. **`olist_customers` & `olist_geolocation` (Spatial Expansion Strategies):** Model regional customer demand clusters to recommend optimal geographic points for building physical fulfillment centers.
