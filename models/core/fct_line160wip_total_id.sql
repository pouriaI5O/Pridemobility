select hour,minute,Date,Id_Wip as chair_id,Duration,
 CASE WHEN Time>'08:10:00' and Time <'08:25:00'THEN 0
     WHEN Time >'10:45:00' and Time <'11:25:00'THEN 0
     WHEN Time >'12:50:00' and Time <'13:05:00'THEN 0
     ELSE 1 END AS Break_Filter
  ,cast(CONCAT(date, ' '+CAST(hour AS VARCHAR(2))+':'+CAST(minute AS VARCHAR(2))) as datetime)as Local_Timestamp,
 DATEADD(HOUR, +4, Local_Timestamp) as  Utc_Timestamp
          
 from {{ ref('int_l160_idwip')}} where Break_Filter>0 and  chair_id IS NOT NULL
