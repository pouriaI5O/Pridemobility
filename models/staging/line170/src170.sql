{{ config(materialized='ephemeral') }}
---source table for id tabels (line170)---
---Extract timestamps info(date,hour,minute and second) and rename other columns---
select   timestamp as Timestamps,
          EXTRACT(HOUR FROM timestamp) AS Hour,
          EXTRACT(MINUTE FROM timestamp) AS Minute,
          EXTRACT(SECOND FROM timestamp) AS Second, 
          DATE(timestamp) as Date,
          personline170 as Count_Person,
          line170wip as Count_Wip,
          line170wt as Count_Wt                      
FROM {{ source('public','pridemobility_tracking_170_new') }}