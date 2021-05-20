select hour,minute,Date,Id_Wt,Duration,
cast(CONCAT(Date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Timestamps,
cast(Timestamps AS time) as Time,
Timestamps AT TIME ZONE 'UTC'  AS Utc_Timestamp
from ( select Count(*) as Duration,Date,Hour,Minute,Id_Wt
from {{ ref('stg_RemoveDublicate_times_Id160')}}
       group by Id_Wt,Date,Hour,Minute
       order by Date)
       where (Time >'06:00:00' and Time <'14:30:00')
