SELECT
	* RENAME (id as lease_id)
FROM {{ source('property_management', 'leases') }}