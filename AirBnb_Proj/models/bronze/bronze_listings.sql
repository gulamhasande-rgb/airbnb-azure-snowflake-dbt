{{ config( materialized = 'incremental' ) }}

select * from {{ source('staging','listings') }}

{% if is_incremental() %}
   where Created_At > (select coalesce(max(Created_At),'1900-01-01') from {{ this }})
{% endif %}