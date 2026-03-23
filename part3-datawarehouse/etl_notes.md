## ETL Process (Extract, Transform, Load)

### 1. Extract
We extract raw transaction data from the `retail_transactions.csv` file. This file contains mixed date formats (e.g., `29/08/2023` and `12-12-2023`) and varying case sensitivity in categories (e.g., 'electronics' and 'Electronics').

### 2. Transform
* **Date Standardization:** We use a script to convert all dates to a standard `YYYY-MM-DD` format.
* **Data Cleaning:** We convert all categories to proper case (e.g., "Electronics") to ensure groupings are accurate.
* **Calculation:** We calculate `total_sales_amount` by multiplying `units_sold` and `unit_price`.
* **Deduplication:** We ensure each unique product and store is only listed once in their respective Dimension tables.

### 3. Load
The cleaned data is loaded into the **Star Schema**. Fact data goes into `FactSales`, and descriptive data is mapped to the `DimDate`, `DimProduct`, and `DimStore` tables via foreign keys.
