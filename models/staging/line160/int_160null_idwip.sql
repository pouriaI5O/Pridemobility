{{ config(materialized='ephemeral') }}
---remove Null value from wip table (where id is null)---
select 1 as t_second,
       Id_Wip,
       Date,
       Hour,
       minute,
       second 
from {{ ref('int_id160')}}
where Id_Wip is not null 
group by Id_Wip,Date,Hour,minute,second
order by Date