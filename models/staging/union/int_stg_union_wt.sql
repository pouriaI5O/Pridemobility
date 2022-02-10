{{ config(materialized='ephemeral') }}
---Union the line170 and line160 waiting
SELECT * FROM {{ ref('int_160_idwt')}}
UNION 
SELECT * FROM {{ ref('int_170_idwt')}}