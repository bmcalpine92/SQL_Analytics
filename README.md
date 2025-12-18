# SQL Analytics Portfolio

## Purpose
This repository demonstrates SQL skills using the Dunder Mifflin Paper Sales dataset. Queries cover basic SELECTs, aggregate functions, arithmetic calculations, and business scenario analysis.

## Files
- `01_basic_selects.sql`: Simple SELECT queries exploring the dataset and retrieving sample rows using various filtering techniques and business scenario analysis
  - Sections:
    - Database Exploration (Q1–Q3): Understanding dataset structure and sample rows
    - Basic Filtering (Q4–Q6): Filtering with WHERE, LIMIT, and simple conditions
    - Intermediate Filtering (Q7–Q12): Using multiple conditions, AND/OR, and sorting
    - Business Scenarios (Q13–Q15): Answering practical business questions using SQL
- `02_aggregate_functions.sql`: Aggregates (AVG, SUM, MIN, MAX, ROUND), arithmetic queries, and business scenario analysis
  - Sections:
    - Aggregate Functions (Q1–Q10): Using SQL aggregation to answer business questions
    - Basic Arithmetic (Q11–Q13): Revenue and per-unit calculations using +, -, *, /
    - Business Scenarios (Q14–Q15): Analysis of top accounts and shipping performance

## Dataset
- Sample dataset: Dunder Mifflin Paper Sales (public/mock dataset)

## How to Run Queries
- Each `.sql` file can be executed in a SQL client connected to the dataset
- Queries assume the dataset is in the `tutorial.dunder_mifflin_paper_sales` table
- Queries include filters to handle NULL values where appropriate

## Notes
- All queries exclude NULL values where appropriate
- Monetary values are rounded for clarity
- Queries are intended to demonstrate SQL syntax, business logic, and analytical thinking
