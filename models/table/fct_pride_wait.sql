---Creating pride mobility waiting table---
--- using union query to merge line 160 and line 170 waiting tables---
{{ config(
    materialized='incremental'
)}}
select *,
       convert_timezone('UTC','America/New_York',utc_timestamp) as local_timestamp 
from {{ ref('int_stg_union_wt')}}
order by date,hour 
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where local_timestamp > (select max(local_timestamp) from {{ this }})

{% endif %}