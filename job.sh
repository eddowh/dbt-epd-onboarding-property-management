# `dbt docs generate` has to be first because codex looks for target/catalog.json only
dbt docs generate
dbt seed
dbt source freshness
