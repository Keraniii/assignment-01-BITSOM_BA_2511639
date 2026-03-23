**##Storage Systems**

Different storage systems were selected to match the nature of each goal rather than forcing a single database to do everything poorly.

For predicting patient readmission risk, a data warehouse is used because it supports large-scale analytical queries and joins across historical patient records. This is critical for training machine learning models. A feature store is added to ensure consistent feature definitions between training and inference, reducing training-serving skew.

For allowing doctors to query patient history in plain English, the system relies on the OLTP database (PostgreSQL) as the source of truth for up-to-date patient records. The NLP system (LLM layer) translates natural language into structured queries executed against this database.

For generating monthly reports, the data warehouse is again the correct choice because it is optimized for aggregations (e.g., occupancy rates, departmental costs). Using OLTP here would be inefficient and slow.

For streaming ICU vitals, a time-series database (e.g., InfluxDB) is used because it is optimized for high-frequency, timestamped data. A streaming platform (Kafka) ensures reliable ingestion of continuous data.

A data lake is included to store raw data cheaply and flexibly before transformation, which is important for future reprocessing or model improvements.

##OLTP vs OLAP Boundary

The OLTP system ends at the PostgreSQL database, which handles real-time transactional operations such as updating patient records and retrieving individual histories.

The OLAP system begins once data is extracted into the data lake and data warehouse via ETL pipelines. From this point onward, the focus shifts from transactional consistency to analytical processing, including reporting and machine learning.

This separation is important because mixing OLTP and OLAP workloads would degrade performance. Doctors need fast, reliable access to patient records (OLTP), while analytics workloads require heavy scans and aggregations (OLAP).

##Trade-offs

A major trade-off in this design is system complexity vs scalability.

Using multiple specialized systems (data lake, warehouse, feature store, streaming engine, time-series DB) significantly improves scalability and performance. However, it introduces operational complexity, higher costs, and more points of failure.

To mitigate this, the design can:

Use managed services (e.g., managed Kafka, cloud warehouses) to reduce operational overhead
Implement strong data governance and monitoring (data quality checks, pipeline observability)
Start with a simplified version (e.g., fewer components) and evolve as scale increases

Ignoring this trade-off would either result in a system that cannot scale (too simple) or one that is unnecessarily complex for the hospital’s needs.
