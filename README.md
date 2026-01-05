# Supply Chain Performance SLA-Analytics

# Business Problem
Company: NorthPeak Consumer Goods

Department: Global Supply Chain & Operations

NorthPeak Consumer Goods experienced increasing delivery delays, uneven inventory utilization, and supplier reliability concerns across its multi-route distribution network. While overall revenue and margins remained strong, leadership lacked visibility into where operational risks were concentrated, how inventory was impacting working capital, and which carriers and suppliers required immediate intervention.

The objective of this project was to provide leadership with a data-driven view of supply chain performance, identify operational bottlenecks, and recommend targeted actions to improve delivery reliability, inventory efficiency, and supplier performance without compromising revenue or margin.

# Key Findings
### Delivery & SLA Performance
  - Overall on-time delivery performance was 76%, with 24% of shipments delivered late, indicating a material service-level risk.
  - Carrier B accounted for a disproportionate share of late deliveries, with late rates approaching 30%, well above acceptable SLA thresholds.
  - Air (38%) and Road (28%) transport modes exhibited the highest late delivery rates, suggesting mode-specific planning and execution issues.
  - Average delay duration was 2 days, pointing to systemic inefficiencies rather than isolated disruptions.
#### Business impact: Delivery reliability, not pricing or demand, is the primary operational risk affecting customer experience and future revenue retention.

### Cost & Profitability
  - Gross margin remained extremely strong at ~99%, confirming that pricing and cost structure are not immediate concerns.
  - Route A generated the highest revenue and margin (~$250K), making it the most strategically important route to protect.
  - Route C underperformed, generating lower margin while still consuming inventory and logistics capacity.
  - Supplier 1 contributed the highest total gross margin (~$156K) but showed recurring delivery delays.
#### Business impact: Profitability is driven by volume and operational execution, not margin optimization. Poor route and carrier performance introduces hidden financial risk.

### Inventory & Risk Exposure
  - Total inventory exposure represented 42% of revenue, indicating meaningful working capital tied up in stock.
  - Cosmetics showed the highest inventory exposure at 52% of revenue, signaling overstock risk.
  - Skincare demonstrated the strongest alignment between inventory and sales velocity, with the highest units sold and balanced stock levels.
  - Haircare held relatively high stock levels without proportional sales movement.
#### Business impact: Inventory is not optimally aligned with demand, reducing cash flexibility and increasing carrying cost risk.

### Supplier Quality & Reliability
  - Supplier 5 emerged as the highest-risk supplier, combining elevated defect rates and high late delivery days.
  - Supplier 1 showed stable quality performance but contributed to delivery delays, affecting downstream reliability.
  - Other suppliers remained largely within acceptable thresholds but require ongoing monitoring.
#### Business impact: Supplier risk is concentrated and manageable if addressed proactively. Left unaddressed, it increases rework, delays, and operational volatility.

# Recommendations
### Improve Delivery Reliability
  - Rebalance shipment volume away from Carrier B, particularly for Air and Road transport modes where late rates exceed 35%.
  - Prioritize high-value routes (Route A) for assignment to best-performing carrier–mode combinations, even at slightly higher unit cost.
  - Implement carrier SLA scorecards tracking late percentage, average delay days, and volume-weighted impact.
#### Expected outcome: An estimated 8–12% improvement in on-time delivery, reduced customer escalations, and lower expedited shipping costs.

### Optimize Inventory & Working Capital
  - Reduce cosmetics inventory by 10–15%, freeing approximately $8K–$12K in working capital based on current exposure.
  - Reallocate inventory capacity toward skincare, which shows the strongest sales velocity and lowest relative risk.
  - Reassess Route C strategy, either through logistics cost optimization or volume reduction.
#### Expected outcome: Improved cash flow, lower inventory carrying costs, and better alignment between stock and demand.

### Strengthen Supplier Risk Management
  - Place Supplier 5 under corrective action, including tighter inspection cycles and performance-based penalties tied to defects and delays.
  - Engage Supplier 1 on delivery reliability improvements, focusing on scheduling and SLA adherence rather than quality controls.
  - Maintain ongoing performance monitoring for mid-risk suppliers to prevent escalation.
#### Expected outcome: Reduced quality-related disruptions, more predictable supply timelines, and lower downstream operational risk.

# Data & tools used
- SQL: Google BigQuery (data cleaning, transformation, modeling)
- BI Tool: Power BI (semantic model, DAX, visualization)
- Data Modeling: Star schema (fact + dimension tables)
- Visualization: Executive dashboards, KPIs, SLA analytics

## Data modeling approach
A star schema was designed to separate transactional shipment data from descriptive dimensions, improving performance and analytical flexibility.
<img width="1420" height="1065" alt="{71060D27-75FF-4AA2-8286-FC8D327BE856}" src="https://github.com/user-attachments/assets/d37e5a3b-ccc0-4d97-ab9b-cd41c6bbc3c5" />


#### shipment_fact_table
  - Revenue, costs, inventory value
  - SLA metrics (isLate, lateDays)
  - Foreign keys (product, carrier, supplier, route, location)
#### Dimension tables
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
All data transformations were executed in BigQuery within the Google Cloud Platform, ensuring scalable and efficient data processing.

## 📊 SLA Performance Logic:
SLA performance was calculated by comparing actual shipping time against defined SLA shipping targets. Shipments delivered within the SLA threshold were marked as on-time, while others were classified as late. Additional metrics such as late shipment count and average late days were created to quantify SLA breaches and severity.

### Check Power BI Live reports here.
(https://app.powerbi.com/links/RCLnKloGjj?ctid=47629eaf-71cb-400a-bbb9-6403e7903aca&pbi_source=linkShare&bookmarkGuid=5fcfac57-3be7-430f-bc71-ab370fb34d14)

<img width="2399" height="1339" alt="{FB18CDED-B8DC-4550-82B1-F71F5908810D}" src="https://github.com/user-attachments/assets/735ec265-0173-4487-a2ab-b38b0c90170d" />
