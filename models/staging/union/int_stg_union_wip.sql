{{ config(materialized='ephemeral') }}
---Union the line170 and line160 wip----
SELECT * FROM {{ ref('int_160_idwip')}}
UNION 
SELECT * FROM {{ ref('int_170_idwip')}}