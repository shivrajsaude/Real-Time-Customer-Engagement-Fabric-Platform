# Real-Time Customer Engagement Analytics Platform
---
# Business Architecture

First, let's define the systems from which our platform receives data.

## Source Systems

### CRM System

Contains:

- Customer Profile
- Customer Address
- Customer Registration
- Loyalty Status

---

### E-Commerce Website

Contains:

- Product Views
- Search Activity
- Add to Cart
- Purchases

---

### Marketing Platform

Contains:

- Campaign Information
- Campaign Clicks
- Email Opens
- Promotions

---

### Product Catalog

Contains:

- Product Details
- Product Category
- Product Pricing

---

### Customer Support

Contains:

- Support Tickets
- Complaint Category
- Resolution Status

---

### Real-Time Customer Events

Contains streaming events:

- Page View
- Product View
- Add to Cart
- Purchase
- Login
- Logout
- Campaign Click
- Checkout
- Wishlist

These events will later be processed through **Microsoft Fabric Eventstream**.

---

# Business Questions

The platform is designed to answer the following business questions:

- What are customers doing right now?
- Which products are trending today?
- Which marketing campaigns generate the highest conversions?
- Which customers are highly engaged?
- Which customers are at risk of churn?
- Which channels drive the highest engagement?
- What is the current purchase conversion rate?
- Which products are frequently added to carts but not purchased?
---

# High-Level Technical Architecture

The platform combines **batch data processing** and **near real-time analytics** within Microsoft Fabric.

## Batch Data Processing

```text
CRM System
      │
Product Catalog
      │
Marketing Campaigns
      │
Customer Support
      │
      ▼
Dataflow Gen2
      │
      ▼
Lakehouse (Bronze)
      │
      ▼
Fabric Notebook (PySpark)
      │
      ▼
Lakehouse (Silver)
      │
      ▼
SQL Transformation
      │
      ▼
Fabric Warehouse (Gold)
      │
      ▼
Direct Lake Semantic Model
      │
      ▼
Power BI Dashboard
```

---

## Real-Time Data Processing

```text
Customer Website Events
(Page View, Add to Cart, Purchase, Login)

                │
                ▼
          Eventstream
           ┌─────────────┐
           │             │
           ▼             ▼
    KQL Database    Lakehouse
           │
           ▼
 Real-Time Analytics
           │
           ▼
    Power BI Dashboard
```

## Why this architecture?

Every service has a specific purpose:

| Service        | Why we're using it                                        |
| -------------- | --------------------------------------------------------- |
| Dataflow Gen2  | Low-code ingestion from batch sources                     |
| Lakehouse      | Delta storage following Medallion Architecture            |
| Notebook       | Data cleansing and business transformations using PySpark |
| Warehouse      | Curated business reporting layer                          |
| Eventstream    | Near real-time event ingestion                            |
| KQL Database   | Fast analytics on streaming events                        |
| Semantic Model | Business-friendly data model                              |
| Power BI       | Reporting and dashboards                                  |
| OneLake        | Unified storage layer                                     |
| Monitoring Hub | Operational monitoring and troubleshooting                |

---

## What I will create in Fabric

Our workspace will contain:

| Item            | Name                                |
| --------------- | ----------------------------------- |
| Workspace       | CustomerEngagement-Fabric-Workspace |
| Lakehouse       | lh_customer_engagement              |
| Warehouse       | wh_customer_engagement              |
| Dataflow Gen2   | df_customer_ingestion               |
| Pipeline        | pl_customer_engagement              |
| Notebook        | nb_bronze_to_silver                 |
| Eventstream     | es_customer_events                  |
| KQL Database    | kql_customer_events                 |
| Semantic Model  | sm_customer_engagement              |
| Power BI Report | Customer Engagement Dashboard       |

---

# Author

**Shivraj Saude**

Azure Data Engineer

Microsoft Certified: Fabric Data Engineer Associate (DP-700)

Databricks Certified Data Engineer Associate

---