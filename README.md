# SQL Analytics Portfolio

## Purpose
This repository demonstrates SQL skills using multiple datasets. Queries cover basic SELECTs, aggregate functions, arithmetic calculations, joins, set operations, subqueries, and business scenario analysis. The goal is to showcase clean, well-documented SQL that answers practical business questions.

## Files
- `01_basic_selects.sql`: Simple SELECT queries exploring the dataset and retrieving sample rows using various filtering techniques and business scenario analysis.
  - Sections:
    - Database Exploration (Q1–Q3): Understanding dataset structure and sample rows.
    - Basic Filtering (Q4–Q6): Filtering with WHERE, LIMIT, and simple conditions.
    - Intermediate Filtering (Q7–Q12): Using multiple conditions, AND/OR, and sorting.
    - Business Scenarios (Q13–Q15): Answering practical business questions using SQL.
- `02_aggregate_functions_and_arithmetic.sql`: Aggregates (AVG, SUM, MIN, MAX, ROUND), arithmetic queries, and business scenario analysis.
  - Sections:
    - Aggregate Functions (Q1–Q10): Using AVG, SUM, MIN, MAX, ROUND to analyze revenue, pricing, and performance.
    - Basic Arithmetic (Q11–Q13): Revenue and per-unit calculations using +, -, *, /.
    - Business Scenarios (Q14–Q15): Analysis of top accounts and shipping performance.
- `03_sql_joins.sql`: Join operations, set operations, and business-focused analysis using inventory & transaction datasets.
  - Sections:
    - Join Operations (Q1–Q10): INNER, LEFT, RIGHT, FULL, CROSS, and SELF joins
    - Set Operations (Q11–Q14): UNION, UNION ALL, INTERSECT, EXCEPT
    - Business Scenarios (Q15–Q16): High inventory but low/no transaction activity, and transaction trends by product type.
- `04_subqueries.sql`: Practice with subqueries in SELECT, FROM, and WHERE clauses, including semi-joins and anti-joins, using inventory and transaction datasets
  - Sections:
    - Semi-Joins & Anti-Joins (Q1–Q4): Identify records that exist or don’t exist in related tables.
    - `WHERE` Subqueries (Q5–Q8): Filter rows using values derived from other queries.
    - `FROM` Subqueries (Q9–Q11): Create derived tables for aggregation and temporary result sets.
    - `SELECT` Subqueries (Q12–Q13): Return single values per row, including correlated subqueries.
    - Business Scenarios (Q14–Q15): Highlight products at risk of overstock and analyze transaction trends by product type.

## Dataset
- Dunder Mifflin Paper Sales (public/mock dataset from Mode). Includes order-level and account-level data for practicing SELECTs, aggregates, and arithmetic.
- Inventory & Transaction Data (tutorial datasets from Mode): product-level inventory and transaction records for practicing joins and set operations.

## Notes
- All queries exclude NULL values where appropriate.
- Monetary values are rounded for clarity.
- Queries are intended to demonstrate SQL syntax, business logic, and analytical thinking. Each file is structured to progress from foundational SQL concepts to more complex, business-driven analysis.
