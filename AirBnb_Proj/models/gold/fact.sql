{% set configs = [
    {
    'table': 'AIRBNB.gold.obt',
    'columns': 'gold_obt.booking_id,gold_obt.listing_id,gold_obt.host_id,gold_obt.TOTAL_AMOUNT,gold_obt.accommodates,gold_obt.bedrooms,gold_obt.bathrooms,gold_obt.price_per_night,gold_obt.response_rate',
    'alias': 'gold_obt'
    },
    {
    'table': 'AIRBNB.gold.dim_listings',
    'columns': '',
    'alias': 'dim_listings',
    'join_condition': 'gold_obt.LISTING_ID = dim_listings.LISTING_ID'
    },
    {
    'table': 'AIRBNB.gold.dim_hosts',
    'columns': '',
    'alias': 'dim_hosts',
    'join_condition': 'gold_obt.HOST_ID = dim_hosts.HOST_ID'
    }

]

%}

select 
    {{ configs[0]['columns'] }}
from 
    {% for config in configs %}
    {% if loop.first %}
        {{ config['table'] }} as {{ config['alias'] }}
    {% else %}
        left join {{ config['table'] }} as {{ config['alias'] }} on {{ config['join_condition'] }}
    {% endif %}
{% endfor %}
