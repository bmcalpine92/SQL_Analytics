# Aggregate Functions
**Purpose:** Calculate numeric values in SQL and summarize data across rows.

## Common Functions
- `AVG(column)` - Finds the average value of a column
- `SUM(column)` - Calculates the total sum of a column
- `MIN(column)` - Finds the smallest or earliest value
- `MAX(column)` - Finds the largest or most recent value
- `ROUND(number, decimals)` - Rounds a numeric value to a specified number of decimal places
- `COUNT(column)` - Counts non-NULL values in a column

## Notes
- NULL values are ignored in aggregate calculations.
- Use `GROUP BY` to group the aggregate result by one or more columns.
- **Filtering data:**
  - Use `WHERE` to filter rows **before** aggregation.
  - Use `HAVING` to filter aggregated results **after** aggregation.

## Example
```sql
SELECT 
  account_name, 
  SUM(price * quantity) AS total_revenue
FROM sample_dataset
GROUP BY account_name
HAVING SUM(price * quantity) > 1000;
```
