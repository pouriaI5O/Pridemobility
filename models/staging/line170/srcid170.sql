
{{ config(materialized='ephemeral') }}
---source table for Status tabels(line170)---
---Extract timestamps info(date,hour,minute and second) and rename other columns
select idline170wip as Id_Wip,
       idline170wt as Id_Wt,
       EXTRACT(HOUR FROM timestamp) AS Hour,
       EXTRACT(MINUTE FROM timestamp) AS Minute,
       EXTRACT(SECOND FROM timestamp) AS Second, 
       DATE(timestamp) as Date          
FROM {{ source('public','pridemobility_tracking_170_new') }}