## Vector Search

In a **traditional SQL database**, searching is done via "exact matches" or keywords. If you search for "computer," SQL looks for that specific string. It wouldn't necessarily find a "laptop" unless you specifically told it to.

A **Vector Database** finds "similar" items by converting text into numerical coordinates (vectors). Items with similar meanings are placed close together in a multi-dimensional space. 

**Example from `orders_flat.csv`:**
If a user searches for "office supplies," a traditional SQL query `WHERE product_name LIKE '%office supplies%'` would return zero results because that specific phrase isn't in our CSV. However, a Vector DB would recognize that **"Notebook"** and **"Pen Set"** are semantically related to "office supplies" and rank them as highly similar, even though the words are completely different.
