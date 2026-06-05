# 📂 Raw Data Directory

To maintain a clean and lightweight code repository, the raw datasets used in this project are excluded from version control via `.gitignore`. 

To reproduce the database pipeline and run the analytical scripts, download the dataset from the official source below and place the CSV files directly into this `data/` directory.

### Data Source
* **Dataset Name:** Brazilian E-Commerce Public Dataset by Olist
* **Host Platform:** Kaggle
* **Download Link:** [Download Dataset Here](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

### Required Files for Phase 1
Ensure the following files are unzipped and saved in this folder before executing the SQL import scripts:
* `olist_customers_dataset.csv`
* `olist_orders_dataset.csv`
* `olist_products_dataset.csv`
* `olist_order_items_dataset.csv`
* `olist_order_reviews_dataset.csv`
* `olist_order_payments_dataset.csv`

### Reserved Files for Phase 2 Roadmap
The remaining schema entities are stored here for subsequent deployment phases:
* `product_category_name_translation.csv`
* `olist_sellers_dataset.csv`
* `olist_geolocation_dataset.csv`
