# Set Operations

**Purpose:** Combine results from two or more queries to analyze overlaps or differences.

## Types of Set Operations
- **UNION:** Returns unique rows from both queries.
- **UNION ALL:** Returns all rows from both queries, including duplicates.
- **INTERSECT:** Returns only rows that appear in both queries.
- **EXCEPT:** Returns rows from the first query that do not appear in the second query.

## Notes
- All queries must return the same number of columns with compatible data types.
- ORDER BY can be applied to the final result set.

## Example
```sql
SELECT product_id 
FROM inventory
INTERSECT
SELECT product_id 
FROM transactions;
```
