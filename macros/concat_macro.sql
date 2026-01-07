{% macro concat_macro(value1, value2) %}

  -- Ensure we are passing the values as strings into the SQL concat function
  concat('{{ value1 }}', '-', '{{ value2 }}')

{% endmacro %}