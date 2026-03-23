## Anomaly Analysis

* **Insert Anomaly:** In the current flat file, to add a new product to our inventory (e.g., a "Smartwatch"), we are forced to provide an `order_id` and a `customer_id`. This means we cannot record new products in our database until someone actually buys them.
* **Update Anomaly:** Customer **Rohan Mehta (C001)** has 20 separate order rows. If Rohan updates his email address, we must manually update all 20 rows. If we miss even one row, the database becomes inconsistent, showing two different emails for the same person.
* **Delete Anomaly:** The product **"Webcam" (P006)** appears only once in the entire dataset. If that specific order is cancelled and we delete that row, we lose all record of the Webcam product, its ID, and its price from our system forever.
