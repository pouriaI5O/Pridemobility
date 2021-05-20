select hour,minute,Date,Id_Wip,Duration,
cast(CONCAT(Date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Timestamps,
cast(Timestamps AS time) as Time,
Timestamps AT TIME ZONE 'UTC'  AS Utc_Timestamp
from ( select Count(*) as Duration,Date,Hour,Minute,Id_Wip
from {{ ref('stg_removedublicate170_times_id')}}
       group by Id_Wip,Date,Hour,Minute
       order by Date)
       where (Time >'06:00:00' and Time <'14:30:00')
