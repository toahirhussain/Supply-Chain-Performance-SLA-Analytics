
/* ============================================================
   Purpose: Build SLA target metrics for shipment performance
   Source: logistic_data.shipments_cleaned_table
   Output: logistic_data.slatargets_table
   Notes: Calculates median and p75 shipping time, average cost,
          and defines SLA shipping time targets by carrier
          and transport mode
   ============================================================ */


--Creating a SLA table
CREATE OR REPLACE TABLE `logistic_data.slatargets_table` AS
SELECT
  transportMode,
  carrier,
  APPROX_QUANTILES(shippingTimes, 2)[OFFSET(1)] AS medianShipTime,
  APPROX_QUANTILES(shippingTimes, 4)[OFFSET(3)] AS p75ShipTime,
  ROUND(AVG(shippingCost), 2) AS avgShipCost,
  APPROX_QUANTILES(shippingTimes, 2)[OFFSET(1)] + 1 AS slaShipTimeTarget
FROM  `logistic_data.shipments_cleaned_table`
GROUP BY transportMode, carrier;

select * from `logistic_data.shipments_cleaned_table`;
