
{{
config(
materialized = 'ephemeral',
)
}}

with bookings as(
    select 
        BOOKING_ID,
        BOOKING_DATE,
        BOOKING_STATUS,
        Created_At
    from {{ ref('obt') }}
) 
select * from bookings
