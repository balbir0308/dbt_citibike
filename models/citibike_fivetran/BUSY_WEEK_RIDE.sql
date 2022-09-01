{{ config(materialized='table', schema="CITIBIKE_LAB_RAW") }}


select
dayname(starttime) as "day of week",
count(*) as "num trips"
from {{ref('TRIPS_VW')}}
group by "day of week" order by "num trips" desc
