## Anomaly Analysis

* **Insert Anomaly:** In the current flat file, to add a new product to our inventory (e.g., a "Smartwatch"), we are forced to provide an `order_id` and a `customer_id`. This means we cannot record new products in our database until someone actually buys them.
* **Update Anomaly:** Customer **Rohan Mehta (C001)** has 20 separate order rows. If Rohan updates his email address, we must manually update all 20 rows. If we miss even one row, the database becomes inconsistent, showing two different emails for the same person.
* **Delete Anomaly:** The product **"Webcam" (P006)** appears only once in the entire dataset. If that specific order is cancelled and we delete that row, we lose all record of the Webcam product, its ID, and its price from our system forever.




## Normalization Justification

While keeping all data in one table might seem "simpler" for initial data entry, it is a dangerous strategy for any growing business. Refuting the manager's position is necessary because the flat file architecture lacks **data integrity**.

For example, our dataset shows that **Rohan Mehta** has multiple orders. In a flat file, his name and city are duplicated across 20 rows. This redundancy doesn't just waste storage; it creates a massive maintenance burden. If he moves to a different city, an "Update Anomaly" occurs where we might update 19 rows but forget one, leaving the database in a "half-true" state. Furthermore, our "Webcam" product only exists because of a single transaction. A "Delete Anomaly" would mean that losing that transaction deletes our knowledge of that product's existence entirely.

By normalizing to **3NF**, we follow the rule of **"One Fact in One Place."** We store customer details once, product details once, and sales rep details once. This structure allows us to scale, hiring new reps or adding new products (avoiding "Insert Anomalies") without needing fake transactions to hold the data. In short, normalization is not over-engineering; it is the essential blueprint for a reliable and professional data system.
