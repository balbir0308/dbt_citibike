{{ config(
            materialized="view",
            schema="SRC"
) }}

{{build_weather_vw_sql(source("citibike_lab_raw.json_weather_data","JSON_WEATHER_DATA"))}}