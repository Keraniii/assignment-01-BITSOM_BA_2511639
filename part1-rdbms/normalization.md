## Anomaly Analysis

* **Insert Anomaly:** We cannot add a new Sales Representative (e.g., "Arjun Mehta") to the system unless they have already placed an order. The `orders_flat.csv` requires an Order ID for every row, so a sales rep without a sale cannot exist in the database.
* **Update Anomaly:** If customer "Suresh Kumar" changes his phone number, we must find every single row where he has placed an order and update the number in each one. If he has 50 orders and we miss one row, the database will have conflicting contact information.
* **Delete Anomaly:** If we delete the only order placed for a "Limited Edition Gold Watch," we accidentally delete the product's price and description from our records entirely, as that information only exists within the order rows.

## Normalization Justification

The argument that a single flat table is "simpler" is a common misconception that prioritizes short-term ease of setup over long-term data integrity. While a single table like `orders_flat.csv` allows for quick data entry, it introduces significant risks as the business scales.

Normalization to Third Normal Form (3NF) is essential for three primary reasons. First, it eliminates **redundancy**. In the flat file, customer names and addresses are repeated for every transaction, wasting storage space. Second, it ensures **data integrity**. By separating Customers, Products, and Orders into their own tables, we ensure that a change to a customer's address happens in exactly one place, preventing the "Update Anomaly" where different orders show different addresses for the same person. 

Third, it allows for **independent data management**. We can add a new product to our catalog or hire a new sales representative without needing a dummy transaction to "anchor" that data. This modular approach makes the database more flexible, easier to query, and less prone to the accidental loss of data during deletions. For a retail company, 3NF is not over-engineering; it is the foundation of a reliable system.
