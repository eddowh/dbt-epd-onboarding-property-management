{% snapshot orders_snapshot_timestamp %}

{{
    config(
      target_schema='dbt_ewhintoso_snapshots',
      strategy='timestamp',
      unique_key='id',
      updated_at='updated_at',
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('misc', 'orders') }}

{% endsnapshot %}
