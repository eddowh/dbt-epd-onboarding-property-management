SELECT
    rental_application_id
    {% set statuses = ['approved', 'denied', 'converted_to_tenant'] %}
    {% for status in statuses %}
    , MAX(CASE WHEN status = '{{ status }}' THEN uploaded_at ELSE null END) as {{status}}_at
    {% endfor %}
FROM
    {{ ref("stg_rental_applications") }}
GROUP BY 1
