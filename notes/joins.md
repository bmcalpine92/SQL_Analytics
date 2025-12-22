# Joins

**Purpose:** Combine rows from two or more tables based on related columns.

## Types of Joins
- **INNER JOIN:** Returns only rows with matching values in both tables.
- **LEFT JOIN:** Returns all rows from the left table, with NULLs for unmatched rows in the right table.
- **RIGHT JOIN:** Returns all rows from the right table, with NULLs for unmatched rows in the left table.
- **FULL JOIN:** Returns all rows from both tables, with NULLs for unmatched rows on either side.
- **CROSS JOIN:** Returns all possible combinations of rows from the two tables.
- **SELF JOIN:** Joins a table to itself to compare rows within the same table.

## Example
```sql
SELECT 
  i.product_id, 
  t.transaction_id
FROM sample_inventory_data AS i
INNER JOIN sample_transactions_data AS t
  ON i.product_id = t.product_id;
```
