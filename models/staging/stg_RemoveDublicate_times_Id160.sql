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
          idline160wip as Id_Wip
          ,idline160wt as Id_Wt           
          FROM {{ source('public','pridemobility_tracking_160_new') }})  
)
select *from cte where cnt=1  
