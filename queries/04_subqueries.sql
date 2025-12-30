-- SQL Portfolio: Subqueries & Semi/Anti Joins
-- Purpose: Practice subqueries in SELECT, FROM, and WHERE clauses, including semi-joins and anti-joins using inventory and transaction data.

---------------------------------------------------
-- SECTION 1: Semi-Joins & Anti-Joins via Subqueries (Q1–Q4)
---------------------------------------------------


-- Question #1: List all inventory products that appear in the transaction table.
SELECT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_inventory_data
WHERE product_id IN (
  SELECT product_id
  FROM tutorial.excel_sql_transaction_data)
ORDER BY product_id;

-- Question #2: List all product IDs that have at least one transaction, without returning transaction details.
SELECT DISTINCT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_transaction_data
WHERE product_id IN (
  SELECT product_id
  FROM tutorial.excel_sql_inventory_data)
ORDER BY product_id;

-- Question #3: Which inventory products do not appear in the transaction table?
SELECT 
  product_id,
  product_name,
  product_type
FROM tutorial.excel_sql_inventory_data
WHERE product_id NOT IN (
  SELECT product_id
  FROM tutorial.excel_sql_transaction_data)
ORDER BY product_id;

-- Question #4: Which products have inventory on hand but zero transaction records?
SELECT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_inventory_data
WHERE product_id NOT IN (
  SELECT product_id
  FROM tutorial.excel_sql_transaction_data)
ORDER BY product_id;

---------------------------------------------------
-- SECTION 2: WHERE Subqueries (Q5–Q8)
---------------------------------------------------


-- Question #5: Which products exist in the inventory table that have at least one transaction?
SELECT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_inventory_data
WHERE product_id IN (
  SELECT product_id 
  FROM tutorial.excel_sql_transaction_data);

-- Question #6: Which products in inventory have never been transacted?
SELECT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_inventory_data
WHERE product_id NOT IN (
  SELECT product_id 
  FROM tutorial.excel_sql_transaction_data);

-- Question #7: Which products have transactions after a specific date?
SELECT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_inventory_data
WHERE product_id IN (
  SELECT product_id 
  FROM tutorial.excel_sql_transaction_data
  WHERE time > '2016-01-08');

-- Question #8: Which inventory products have more than 10 transactions?
SELECT 
  product_id,
  product_name,
  product_type,
  current_inventory
FROM tutorial.excel_sql_inventory_data
WHERE product_id IN (
  SELECT product_id
  FROM tutorial.excel_sql_transaction_data
  GROUP BY product_id
  HAVING COUNT(transaction_id) > 10);

---------------------------------------------------
-- SECTION 3: FROM Subqueries (Q9–Q11)
---------------------------------------------------


-- Question #9: Create a derived table that counts transactions per product, then return only products with fewer than 5 transactions.
SELECT 
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory,
  t.transaction_count 
FROM tutorial.excel_sql_inventory_data AS i
INNER JOIN (
  SELECT 
    product_id,
    COUNT(transaction_id) AS transaction_count
  FROM tutorial.excel_sql_transaction_data
  GROUP BY product_id
  HAVING COUNT(transaction_id) <= 5) AS t
ON i.product_id = t.product_id;

-- Question #10: Calculate the average number of transactions per product.
SELECT 
    ROUND(AVG(transaction_count), 2) AS avg_transactions_per_product
FROM (
  SELECT 
    product_id,
    COUNT(*) AS transaction_count
  FROM tutorial.excel_sql_transaction_data
    GROUP BY product_id) AS t;

-- Question #11: Create a temporary result set of products with transactions, then join it back to inventory.
SELECT i.*
FROM tutorial.excel_sql_inventory_data AS i
INNER JOIN (
  SELECT DISTINCT product_id
  FROM tutorial.excel_sql_transaction_data) AS t
ON i.product_id = t.product_id;

---------------------------------------------------
-- SECTION 4: SELECT Subqueries (Q12–Q13)
---------------------------------------------------


-- Question #12: For each product, show its transaction count alongside the product name.
SELECT 
  i.product_name,
  (SELECT COUNT(transaction_id)
    FROM tutorial.excel_sql_transaction_data AS t
    WHERE t.product_id = i.product_id) AS transaction_count
FROM tutorial.excel_sql_inventory_data AS i
ORDER BY transaction_count DESC;

-- Question #13: Show each product and the maximum transaction timestamp associated with it.
SELECT 
  i.product_id,
  i.product_name,
  (SELECT MAX(time)
    FROM tutorial.excel_sql_transaction_data AS t
    WHERE i.product_id = t.product_id) AS max_timestamp
FROM tutorial.excel_sql_inventory_data AS i
ORDER BY i.product_id;

---------------------------------------------------
-- SECTION 5: Business Scenarios (Q14–Q15)
---------------------------------------------------


-- Question #14: Which products should be reviewed for overstock risk (high inventory, low transaction volume)?
SELECT 
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory,
  (SELECT COUNT(transaction_id)
  FROM tutorial.excel_sql_transaction_data AS t
  WHERE t.product_id = i.product_id) AS transaction_count
FROM tutorial.excel_sql_inventory_data AS i
WHERE i.current_inventory > (
    SELECT COUNT(t.transaction_id)
    FROM tutorial.excel_sql_transaction_data AS t
    WHERE t.product_id = i.product_id)
ORDER BY i.current_inventory DESC, transaction_count;

-- Question #15: Which product types generate the most transaction activity, based on product-level rollups?
SELECT 
  i.product_type,
  SUM(t.transaction_count) AS total_transactions
FROM tutorial.excel_sql_inventory_data AS i
INNER JOIN (
  SELECT 
    product_id,
    COUNT(transaction_id) AS transaction_count
  FROM tutorial.excel_sql_transaction_data
  GROUP BY product_id) AS t
ON i.product_id = t.product_id
GROUP BY i.product_type
ORDER BY total_transactions DESC;
