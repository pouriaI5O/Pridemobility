--- using union query to merge line 160 and line 170 status tables---
{{ config(materialized='ephemeral') }}
SELECT hour,
                    minute,
                    date,
                    count_wt,
                    count_person,
                    count_wip,
                    station,
                    utc_timestamp,
                    status,
                    ole_status as status_ole,
                    timestamps 
             FROM {{ ref('int_avg_ole_sta160')}}
UNION 
             SELECT hour,
                    minute,
                    date,
                    count_wt,
                    count_person,
                    count_wip,station,
                    utc_timestamp,
                    status,
                    ole_status as status_ole,
                    timestamps 
              FROM {{ ref('int_avg_ole_sta170')}}

