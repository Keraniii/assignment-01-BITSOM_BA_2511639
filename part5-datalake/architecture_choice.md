## 5.2 — Storage Formats: Parquet vs. CSV

In a large-scale analytical environment, **Apache Parquet** is preferred over **CSV** for two primary technical reasons. First, Parquet is a **columnar storage format**, which enables **"column pruning."** Unlike row-based CSVs that require reading every field in a row, Parquet allows the query engine to read only the specific columns needed for a calculation. This drastically reduces disk I/O and increases query performance for data-heavy analytics.

Second, Parquet is a binary format that supports highly efficient **compression and encoding algorithms** like Snappy or Dictionary Encoding. Because data within a single column is of the same type, these algorithms can shrink the file size by up to **75% compared to a plain-text CSV**. This leads to significant savings in cloud storage costs and faster data transfer speeds when moving data across a network or between different processing engines.
