WITH
    existing_ids AS (
        SELECT DISTINCT(id) FROM {{ ref('orders_snapshot_timestamp') }}
        WHERE dbt_valid_to is null  -- dbt_valid_to is filled in when `invalidate_hard_deletes=True`
    )

select snapshot.*
from
    {{ ref('orders_snapshot_timestamp') }} snapshot
    INNER JOIN existing_ids
            ON ( snapshot.id = existing_ids.id )
