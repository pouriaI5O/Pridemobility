{{ config(materialized='ephemeral') }}
---source table for id tabels (line160)---
---Extract timestamps info(date,hour,minute and second) and rename other columns---
select   timestamp as Timestamps,
          EXTRACT(HOUR FROM timestamp) AS Hour,
          EXTRACT(MINUTE FROM timestamp) AS Minute,
          EXTRACT(SECOND FROM timestamp) AS Second, 
          DATE(timestamp) as Date,
          personline160 as Count_Person,
          line160wip as Count_Wip,
          line160wt as Count_Wt                      
FROM {{ source('public','pridemobility_tracking_160_new') }}