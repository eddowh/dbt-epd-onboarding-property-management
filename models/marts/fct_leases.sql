SELECT
    lease.*
FROM
    {{ ref('stg_leases') }} lease
    INNER JOIN {{ ref('stg_units') }} unit
            ON ( lease.unit_id = unit.unit_id )
    INNER JOIN {{ ref('stg_rental_applications') }} rental_application
            ON ( lease.rental_application_id = rental_application.rental_application_id )
