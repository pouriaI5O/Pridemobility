{{ config(materialized='ephemeral') }}
---calculate duration(total second)  of each id per minute--- 
select sum(t_second) as duration,
       minute,
       hour,
       Date,
       Id_Wt 
from {{ ref('int_170null_idwt')}}
group by date,hour,minute,Id_Wt