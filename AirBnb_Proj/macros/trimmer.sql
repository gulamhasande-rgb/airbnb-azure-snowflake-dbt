{% macro trimmer(x, node) %}
   {{ x | trim | upper }}
{% endmacro %}