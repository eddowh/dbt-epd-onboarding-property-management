SELECT
	property.*
FROM
	{{ ref('stg_properties') }} property
	INNER JOIN {{ ref('stg_units') }} unit
			ON ( property.id = unit.property_id )
