{% snapshot orders_snapshot_check %}

{{
    config(
        target_schema='dbt_ewhintoso_snapshots',
        strategy='check',
        unique_key='id',
        check_cols=['status'],
    )
}}

select * from {{ source('misc', 'orders') }}

{% endsnapshot %}
