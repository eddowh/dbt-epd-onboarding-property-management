{%- set datepart = "day" -%}
{%- set start_date = "TO_DATE('2021/01/01', 'yyyy/mm/dd')" -%}
{%- set end_date = "TO_DATE('2022/01/01', 'yyyy/mm/dd')" -%}

with
    days AS ({{ dbt_utils.date_spine(datepart, start_date, end_date) }})
    , rental_applications_created_deleted AS (
        SELECT
            created_at::date as date
            , count(rental_application_id) as created
            , count_if(deleted_at is not null) as deleted
        FROM {{ ref('stg_rental_applications') }}
        GROUP BY date ORDER BY date
    )

SELECT
    row_number() over (order by 1 asc) as day_number
    , date_day as date
    , coalesce(created, 0)
    , coalesce(deleted, 0)
FROM
    days LEFT JOIN rental_applications_created_deleted
                ON ( days.date_day = rental_applications_created_deleted.date )
