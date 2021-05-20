WITH cte AS(
          select*,ROW_NUMBER() OVER(
             PARTITION BY
                 DATE,
                 Hour,
                 Minute,
                 Second
             ORDER BY 
                 DATE,
                 Hour,
                 Minute,
                 Second
        
        )cnt
         from (select         
          timestamp as Timestamps,
          EXTRACT(HOUR FROM timestamp) AS Hour,
          EXTRACT(MINUTE FROM timestamp) AS Minute,
          EXTRACT(SECOND FROM timestamp) AS Second, 
          DATE(timestamp) as Date,
          idline170wip as Id_Wip
          ,idline170wt as Id_Wt           
          from  public.pridemobility_tracking_170_new) 
)
select *from cte where cnt=1  
