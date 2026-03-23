## RDBMS vs NoSQL Comparison

| Feature | RDBMS (PostgreSQL/MySQL) | NoSQL (MongoDB) |
| :--- | :--- | :--- |
| **Data Model** | Tables with fixed rows and columns. | Documents (JSON) with flexible fields. |
| **Schema** | Rigid (must define structure first). | Dynamic (can add fields on the fly). |
| **Relationships** | Excellent for complex joins. | Best for hierarchical or nested data. |
| **Scalability** | Vertical (faster CPU/RAM). | Horizontal (adding more servers). |

### When to use which for this project?

**Use RDBMS (Part 1) when:** The data is highly structured and financial accuracy is critical. In our `orders_flat.csv`, the relationship between a customer and their transaction is strict. RDBMS ensures that every order has a valid customer ID (referential integrity).

**Use NoSQL (Part 2) when:** The product catalog starts expanding with diverse attributes. For example, a "Laptop" has a **RAM** and **Processor** attribute, while a "Notebook" has **Paper Quality** and **Binding** attributes. In an RDBMS, this would create many empty (NULL) columns. In NoSQL, we can simply add these specific fields only to the relevant documents without affecting the rest of the database. This "schema-less" nature makes it much faster for developers to iterate on new features.
