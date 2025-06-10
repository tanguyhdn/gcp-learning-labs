-- Identify duplicate rows
SELECT
  COUNT(*) AS num_duplicate_rows,
  *
FROM
  `data-to-insights.ecommerce.all_sessions_raw`
GROUP BY
fullVisitorId, channelGrouping, time, country, city, totalTransactionRevenue, transactions, timeOnSite, pageviews, sessionQualityDim, date, visitId, type, 
productRefundAmount, productQuantity, productPrice, productRevenue, productSKU, v2ProductName, v2ProductCategory, productVariant, currencyCode, itemQuantity, 
itemRevenue, transactionRevenue, transactionId, pageTitle, searchKeyword, pagePathLevel1, eCommerceAction_type, eCommerceAction_step, eCommerceAction_option
HAVING
  num_duplicate_rows > 1;

  -- a query that shows total unique visitors
SELECT 
  COUNT(*) AS product_views,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM
  `data-to-insights.ecommerce.all_sessions_raw`;

-- total unique visitors by the referring site

SELECT
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  channelGrouping
FROM
  `data-to-insights.ecommerce.all_sessions`
GROUP BY
  channelGrouping
ORDER BY
  channelGrouping DESC;

-- query to list all the unique product names (v2ProductName) alphabetically

SELECT
  (v2ProductName) AS ProductName
FROM
  `data-to-insights.ecommerce.all_sessions`
GROUP BY
  ProductName
ORDER BY
  ProductName;