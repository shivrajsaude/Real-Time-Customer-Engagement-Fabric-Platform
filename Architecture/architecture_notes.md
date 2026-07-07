# Real-Time Customer Engagement Analytics Platform
---
## Business Architecture
---

First, let's define what systems our platform receives data from.

Source Systems
CRM System

Contains:

Customer Profile
Customer Address
Customer Registration
Loyalty Status
E-Commerce Website

Contains:

Product Views
Search Activity
Add to Cart
Purchases
Marketing Platform

Contains:

Campaign Information
Campaign Clicks
Email Opens
Promotions
Product Catalog

Contains:

Product Details
Product Category
Product Pricing
Customer Support

Contains:

Support Tickets
Complaint Category
Resolution Status
Real-Time Customer Events

Contains streaming events:

Page View
Product View
Add to Cart
Purchase
Login
Logout
Campaign Click
Checkout
Wishlist

These will later flow through Eventstream.

---

## Business Questions

Our platform will answer questions such as:

What are customers doing right now?
Which products are trending today?
Which campaigns are generating the highest conversions?
Which customers are highly engaged?
Which customers are at risk of churn?
Which devices and channels drive the most engagement?
What is the current purchase conversion rate?
Which products are frequently added to carts but not purchased?

---

## High-Level Technical Architecture

Here's the logical flow :
                    Batch Sources
      CRM | Product | Campaign | Support
                     │
                     ▼
              Dataflow Gen2
                     │
                     ▼
           Fabric Lakehouse (Bronze)
                     │
             Fabric Notebook (PySpark)
                     │
                     ▼
           Fabric Lakehouse (Silver)
                     │
              SQL Transformation
                     │
                     ▼
             Fabric Warehouse (Gold)
                     │
              Direct Lake Semantic Model
                     │
                     ▼
                 Power BI Dashboard


──────────────────────────────────────────

              Real-Time Customer Events
                     │
                     ▼
                Eventstream
                     │
          ┌──────────┴──────────┐
          ▼                     ▼
     KQL Database          Lakehouse
          │
          ▼
   Real-Time Analytics
          │
          ▼
      Power BI Dashboard

---

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