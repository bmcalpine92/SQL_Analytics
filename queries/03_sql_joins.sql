-- SQL Portfolio: Join Mechanics & Data Integrity
-- Dataset: Inventory & Transaction Data
-- Purpose: Demonstrate mastery of SQL joins, set operations, and business-driven analysis using multiple related tables.


---------------------------------------------------
-- SECTION 1: Join Operations (Q1–Q10)
---------------------------------------------------


-- Question #1: Which products appear in both the inventory and transaction tables?
SELECT DISTINCT 
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory
FROM tutorial.excel_sql_inventory_data AS i
INNER JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
ORDER BY i.product_id;

---------------------------------------------------

-- Question #2: How many transactions exist for each product that appears in both tables?
SELECT 
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory,
  COUNT(t.transaction_id) AS transaction_count
FROM tutorial.excel_sql_inventory_data AS i
INNER JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
GROUP BY
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory
ORDER BY transaction_count DESC;

---------------------------------------------------

-- Question #3: Which inventory products have never appeared in the transaction table?
SELECT
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory
FROM tutorial.excel_sql_inventory_data AS i
LEFT JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
WHERE t.product_id IS NULL
ORDER BY i.product_id;

---------------------------------------------------

-- Question #4: Which inventory products have low transaction activity?
SELECT 
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory,
  COUNT(t.transaction_id) AS transaction_count
FROM tutorial.excel_sql_inventory_data AS i
LEFT JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
GROUP BY
  i.product_id,
  i.product_name,
  i.product_type,
  i.current_inventory
HAVING COUNT(t.transaction_id) <= 9   -- Chosen to highlight single digit transactions. 
ORDER BY transaction_count;

---------------------------------------------------

-- Question #5: Are there any transactions referencing products missing from inventory?
SELECT
  t.product_id,
  t.transaction_id,
  t.time
FROM tutorial.excel_sql_inventory_data AS i
RIGHT JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
WHERE i.product_id IS NULL
ORDER BY t.product_id;

---------------------------------------------------

-- Question #6: How many transactions reference products that are no longer in inventory?
SELECT
  t.product_id,
  COUNT(t.transaction_id) AS transaction_count
FROM tutorial.excel_sql_inventory_data AS i
RIGHT JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
WHERE i.product_id IS NULL
GROUP BY t.product_id
ORDER BY transaction_count DESC;

---------------------------------------------------

-- Question #7: Which product IDs exist only in inventory or only in transactions?
SELECT 
  i.product_id AS inventory_product_id,
  t.product_id AS transaction_product_id,
  i.product_name
FROM tutorial.excel_sql_inventory_data AS i
FULL JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id
WHERE i.product_id IS NULL
  OR t.product_id IS NULL
ORDER BY inventory_product_id, transaction_product_id;

---------------------------------------------------

-- Question #8: How many distinct products exist in the inventory table versus the transaction table?
SELECT
  COUNT(DISTINCT i.product_id) AS inventory_product_count,
  COUNT(DISTINCT t.product_id) AS transaction_product_count
FROM tutorial.excel_sql_inventory_data AS i
FULL JOIN tutorial.excel_sql_transaction_data AS t
  ON i.product_id = t.product_id;

---------------------------------------------------

-- Question #9: Create all possible combinations of product types and transaction timestamps.
SELECT
  i.product_name,
  i.product_type,
  t.transaction_id,
  t.time
FROM tutorial.excel_sql_inventory_data AS i
CROSS JOIN tutorial.excel_sql_transaction_data AS t
WHERE i.product_type IS NOT NULL 
  AND t.time IS NOT NULL
ORDER BY i.product_name;

---------------------------------------------------

-- Question #10: Identify products with the same product type and unit but different prices.
SELECT
  i1.product_id AS product_id_1,
  i2.product_id AS product_id_2,
  i1.product_type,
  i1.unit,
  i1.price_unit AS price_1,
  i2.price_unit AS price_2
FROM tutorial.excel_sql_inventory_data AS i1
INNER JOIN tutorial.excel_sql_inventory_data AS i2
  ON i1.product_type = i2.product_type
  AND i1.unit = i2.unit
  AND i1.price_unit <> i2.price_unit
  AND i1.product_id < i2.product_id;


---------------------------------------------------
-- SECTION 2: Set Operations (Q11–Q14)
---------------------------------------------------


-- Question #11: Which product IDs appear in both datasets?


---------------------------------------------------

-- Question #12: Which products exist in inventory but have never been transacted?


---------------------------------------------------

-- Question #13: List all product IDs from both tables, including duplicates.


---------------------------------------------------

-- Question #14: List all unique product IDs across both tables.



---------------------------------------------------
-- SECTION 3: Business Scenarios (Q15–Q16)
---------------------------------------------------


-- Question #15: Which products have high inventory levels but no transaction activity?


---------------------------------------------------

-- Question #16: Which product types show the most transaction activity overall?


