-- SQL Portfolio: Basic SELECT Queries
-- Dataset: Dunder Mifflin Paper Sales
-- Purpose: Demonstrate basic table exploration, filtering, and business insight

---------------------------------------------------

-- Question #1: What data does the table contain, and what fields are available?
SELECT *
FROM tutorial.dunder_mifflin_paper_sales
LIMIT 10;

---------------------------------------------------

-- Question #2: Count total number of sales in the dataset
SELECT
    COUNT(*) AS total_sales
FROM dunder_mifflin_paper_sales;

---------------------------------------------------

-- Question #3: List all unique account managers in the dataset
SELECT DISTINCT account_manager
FROM tutorial.dunder_mifflin_paper_sales
ORDER BY account_manager; 

---------------------------------------------------

-- Question #4: List all sales from the state of Pennslyvania
SELECT 
  account_name,
  account_manager,
  shipping_state as state,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE shipping_state = 'PA'
LIMIT 10;

---------------------------------------------------

-- Question #5: Show all sales with total_amount greater than $500
SELECT 
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount
FROM tutorial.dunder_mifflin_paper_sales
WHERE price > 500
ORDER BY price DESC;
