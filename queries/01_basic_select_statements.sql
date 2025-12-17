-- SQL Portfolio: Basic SELECT Queries
-- Dataset: Dunder Mifflin Paper Sales
-- Purpose: Demonstrate basic table exploration, filtering, and business insights

---------------------------------------------------

-- Question #1: What data does the table contain, and what fields are available?
-- Preview the dataset structure and sample records
SELECT *
FROM tutorial.dunder_mifflin_paper_sales
LIMIT 10;

---------------------------------------------------

-- Question #2: How many total sales are in the dataset?
-- Count all rows to understand dataset size
SELECT
    COUNT(*) AS total_sales
FROM tutorial.dunder_mifflin_paper_sales;

---------------------------------------------------

-- Question #3: Which account managers are represented in the dataset?
-- Retrieve a distinct list of account managers
SELECT DISTINCT account_manager
FROM tutorial.dunder_mifflin_paper_sales
ORDER BY account_manager; 

---------------------------------------------------

-- Question #4: Show the 10 most recent sales from the state of Pennsylvania.
SELECT 
  account_name,
  account_manager,
  shipping_state as state,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE shipping_state = 'PA'
ORDER BY purchased_at DESC, account_name
LIMIT 10;

---------------------------------------------------

-- Question #5: Show all sales with total sale amount greater than $500.
SELECT 
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount
FROM tutorial.dunder_mifflin_paper_sales
WHERE price > 500
ORDER BY price DESC;

---------------------------------------------------

-- Question #6: Retrieve all sales records where the status is not 'COMPLETED'.
-- Includes all sales that are cancelled, returned, or have a NULL status
SELECT 
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE status <> 'COMPLETED';  
