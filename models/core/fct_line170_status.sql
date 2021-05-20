select Timestamps,hour,minute,date,count_person,count_wip,count_wt,
Status,Ole_Status,Utc_Timestamp,
 CASE WHEN Time>'08:10:00' and Time <'08:25:00'THEN 0
     WHEN Time >'10:45:00' and Time <'11:25:00'THEN 0
     WHEN Time >'12:50:00' and Time <'13:05:00'THEN 0
     ELSE 1 END AS Break_Filter
 from {{ ref('int_avg_ole_sta170')}} where Break_Filter>0
