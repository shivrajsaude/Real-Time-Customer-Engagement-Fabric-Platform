# Data Flow

Customer Events
Campaign Data
Support Cases
        │
        ▼
Dataflow Gen2
(Ingestion)
        │
        ▼
Lakehouse Bronze
(Raw Delta Tables)
        │
        ▼
Notebook
(Data Cleansing &
Business Rules)
        │
        ▼
Lakehouse Silver
(Curated Data)
        │
        ▼
Notebook
(Business Aggregations)
        │
        ▼
Lakehouse Gold
(Customer Engagement
Campaign Performance
Support Summary)
        │
        ▼
Warehouse Views
        │
        ▼
Semantic Model
        │
        ▼
Power BI Reports

-----------------------------

Real-Time Flow

Streaming Events
        │
        ▼
Eventstream
        │
        ▼
Eventhouse (KQL Database)
        │
        ▼
KQL Queries
        │
        ▼
Real-Time Analytics