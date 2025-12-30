# Subqueries

## Purpose
Document foundational knowledge of SQL subqueries, including where they are used, common patterns, and how they support analytical queries such as semi-joins and anti-joins.

---

## Definition
A **subquery** (also known as a **nested query**) is a query written inside another SQL query.  
Subqueries are used to generate intermediate results that help filter, calculate, or structure data in an outer query.

Subqueries can appear in the following clauses:
- `WHERE` clauses
- `FROM` clauses
- `SELECT` clauses

---

## When to Use Subqueries
Subqueries are useful when:
- Query logic is easier to read when broken into steps.
- Rows must be filtered using aggregated values.
- The goal is to identify whether related records exist or do not exist.
- Practicing analytical logic before introducing more complex JOIN patterns.

In many cases, subqueries can be rewritten using JOINs, but subqueries often improve clarity for exploratory analysis and learning.

---

## Subquery Placement

### WHERE Subqueries
Subqueries in the `WHERE` clause are used to filter rows based on values returned from another query.

Common use cases:
- Identifying records that exist in both tables,
- Finding records missing related data,
- Filtering using grouped or aggregated results.

Example:
```sql
WHERE product_id IN (
  SELECT product_id
  FROM transactions
)
```


### FROM Subqueries
Subqueries in the `FROM` clause create temporary result sets (derived tables) that can be queried like regular tables.

Common use cases:
- Aggregating data before joining.
- Simplifying complex calculations.
- Controlling row-level detail prior to applying JOIN logic.

Example:
```sql
FROM (
  SELECT product_id, COUNT(*) AS transaction_count
  FROM transactions
  GROUP BY product_id) AS t
```


### SELECT Subqueries
Subqueries in the `SELECT` clause return a single value per row and are typically correlated with the outer query.

Common use cases:
- Counting related records per row.
- Returning maximum or minimum related values.
- Practicing correlated subqueries.

Example:
```sql
SELECT
  product_name,
  (SELECT COUNT(*)
   FROM transactions t
   WHERE t.product_id = i.product_id) AS transaction_count
FROM inventory i;
```


### Semi-Joins
A **semi-join** returns rows from one table when a matching row exists in another table, without returning columns from the second table.

Semi-joins are commonly implemented using:
- `IN`
- `EXISTS`

Example:
```sql
WHERE product_id IN (
  SELECT product_id
  FROM transactions)
```


### Anti-Joins
An **anti-join** returns rows from one table when no matching row exists in another table.

Anti-joins are commonly implemented using:
- `NOT IN`
- `NOT EXISTS`

Example:
```sql
WHERE product_id NOT IN (
  SELECT product_id
  FROM transactions)
```

---

## Additional Notes

### Additive Joins
An **additive join** happens when a JOIN increases row counts unexpectedly, usually because of one-to-many relationships. 

Key considerations:
- JOINs can multiply rows if relationships are not carefully managed.
- Subqueries can reduce this risk by aggregating data before joining.
- Existence-based filtering can help avoid duplication.

### Data Type Consistency
- Columns compared between outer queries and subqueries should use compatible data types.
- Mismatched data types can cause errors or incorrect results.

### Correlated Subqueries
A **correlated subquery** references columns from the outer query and is evaluated once per row.

Key points:
- Proper correlation helps get the correct value for each row.
- If a correlation is missing, values might repeat or be misleading.
- Clear table aliases improve readability and correctness.

