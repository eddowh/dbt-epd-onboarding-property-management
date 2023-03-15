{% macro days_between(start_column, end_column) %}
datediff(day, {{start_column}}::date, {{end_column}}::date)
{%- endmacro %}
