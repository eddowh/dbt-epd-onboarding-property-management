{{ config(
    materialized = 'incremental',
    unique_key = 'event_id',
) }}

WITH
    events AS (
        SELECT *, current_timestamp() as event_updated_at FROM {{ ref('order_events') }}
        {% if is_incremental() %}
        WHERE event_id IN (
            SELECT distinct event_id FROM {{ ref('order_events') }}
            WHERE event_timestamp >= '2019-02-01'::date
        )
        {% endif %}
    )
    , joined AS (
        SELECT *
        FROM {{ ref('orders') }} orders
        LEFT JOIN events ON ( orders.id = events.order_id )
    )

SELECT * FROM joined
