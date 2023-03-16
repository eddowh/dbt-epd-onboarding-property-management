{{ config (
    materialized="table"
)}}

with
    dates AS ({{
        dbt_utils.date_spine(
            datepart="day",
            start_date="'2023-01-01'::date",
            end_date="'2024-01-01'::date",
        )
    }})

select
    row_number() over (order by 1 asc) as day
    , *
from dates
