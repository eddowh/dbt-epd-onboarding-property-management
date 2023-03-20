# Installation

```bash
dbt deps
```

## Commands

To run SQL from a macro, not in the context of a model:

```bash
dbt run-operation grant_select
```

To clean stale models:

```bash
dbt run-operation clean_stale_models
dbt run-operation clean_stale_models --args '{"dry_run": False}'
```

* Discourse: [Clean your warehouse of old and deprecated models](https://discourse.getdbt.com/t/clean-your-warehouse-of-old-and-deprecated-models/1547)

To confirm seeds are generated in the docs:

* Do not run it:

```
$ dbt run
21:41:15  Found 12 models, 31 tests, 0 snapshots, 6 analyses, 423 macros, 0 operations, 1 seed file, 6 sources, 1 exposure, 0 metrics...
...
21:41:38  Finished running 8 table models, 3 view models, 1 incremental model in 0 hours 0 minutes and 23.29 seconds (23.29s).
```

* Seed it:

```
$ dbt seed
21:44:48  Found 12 models, 31 tests, 0 snapshots, 6 analyses, 423 macros, 0 operations, 1 seed file, 6 sources, 1 exposure, 0 metrics
...
21:44:53  Finished running 1 seed in 0 hours 0 minutes and 4.90 seconds (4.90s).
```

* Then generate docs:

```
$ dbt docs generate
21:41:50  Found 12 models, 31 tests, 0 snapshots, 6 analyses, 423 macros, 0 operations, 1 seed file, 6 sources, 1 exposure, 0 metrics
21:41:50
21:41:51  Concurrency: 4 threads (target='dev')
21:41:51
21:41:52  Done.
21:41:52  Building catalog
21:42:02  Catalog written to /Users/eddowh/codaz/dbt-epd-onboarding-property-management/target/catalog.json
```

To confirm analyses are compiled but not run, execute `dbt compile` then `dbt run` and notice how analyses is not run.

---

_Original Boilerplate Description_

Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
