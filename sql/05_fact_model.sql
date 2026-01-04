
/* ============================================================
   Purpose: Building a fact table for shipment data
   Source: logistic_data.shipments_cleaned_table
   Output: logistic_data.shipment_fact_table
   Notes: Created a fact table for data modeling
   ============================================================ */

--Creating the fact table
CREATE OR REPLACE TABLE `logistic_data.shipment_fact_table` AS
SELECT  
        --Foreign Keys
        p.productKey,
        s.supplierKey,
        c.carrierKey,
        m.modeKey,
        r.routeKey,
        l.locationKey,
        cu.customerKey,
        q.qualityKey,

        --Measures
        sc.unitsSold,
        sc.orderQty,
        sc.revenue,
        sc.unitPrice,
        sc.shippingCost,
        sc.manufactureCost,
        sc.totalCosts,
        sc.stockLevel,
        sc.availability,
        sc.leadTimeDays,
        sc.shippingTimes,
        sc.defectionRate,
        sc.productionVolume,

        --Calculated fields
        ROUND((sc.stockLevel * sc.unitPrice), 2) AS inventoryValue,
        ROUND((sc.revenue - sc.manufactureCost - sc.shippingCost), 2) AS grossMargin,
        ROUND(SAFE_DIVIDE((sc.revenue - sc.manufactureCost - sc.shippingCost), sc.revenue), 2) AS grossMarginPct,

        --SLA join
        st.slaShipTimeTarget,
        CASE WHEN sc.shippingTimes > st.slaShipTimeTarget THEN 1 ELSE 0 END AS isLate,
        GREATEST(sc.shippingTimes - st.slaShipTimeTarget, 0) AS lateDays

FROM    `logistic_data.shipments_cleaned_table` AS sc
JOIN `logistic_data.product_dim_table` p
  ON sc.sku = p.sku

JOIN `logistic_data.supplier_dim_table` s
  ON sc.supplier = s.supplier

JOIN `logistic_data.carrier_dim_table` c
  ON sc.carrier = c.carrier

JOIN `logistic_data.transport_dim_table` m
  ON sc.transportMode = m.transportMode

JOIN `logistic_data.route_dim_table` r
  ON sc.route = r.route

JOIN `logistic_data.location_dim_table` l
  ON sc.location = l.location

JOIN `logistic_data.customer_dim_table` cu
  ON sc.customerGender = cu.customerGender

JOIN `logistic_data.quality_dim_table` q
  ON sc.inspectionResult = q.inspectionResult

LEFT JOIN `logistic_data.slatargets_table` st
  ON sc.transportMode = st.transportMode
 AND sc.carrier = st.carrier
 ;


SELECT  *
FROM    `logistic_data.shipment_fact_table`
