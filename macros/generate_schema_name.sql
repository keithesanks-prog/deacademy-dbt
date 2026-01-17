{% macro generate_schema_name(custom_schema_name, node) -%}
<<<<<<< HEAD
    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
=======


    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}


        {{ default_schema }}


    {%- else -%}


        {{ custom_schema_name | trim }}


    {%- endif -%}


{%- endmacro %}
>>>>>>> e025dbe24f03d3f374d891327e18df0fee25e302
