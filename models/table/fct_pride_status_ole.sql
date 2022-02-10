---Creating pride mobility status table---

{{
    config(
        materialized='incremental'
    )
}}
select convert_timezone('America/New_York','America/New_York',timestamps) as local_timestamp,
       utc_timestamp,
       hour,
       minute,
       date,
       count_person,
       count_wip,
       count_wt,
       station,
       status,
       status_ole 
FROM {{ ref('int_stg_union_status')}}
order by date,hour
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where local_timestamp > (select max(local_timestamp) from {{ this }})

{% endif %}