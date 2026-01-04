# Supply-Chain-Performance-SLA-Analytics
End-to-End Data Modeling, SQL (BigQuery), and Power BI Dashboard

## 📌 Business Problem

> Supply chain leaders need visibility into delivery reliability, inventory risk, and profitability to ensure operational efficiency and meet service level agreements (SLAs).
> However, raw logistics data is often fragmented across shipments, products, suppliers, and carriers, making it difficult to identify performance gaps, cost drivers, and SLA risks in a timely manner.

## 🎯 Project Goal

> The goal of this project was to design an end-to-end analytics solution that transforms raw logistics data into actionable insights across:

  > - Delivery performance and SLA compliance
  
  > - Inventory risk and stock optimization
  
  > - Cost and profitability analysis
  
  The solution enables business stakeholders to monitor performance, identify risks, and support data-driven operational decisions.


## ❓ Key questions the project answers
  - Are shipments meeting SLA delivery targets?
  
  - Which carriers and routes contribute most to late deliveries?
  
  - Where does inventory risk exist across product categories?
  
  - Are we generating revenue efficiently relative to costs?
  
  - Which products and suppliers drive high revenue but low margins?

## Data & tools used

- Dataset: A supply chain data downloaded from Kaggle
- SQL: Google BigQuery (data cleaning, transformation, modeling)

- BI Tool: Power BI (semantic model, DAX, visualization)

- Data Modeling: Star schema (fact + dimension tables)

- Visualization: Executive dashboards, KPIs, SLA analytics

## Data modeling approach
> A star schema was designed to separate transactional shipment data from descriptive dimensions, improving performance and analytical flexibility.
- shipment_fact_table
  - Revenue, costs, inventory value
  - SLA metrics (isLate, lateDays)
  - Foreign keys (product, carrier, supplier, route, location)
- Dimension tables

  - Product
  - Supplier
  - Carrier
  - Transport mode
  - Route
  - Location
  - Quality / inspection

## Data cleaning & transformation (BigQuery SQL)
- Renamed raw columns to business-friendly camelCase naming
- Standardized numeric fields (prices, costs, percentages)
- Handled missing and inconsistent categorical values
- Created SLA logic using shipping time vs SLA target
- Derived calculated fields such as:
  - Total costs
  - Gross margin ($ and %)
  - Inventory value
  - On-time vs late shipment flags
- Built clean fact and dimension tables using CREATE OR REPLACE TABLE
> All transformations were performed in BigQuery to simulate a cloud-based analytics workflow.
