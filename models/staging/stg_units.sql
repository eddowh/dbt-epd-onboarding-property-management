SELECT
	*
	RENAME (id as unit_id)
FROM {{ source('property_management', 'units') }}