# Source Data Description

This folder contains the source datasets for the Real-Time Customer Engagement Analytics Platform.

## Files

### customers.csv
CRM customer master data used for customer segmentation, geography-level analysis, and security filtering.

### products.csv
Product catalog data used for product interest, category-level reporting, and purchase analytics.

### campaigns.csv
Marketing campaign data used to calculate campaign engagement and conversion performance.

### support_cases.csv
Customer support data used to identify service issues, open tickets, and churn-risk indicators.

### customer_events.csv
Customer clickstream and engagement events used for real-time and near real-time analytics. This file simulates events such as page views, product views, add-to-cart actions, purchases, campaign clicks, wishlist actions, login, and logout events.

## Dataset Relationship

- customers.customer_id joins with support_cases.customer_id
- customers.customer_id joins with customer_events.customer_id
- products.product_id joins with customer_events.product_id
- campaigns.campaign_id joins with customer_events.campaign_id

## Usage in Project

These files will be loaded into Microsoft Fabric Lakehouse Bronze tables using Dataflow Gen2 or Fabric Pipelines. After ingestion, Silver tables will clean and standardize the data, and Gold tables will support Power BI reporting.
