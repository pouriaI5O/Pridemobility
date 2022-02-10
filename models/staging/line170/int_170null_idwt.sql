{{ config(materialized='ephemeral') }}
---remove  anyNull value from waiting table (where id is null)---
select 1 as t_second,
       Id_Wt,
       Date,
       Hour,
       minute,
       second 
from {{ ref('int_id170')}}
where Id_Wt is not null 
group by Id_Wt,Date,Hour,minute,second
order by Date