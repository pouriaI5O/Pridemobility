with
WP as (select chair_id ,Date as dt1,Hour as h1,sum(duration)as du1 from {{ ref('fct_line170wip_total_id')}}
group by dt1,Hour,chair_id),
WT as (select chair_id ,Date as dt2,Hour as h2,sum(duration)as du2 from {{ ref('fct_line170wt_total_id')}} 
group by dt2,Hour,chair_id ),
WPWT as(select 
        WP.chair_id,
        WP.dt1,
        WP.h1,
        WT.chair_id as chair_id2,
        WT.dt2,
        WT.h2,
        WT.du2,
        WP.du1       
        from WP
        inner join WT 
        on (WP.dt1=WT.dt2)
        AND (WP.chair_id=WT.chair_id)
        )
 select dt2 as Date ,h2 as Hour,chair_id2 as ID,du2 as Duration,
 cast(CONCAT(dt2, ' '+CAST(h2 AS VARCHAR(2)) +':'+'00')as datetime)as Timestamps,Timestamps AT TIME ZONE 'UTC'  AS
       Utc_Timestamp
  from  WPWT where Duration>300 
