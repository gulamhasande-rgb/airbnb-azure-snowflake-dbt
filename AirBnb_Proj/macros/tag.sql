{% macro tag(x) %}
    
    case 
        when  {{x}} < 100 then 'low'
        when  {{x}} < 200 then 'medium'
        else 'high'
    end
{% endmacro %}        