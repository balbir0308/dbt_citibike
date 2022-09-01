{{ config(
            materialized="view",
            schema="CITIBIKE_LAB_RAW"
) }}

{% set __columns = [
    "tripduration",
    "starttime",
    "stoptime",
    "start_station_id",
    "start_station_name",
    "start_station_latitude",
    "start_station_longitude",
    "end_station_id",
    "end_station_name",
    "end_station_latitude",
    "end_station_longitude",
    "bikeid",
    "membership_type",
    "usertype",
    "birth_year",
    "gender"
]
%}

{{build_trips_vw_sql(__columns, source("citibike_lab_raw.trips","TRIPS"))}}