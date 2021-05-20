select hour,minute,Date,Id_Wt as chair_id,Duration,
cast(CONCAT(date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Timestamps,
Timestamps AT TIME ZONE 'UTC'  AS
       Utc_Timestamp,
 CASE WHEN Time>'08:10:00' and Time <'08:25:00'THEN 0
     WHEN Time >'10:45:00' and Time <'11:25:00'THEN 0
     WHEN Time >'12:50:00' and Time <'13:05:00'THEN 0
     ELSE 1 END AS Break_Filter

 from {{ ref('int_L170_IdWt')}} where Break_Filter>0 and  Id_Wt IS NOT NULL
