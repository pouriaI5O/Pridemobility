select hour,minute,date,count_person,count_wip,count_wt,
cast(CONCAT(date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Timestamps,
cast(Timestamps AS time) as Time,
Timestamps AT TIME ZONE 'UTC'  AS
       Utc_Timestamp,
CASE WHEN Count_Person > 0 and count_wip>0 THEN 'Productive'
     WHEN Count_Person = 0 and count_wip>0 THEN 'Unproductive'
     WHEN Count_Person > 0 and count_wip=0 THEN 'Downtime'
     ELSE 'Idle' END AS Status,
CASE WHEN Count_Person > 0 and count_wip>0 THEN 'Productive'
     ELSE 'Wast' END AS Ole_Status 
       
from
(select Date,
       Hour,
       Minute ,
       round(avg(count_person)) as Count_Person ,
       round(avg(count_wip))as Count_Wip,
       round(avg(count_wt))as Count_Wt
       from {{ ref('stg_RemoveDublicate160_times')}}
       group by Date,Hour,Minute
       order by Date )
    where (Time >'06:00:00' and Time <'14:30:00')
