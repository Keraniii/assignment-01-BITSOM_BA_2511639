## Design Justification

The transition from a single, flat Excel file to this multi-database architecture is a fundamental shift from data storage to data intelligence. While an Excel file is "simple" to start, it lacks the scalability, integrity, and analytical power required for a modern retail enterprise.

In **Part 1**, we implemented an **RDBMS** using 3NF. This was critical because, unlike a flat file, it enforces data integrity through primary and foreign keys, ensuring we never have "orphaned" orders or inconsistent customer emails. In **Part 2**, we introduced **NoSQL (MongoDB)**, which provides the schema flexibility necessary to handle a diverse product catalog that an Excel table simply cannot accommodate without hundreds of empty columns.

For high-level decision-making, we moved data into a **Data Warehouse (Part 3)** using a Star Schema. This architecture allows the business to run complex analytical queries (OLAP) across millions of rows without slowing down the live transactional system. Furthermore, by integrating a **Vector Database (Part 4)**, we unlocked AI-driven semantic search, allowing customers to find products based on intent rather than just exact keywords—a feat impossible in a traditional spreadsheet.

Finally, the **Data Lake (Part 5)** allows us to store massive amounts of raw data (CSV, JSON, and Parquet) cost-effectively. Using **DuckDB** for "in-place" querying provides the speed of a full database with the low overhead of a file system. This holistic architecture ensures our data is not just "saved," but is optimized for consistency, speed, and future AI integration.
