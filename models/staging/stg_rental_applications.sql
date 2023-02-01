SELECT
	*
	RENAME (id as rental_application_id)
FROM {{ source('property_management', 'rental_applications') }}