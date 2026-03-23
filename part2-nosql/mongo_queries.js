// Q1: Find all orders from the city of 'Mumbai'
db.orders.find({ "customer.city": "Mumbai" });

// Q2: Find all orders where the quantity of any item is greater than 3
db.orders.find({ "items.quantity": { $gt: 3 } });

// Q3: Update the customer email for a specific order (ORD1027)
db.orders.updateOne(
    { "order_id": "ORD1027" },
    { $set: { "customer.email": "priya.new@gmail.com" } }
);

// Q4: Count the total number of orders handled by sales rep 'Anita Desai'
db.orders.countDocuments({ "sales_rep.name": "Anita Desai" });

// Q5: Delete a specific order from the database
db.orders.deleteOne({ "order_id": "ORD1114" });
