{{ config(materialized='ephemeral') }}
---source table for Status tabels(line160)---
---Extract timestamps info(date,hour,minute asn second) and rename other columns
select idline160wip as Id_Wip,
       idline160wt as Id_Wt,
       EXTRACT(HOUR FROM timestamp) AS Hour,
       EXTRACT(MINUTE FROM timestamp) AS Minute,
       EXTRACT(SECOND FROM timestamp) AS Second, 
       DATE(timestamp) as Date          
FROM {{ source('public','pridemobility_tracking_160_new') }}