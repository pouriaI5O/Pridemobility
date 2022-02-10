{{ config(materialized='ephemeral') }}
---calculation duration(total seconds)  of each id per minute--- 
select sum(t_second) as duration,
       hour,
       Date,
       Id_Wip
from {{ ref('int_160null_idwip')}}
group by date,hour,Id_Wip