# Dataset Documentation

## Dunder Mifflin Paper Sales
- **Source:** Public/mock dataset for SQL practice
- **Purpose:** Practice SELECT queries, aggregate functions, arithmetic operations, and business scenario analysis
- **Key Fields:**
  - order_id
  - purchased_at
  - status
  - cancelled_at
  - returned_at
  - product_id
  - price
  - quantity
  - discount
  - shipping_cost
  - account_id
  - account_name
  - business_size
  - payment_cycle
  - account_manager
  - days_to_close
  - shipping_mode
  - shipping_address
  - shipping_city
  - shipping_state
  - shipping_zip
  - shipping_region
  - shipping_latitude
  - shipping_longitude
  - days_to_ship
  - reviewed_at
  - rating
  - index
  - review
    
- **Used in SQL Files:**
  - `01_basic_selects.sql`
  - `02_aggregate_functions_and_arithmetic.sql`

## Inventory & Transaction Data
- **Source:** Mode Analytics tutorial datasets
- **Purpose:** Practice JOINs, set operations, and transaction analysis
- **Tables:**
  1. **Inventory Table** (`tutorial.excel_sql_inventory_data`): product-level inventory details
     - Fields: product_id, product_name, product_type, unit, price_unit, wholesale, current_inventory
  2. **Transaction Table** (`tutorial.excel_sql_transaction_data`): product-level transaction records
     - Fields: product_id, transaction_id, time

- **Relationship:** Inventory and Transaction tables are separate but related, allowing practice of joins across distinct datasets.
  
- **Used in SQL Files:**
  - `03_sql_joins.sql`
    - **Notes:** These tables are used to demonstrate INNER, LEFT, RIGHT, FULL, CROSS, and SELF joins, as well as set operations like UNION, INTERSECT, and EXCEPT.
  - `04_subqueries.sql`
