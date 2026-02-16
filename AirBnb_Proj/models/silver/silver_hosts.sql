{{ config(materialized = 'incremental', unique_key = 'HOST_ID') }}

select
    HOST_ID,
    replace(HOST_NAME,' ','_') as HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    case
        when RESPONSE_RATE > 95 then 'very good'
        when RESPONSE_RATE > 80 then 'good'
        when RESPONSE_RATE > 60 then 'fair'
        else 'poor'
    end as RESPONSE_RATE_QUALITY,
    Created_At
from {{ ref('bronze_hosts') }}