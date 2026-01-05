# Supply Chain Performance SLA-Analytics

## Business Problem
Company: NorthPeak Consumer Goods

Department: Global Supply Chain & Operations

NorthPeak Consumer Goods experienced increasing delivery delays, uneven inventory utilization, and supplier reliability concerns across its multi-route distribution network. While overall revenue and margins remained strong, leadership lacked visibility into where operational risks were concentrated, how inventory was impacting working capital, and which carriers and suppliers required immediate intervention.

The objective of this project was to provide leadership with a data-driven view of supply chain performance, identify operational bottlenecks, and recommend targeted actions to improve delivery reliability, inventory efficiency, and supplier performance without compromising revenue or margin.

## Key Findings
Delivery & SLA Performance

  - Overall on-time delivery performance was 76%, with 24% of shipments delivered late, indicating a material service-level risk.
  - Carrier B accounted for a disproportionate share of late deliveries, with late rates approaching 30%, well above acceptable SLA thresholds.
  - Air (38%) and Road (28%) transport modes exhibited the highest late delivery rates, suggesting mode-specific planning and execution issues.
  - Average delay duration was ~2 days, pointing to systemic inefficiencies rather than isolated disruptions.

### Business impact: 
> Delivery reliability, not pricing or demand, is the primary operational risk affecting customer experience and future revenue retention.

--

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

## 📊 SLA Performance Logic
> SLA performance was calculated by comparing actual shipping time against defined SLA shipping targets. Shipments delivered within the SLA threshold were marked as on-time, while others were classified as late. Additional metrics such as late shipment count and average late days were created to quantify SLA breaches and severity.

## Dashboard structure
### 📈 Power BI Dashboard Pages

Page 1 – Supply Chain Performance
 - Revenue, inventory value, gross margin KPIs
 - On-time delivery rate and late shipment count
 - Inventory risk scatter by product category
 - Late percentage by carrier

Page 2 – SLA & Delivery Analysis
 - On-time vs late shipment distribution
 - Carrier and route performance comparison
 - SLA threshold reference lines
 - Dynamic insights and executive summary

Page 3 – Cost & Profitability Analysis
 - Gross margin % by supplier
 - Revenue vs margin scatter (inventory exposure)
 - P&L waterfall (revenue → costs → margin)
 - Low-margin, high-revenue product identification

## Key insights
 - SLA performance varies significantly by carrier, indicating vendor optimization opportunities
 - Certain product categories carry higher inventory exposure with lower pricing flexibility
 - High-revenue products do not always translate to strong margins, highlighting cost inefficiencies
 - Inventory value concentration helps identify potential overstock and cash flow risks

## Repository structure
### 📦 supply-chain-performance-analytics
├── README.md

├── sql/

│   ├── 01_raw_data_load.sql

│   ├── 02_data_cleaning.sql

│   ├── 03_fact_dimension_model.sql

│   ├── 04_sla_calculations.sql

├── powerbi/

│   ├── Supply_Chain_Dashboard.pbix

│   ├── dashboard_screenshots/

├── images/

│   ├── data_model.png

│   ├── dashboard_page1.png

│   ├── dashboard_page2.png

│   ├── dashboard_page3.png
