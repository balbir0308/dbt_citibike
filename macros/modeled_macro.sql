
{% macro flatten_sql() %}
    select
    v:time::timestamp as observation_time,
    v:city.id::int as city_id,
    v:city.name::string as city_name,
    v:city.country::string as country,
    v:city.coord.lat::float as city_lat,
    v:city.coord.lon::float as city_lon,
    v:clouds.all::int as clouds,
    (v:main.temp::float)-273.15 as temp_avg,  (v:main.temp_min::float)-273.15 as temp_min,
    (v:main.temp_max::float)-273.15 as temp_max,  v:weather[0].main::string as weather,  v:weather[0].description::string as weather_desc,  v:weather[0].icon::string as weather_icon,
    v:wind.deg::float as wind_dir,
    v:wind.speed::float as wind_speed
    from {{source('SOURCE_TRIP','JSON_WEATHER_DATA')}}
{% endmacro %}

{% macro build_trips_vw_sql(input_columns, source) %}
    SELECT
      _FILE,
      _LINE,
      _MODIFIED,
    {% for columnName in input_columns %}
          COLUMN_{{loop.index-1}} AS {{columnName}}
          {{ ", " if not loop.last else "" }}
    {% endfor %}
    FROM {{source}}
{% endmacro %}

{% macro build_weather_vw_sql(source) %}
    SELECT
      _FILE,
      _LINE,
      _MODIFIED,
      time::timestamp as observation_time,
      city:id::int as city_id,
      city:name::string as city_name,
      city:country::string as country,
      city:coord.lat::float as city_lat,
      city:coord.lon::float as city_lon,
      clouds:all::int as clouds,
      (main:temp::float)-273.15 as temp_avg,
      (main:temp_min::float)-273.15 as temp_min,
      (main:temp_max::float)-273.15 as temp_max,
      weather[0]:main::string as weather,
      weather[0]:description::string as weather_desc,
      weather[0]:icon::string as weather_icon,
      wind:deg::float as wind_dir,
      wind:speed::float as wind_speed
    FROM {{source}}
{% endmacro %}
