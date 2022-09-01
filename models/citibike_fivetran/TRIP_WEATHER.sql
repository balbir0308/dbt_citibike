{{ config(materialized='table',schema="CNF") }}

select
weather as conditions ,
count(*) as num_trips
from
{{ref('TRIPS_VW')}} left outer join {{ref('JSON_WEATHER_DATA_VW')}}
on date_trunc('hour', observation_time) = date_trunc('hour', starttime)
where conditions is not null group by 1 order by 2 desc
