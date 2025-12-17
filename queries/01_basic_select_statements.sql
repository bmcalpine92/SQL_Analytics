-- SQL Portfolio: Basic SELECT Queries
-- Dataset: Dunder Mifflin Paper Sales
-- Purpose: Demonstrate basic table exploration, filtering, and business insights


---------------------------------------------------
-- SECTION 1: Dataset Exploration (Q1–Q3)
---------------------------------------------------


-- Question #1: What data does the table contain, and what fields are available?
SELECT *        -- Preview the dataset structure and sample records
FROM tutorial.dunder_mifflin_paper_sales
LIMIT 10;

---------------------------------------------------

-- Question #2: How many total sales are in the dataset?
SELECT
    COUNT(*) AS total_sales
FROM tutorial.dunder_mifflin_paper_sales;

---------------------------------------------------

-- Question #3: Which account managers are represented in the dataset?
SELECT DISTINCT account_manager       -- Retrieve a distinct list of account managers
FROM tutorial.dunder_mifflin_paper_sales
ORDER BY account_manager; 


---------------------------------------------------
-- SECTION 2: Basic Filtering (Q4–Q6)
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
SELECT 
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE status <> 'COMPLETED';         -- Includes all sales that are cancelled or returned


---------------------------------------------------
-- SECTION 3: Intermediate Filtering (Q7–Q12)
---------------------------------------------------


-- Question #7: Retrieve all orders that have a status of 'Completed' AND a price greater than 100.
SELECT
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED' AND price > 100
ORDER BY purchased_at DESC, account_manager; 

---------------------------------------------------

-- Question #8: Find all orders that were cancelled OR returned.
SELECT
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE status = 'CANCELLED' OR status = 'RETURNED'
ORDER BY purchased_at DESC, account_manager; 

---------------------------------------------------

-- Question #9: Orders where days_to_close is between 5 and 15 days.
SELECT
  account_name,
  account_manager,
  purchased_at as sale_date,
  days_to_close
FROM tutorial.dunder_mifflin_paper_sales
WHERE days_to_close BETWEEN 5 AND 15
ORDER BY days_to_close DESC, account_manager, purchased_at; 

---------------------------------------------------

-- Question #10: Find all the accounts where account_name contains 'LLC'  
SELECT account_name
FROM tutorial.dunder_mifflin_paper_sales
WHERE account_name LIKE '% LLC'
ORDER BY account_name;

---------------------------------------------------

-- Question #11: Retrieve all shipping cities that do not start with 'New'.
SELECT 
  shipping_city AS city, 
  shipping_state AS state
FROM tutorial.dunder_mifflin_paper_sales
WHERE shipping_city NOT LIKE 'New %'
ORDER BY shipping_city;

---------------------------------------------------

-- Question #12: Find all orders shipped to Pennsylvania, Ohio, and New York.
SELECT
  account_name,
  account_manager,
  shipping_state as state,
  purchased_at as sale_date,
  price as total_sale_amount,
  status
FROM tutorial.dunder_mifflin_paper_sales
WHERE shipping_state IN ('PA', 'OH', 'NY')
ORDER BY shipping_state;


---------------------------------------------------
-- SECTION 4: Business Scenarios (Q13–Q15)
---------------------------------------------------


-- Question #13: List all orders that have been reviewed.  
SELECT
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount,
  status,
  rating
FROM tutorial.dunder_mifflin_paper_sales
WHERE reviewed_at IS NOT NULL
ORDER BY rating, account_manager;

---------------------------------------------------

-- Question #14: Retreive all orders that: have a price BETWEEN 75 AND 300, were shipped to California, Oregon, and Utah, and have been reviewed.
SELECT
  account_name,
  account_manager,
  shipping_state as state,
  purchased_at as sale_date,
  price as total_sale_amount,
  rating
FROM tutorial.dunder_mifflin_paper_sales
WHERE price BETWEEN 75 AND 300
  AND shipping_state IN ('CA', 'OR', 'UT')
  AND rating IS NOT NULL
ORDER BY shipping_state, rating, account_manager;

---------------------------------------------------

-- Question #15: Identify high-value orders where: the quantity is greater than 50, a discount is applied, and the shipping method is Express'
SELECT
  account_name,
  account_manager,
  purchased_at as sale_date,
  price as total_sale_amount,
  discount,
  quantity,
  shipping_mode
FROM tutorial.dunder_mifflin_paper_sales
WHERE quantity > 50
  AND discount IS NOT NULL
  AND shipping_mode = 'EXPRESS'
ORDER BY account_manager;
