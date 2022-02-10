{{ config(materialized='ephemeral') }}
---creating wip table for line 160---
--- add timestamps and time columns to wip table then create new timestamps column which time zone is UTC,then calculate duration of each id per hour
with cte as(select hour,
                   Date,
                   Id_Wip,
                   Duration,
                   cast(CONCAT(Date, ' '+CAST(hour AS VARCHAR(2))+':'+00) as datetime)as Timestamps,
                   cast(Timestamps AS time) as Time,
                   convert_timezone('America/New_York','UTC', Timestamps)  AS  utc_timestamp  
            from {{ ref('int_160_duration_idwip' )}})
---rename columns
select date,
       utc_timestamp,
       hour,
       Id_Wip as chair_id,
       duration,
       160 as station 
from cte order by date,hour,Id_Wip