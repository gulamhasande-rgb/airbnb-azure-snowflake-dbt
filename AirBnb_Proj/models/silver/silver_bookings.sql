{{ config(materialized = 'incremental', unique_key = 'BOOKING_ID') }}

select 
    BOOKING_ID,
    Listing_ID,
    BOOKING_DATE,
    {{multiply('NIGHTS_BOOKED','BOOKING_AMOUNT',2)}} + CLEANING_FEE + SERVICE_FEE As TOTAL_AMOUNT,
    BOOKING_STATUS,
    Created_At
from {{ ref('bronze_bookings') }}

                