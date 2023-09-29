SELECT
	*
	RENAME (id as property_id)
	, UUID_STRING() as correlation_id
FROM {{ source('property_management', 'properties') }}
