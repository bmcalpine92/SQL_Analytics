# SQL Basics

## SELECT Statements
**Purpose:** Retrieve data from one or more tables.

**Basic syntax:**
```sql
SELECT column1, column2, ...
FROM table_name;
```

**Filtering**
- WHERE to restrict rows based on conditions
- Combine conditions: AND, OR
- Pattern matching: LIKE '%pattern%' or '_an%'
  - LIKE is a case-sensitive operator, while ILIKE is case-insensitive, meaning it does not differentiate between uppercase and lowercase letters. 
- Unique rows: DISTINCT

**Sorting**
- ORDER BY column, ASC or DESC
  - Defaults to ascending; use DESC for descending

**Limiting Rows**
- LIMIT n to restrict number of results

## Example
```sql
SELECT
  first_name,
  last_name
FROM sample_dataset
WHERE create_date > '2025-01-01'
ORDER BY create_date DESC
LIMIT 10;
```

