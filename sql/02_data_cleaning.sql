
/* ============================================================
   Purpose: Clean and standardize raw shipment data
   Source: logistic_data.shipments_raw
   Output: logistic_data.shipments_cleaned_table
   Notes: Handles data type standardization, null values,
          duplicates, and basic data quality rules to
          prepare data for dimensional and fact modeling
   ============================================================ */


SELECT DISTINCT `Customer demographics`
FROM  `logistic_data.shipments_raw`;

--Changing column names to camel case
CREATE OR REPLACE TABLE `logistic_data.shipments_clean` AS
SELECT
  `Product type`              AS productType,
  `SKU`                       AS sku,
  `Price`                     AS price,
  `Availability`              AS availability,
  `Number of products sold`   AS unitsSold,
  `Revenue generated`         AS revenueGenerated,
  `Customer demographics`     AS customerGender,
  `Stock levels`              AS stockLevel,
  `Lead times`                AS leadTimeDays,
  `Order quantities`          AS orderQty,
  `Shipping times`            AS shippingTimes,
  `Shipping carriers`         AS carrier,
  `Shipping costs`            AS shipCost,
  `Supplier name`             AS supplier,
  `Location`                  AS location,
  `Lead time`                 AS leadTime,
  `Production volumes`        AS productionVolume,
  `Manufacturing costs`       AS manufacturingCosts,
  `Inspection results`        AS inspectionResult,
  `Defect rates`              AS defectRate,
  `Transportation modes`      AS transportMode,
  `Routes`                    AS route,
  `Costs`                     AS totalCost

FROM `logistic_data.shipments_raw`;

SELECT  *
FROM    `logistic_data.shipments_clean`;

--Cleaning data
CREATE OR REPLACE TABLE `logistic_data.shipments_cleaned_table` AS
WITH deduped AS(
  SELECT
  *,
  ROW_NUMBER() OVER (PARTITION BY productType, sku ORDER BY sku) AS rn
  FROM `logistic_data.shipments_clean`
),
no_duplicates AS(
  SELECT  * EXCEPT(rn)
  FROM    deduped
  WHERE   rn = 1
)
SELECT  * EXCEPT(price, revenueGenerated, shipCost, manufacturingCosts, defectRate, totalCost), 
        IFNULL(ROUND(price, 2), 0) AS unitPrice,
        IFNULL(ROUND(revenueGenerated, 2), 0) AS revenue,
        IFNULL(ROUND(shipCost, 2), 0) AS shippingCost,
        IFNULL(ROUND(manufacturingCosts, 2), 0) AS manufactureCost,
        IFNULL(ROUND(defectRate, 2), 0) AS defectionRate,
        IFNULL(ROUND(totalCost, 2), 0) AS totalCosts
FROM    no_duplicates;

SELECT *
FROM  `logistic_data.shipments_cleaned_table`;

