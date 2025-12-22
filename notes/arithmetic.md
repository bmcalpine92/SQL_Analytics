# Arithmetic in SQL
**Purpose:** Perform calculations on numeric data within SQL queries.

## Operators
- Addition: `+`  
- Subtraction: `-`  
- Multiplication: `*`  
- Division: `/`  

## Notes
- Parentheses `()` can be used to control the order of operations.  
- Arithmetic can be combined with aggregate functions for more complex calculations.  
- Useful for calculating revenue, discounts, averages, or ratios.

## Example
```sql
SELECT 
  (price * quantity - discount) AS net_revenue
FROM sample_dataset;
```
