SELECT unit_id, rent
FROM {{ ref('stg_units') }}
WHERE rent <= 0