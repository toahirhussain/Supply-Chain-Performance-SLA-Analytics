
/* ============================================================
   Purpose: Build dimension table for shipment attributes
   Source: logistic_data.shipments_cleaned_table
   Output: logistic_data.dim_shipments
   Notes: Creates a descriptive dimension to support
          analytical joins with fact tables, including
          carrier, transport mode,supplier,route, 
          location, customer, quality and product attributes
   ============================================================ */


--Creating product dimension table
CREATE OR REPLACE TABLE `logistic_data.product_dim_table` AS
SELECT
  DENSE_RANK() OVER (ORDER BY sku) as productKey,
  sku,
  productType,
  unitprice
FROM(
  SELECT DISTINCT sku, productType, unitPrice
  FROM  `logistic_data.shipments_cleaned_table`
);


--Creating supplier dimension table
CREATE OR REPLACE TABLE `logistic_data.supplier_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY supplier) AS supplierKey,
  supplier
FROM(
  SELECT DISTINCT supplier
  FROM `logistic_data.shipments_cleaned_table`
);



--creating dimension carrier table
CREATE OR REPLACE TABLE `logistic_data.carrier_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY carrier) AS carrierKey,
  carrier
FROM(
  SELECT  DISTINCT carrier
  FROM    `logistic_data.shipments_cleaned_table`
);


--creating dimension table for transportation mode
CREATE OR REPLACE TABLE `logistic_data.transport_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY transportMode) AS modekey,
  transportMode
FROM(
  SELECT   DISTINCT transportMode
  FROM    `logistic_data.shipments_cleaned_table`
);


--creating dimension table for route
CREATE OR REPLACE TABLE `logistic_data.route_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY route) AS routeKey,
  route
FROM(
  SELECT DISTINCT route
  FROM   `logistic_data.shipments_cleaned_table`
);


--creating dimension table for location
CREATE OR REPLACE TABLE `logistic_data.location_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY location) AS locationKey,
  location
FROM(
  SELECT DISTINCT location
  FROM   `logistic_data.shipments_cleaned_table`
);


--creating dimension table for customer
CREATE OR REPLACE TABLE `logistic_data.customer_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY customerGender) AS customerKey,
  customerGender
FROM(
  SELECT DISTINCT customerGender
  FROM   `logistic_data.shipments_cleaned_table`
);


--Creating dimension table for quality
CREATE OR REPLACE TABLE `logistic_data.quality_dim_table` AS
SELECT
  DENSE_RANK() OVER(ORDER BY inspectionResult) AS qualityKey,
  inspectionResult
FROM(
  SELECT DISTINCT inspectionResult
  FROM   `logistic_data.shipments_cleaned_table`
);

