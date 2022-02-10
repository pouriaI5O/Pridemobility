{{ config(materialized='ephemeral') }}
---creating waiting table for line 160---
--- calculating total duration for each unique chair(daily)
select date,hour,
       min(utc_timestamp) as utc_timestamp,
       chair_id,
       sum(duration) as duration,
       station 
from  {{ ref('int_160_idwt_min' )}}  group by date,hour,chair_id,station