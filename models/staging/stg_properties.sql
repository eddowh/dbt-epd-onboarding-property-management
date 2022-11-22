SELECT
	*
	RENAME (id as property_id)
FROM {{ source('property_management', 'properties') }}