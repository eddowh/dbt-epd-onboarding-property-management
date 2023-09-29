# `dbt docs generate` has to be first because codex looks for target/catalog.json only
dbt docs generate
dbt build
dbt source freshness
