
/* ============================================================
   Purpose: Load raw shipment data into BigQuery
   Source: External CSV / Excel file
   Output: logistic_data.shipments_raw_table
   Notes: Raw data ingested into BigQuery from a CSV file through the BigQuery UI.
          Data is loaded without transformation to preserve source integrity.
          Used as the raw layer for downstream analytics and modeling.
   ============================================================ */

--raw data table
SELECT *
FROM `logistic_data.shipments_raw`;
