{% macro limit_data_in_dev(column, time_unit='day', time_value=1) %}
{% if target.name == 'dev' %}
WHERE {{ column }} >= DATEADD({{ time_unit }}, -{{ time_value }}, current_timestamp)
{% endif %}
{%- endmacro %}
