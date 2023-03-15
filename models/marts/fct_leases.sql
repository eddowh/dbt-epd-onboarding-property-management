SELECT
    lease_id
    , lease.created_at
    , lease.unit_id
    , start_date::date as start_date
    , end_date::date as end_date
    , {{ days_between('start_date', 'end_date') }} as num_days
    , lease.rental_application_id
    , lease.completed
    , lease.uploaded_at
FROM
    {{ ref('stg_leases') }} lease
    INNER JOIN {{ ref('stg_units') }} unit
            ON ( lease.unit_id = unit.unit_id )
    INNER JOIN {{ ref('stg_rental_applications') }} rental_application
            ON ( lease.rental_application_id = rental_application.rental_application_id )
{{ limit_data_in_dev('lease.end_date::date', time_unit='month', time_value=1) }}
