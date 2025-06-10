# Lab 01: Exploring an Ecommerce Dataset using SQL in BigQuery

This lab explores the public dataset `data-to-insights.ecommerce.all_sessions` using SQL to analyze ecommerce user behavior.

## 🎯 Objectives

By the end of the lab, you will be able to:

- Access and explore a public ecommerce dataset
- Inspect schema metadata and understand table structures
- Identify and remove duplicate records
- Write SQL queries using Standard SQL in BigQuery
- Perform analysis on product views, orders, and conversion rates
- Use `GROUP BY`, `HAVING`, `WITH`, and `CASE` clauses effectively

## 🗂 Dataset Information

- **Project**: `data-to-insights`
- **Dataset**: `ecommerce`
- **Tables**:
  - `all_sessions_raw`: Original raw dataset (contain duplicates)
  - `all_sessions`: Cleaned and deduplicated version

There are over 21 million rows in the dataset with 615 duplicate records in all_sessions_raw

## 🔍 Tasks Performed

### 1. Star the BigQuery Dataset
Star the `data-to-insights` project in the BigQuery UI to make its datasets easily accessible.

### 2. Explore Metadata and Duplicates
- Inspected `all_sessions_raw` schema and metadata
- Used SQL with `GROUP BY` and `HAVING` to identify **duplicate records**
- Verified deduplication by querying `all_sessions`

### 3. Write Basic SQL Queries
- Counted product views and unique visitors
- Listed unique product names
- Analyzed top 5 most viewed products
- Calculated average quantity per order
- Joined product views with transaction data

### 4. Advanced SQL Practice
- Computed product conversion rates
- Tracked ecommerce funnel stages with `eCommerceAction_type`
- Used `CASE` statements to label funnel stages
- Identified **abandoned carts** from high-quality sessions


## 📄 Example Queries

```sql
-- Count product views and unique visitors
SELECT
  COUNT(*) AS product_views,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM `data-to-insights.ecommerce.all_sessions`;

-- Most viewed products
SELECT
  COUNT(*) AS product_views,
  v2ProductName AS ProductName
FROM `data-to-insights.ecommerce.all_sessions`
WHERE type = 'PAGE'
GROUP BY ProductName
ORDER BY product_views DESC
LIMIT 5;
```
More SQL examples are available in queries.sql.


