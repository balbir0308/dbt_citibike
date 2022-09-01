{{ config(materialized='table', schema="CITIBIKE_LAB_RAW") }}

select
    date_trunc('hour', starttime) as "date",
    count(*) as "num trips",
    avg(tripduration)/60 as "avg duration (mins)",
    avg(haversine(start_station_latitude, start_station_longitude, end_station_latitude, end_station_longitude)) as "avg distance (km)"
from {{ref('TRIPS_VW')}}
group by 1
order by 1