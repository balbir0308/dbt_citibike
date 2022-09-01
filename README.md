# DBT INSTALLATION
Prerequisites: python3, pip, virtualenv

## Window Install

1.  Install python [Python Releases for Windows](https://www.python.org/downloads/windows/)
2.  Install PIP [How to Install Pip on Windows - ActiveState](https://www.activestate.com/resources/quick-reads/how-to-install-pip-on-windows/)
3.  pip install dbt-snowflake
4.  dbt --version

When installing dbt CLI (local), there are several prerequisites required to get started with dbt. These are python, pip, and virtualenv. On Windows, git for Windows is also required ([Use pip to install dbt](https://docs.getdbt.com/dbt-cli/install/pip#windows)).



The general flow of commands is below and more details can be found here: [Use pip to install dbt](https://docs.getdbt.com/dbt-cli/install/pip#pip-install-dbt)

```
$ pip install virtualenv  
$ virtualenv penv  
$ source penv/bin/activate  
$ pip install -r requirement.txt
$ dbt --version
```

# DBT Commands
Here we will list of commands you can execute on this project

## DBT Freshness Check
Run freshness check on every raw source table. This test logs warning message for now if there is no data in source for more than 1 day.

``` 
> dbt source freshness (Note: Use default profile)
> dbt source freshness
```

## DBT Test
Run test on all model and source if any configured

``` 
> dbt test (Note: Use default profile)
> dbt test --profiles-dir resources/citibike_fivetran
> dbt test --select TRIPS_VW --profiles-dir resources/citibike_fivetran
```

## DBT Compile
Verify and test the SQL statement generated as part of Compile command. The SQL Statement generated can be found under *target* folder

``` 
> dbt compile (Note: Use default profile)
> dbt compile --profiles-dir resources/citibike_fivetran
> dbt compile --select TRIPS_VW --profiles-dir resources/citibike_fivetran
```

## DBT Run
Apply model changes to target database.

``` 
> dbt run (Note: Use default profile)
> dbt run --profiles-dir resources/citibike_fivetran
> dbt run --select TRIPS_VW --profiles-dir resources/citibike_fivetran
```