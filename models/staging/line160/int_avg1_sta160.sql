{{ config(materialized='ephemeral') }}
---take average of count column per second (we have count value per milisecond)---
select ceiling(avg(Count_Wt)) as Count_Wt,
       ceiling(avg(Count_Wip)) as Count_Wip,
       ceiling(avg(Count_Person)) as Count_Person,
       Date,
       Hour,
       Minute,
       Second 
from {{ ref('src160')}} 
group by Date,Hour,Minute,Second