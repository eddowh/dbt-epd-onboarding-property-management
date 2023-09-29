SELECT
	property.*
FROM
	{{ ref('stg_properties', v='2') }} property
	INNER JOIN {{ ref('stg_units') }} unit
			ON ( property.property_id = unit.property_id )
