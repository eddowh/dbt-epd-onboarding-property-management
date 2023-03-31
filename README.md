# Installation

```bash
dbt deps
```

## Commands

### To run SQL from a macro, not in the context of a model:

```bash
dbt run-operation grant_select
```

### To clean stale models:

```bash
dbt run-operation clean_stale_models
dbt run-operation clean_stale_models --args '{"dry_run": False}'
```

* Discourse: [Clean your warehouse of old and deprecated models](https://discourse.getdbt.com/t/clean-your-warehouse-of-old-and-deprecated-models/1547)

### To confirm seeds are generated in the docs:

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

### To confirm analyses are compiled but not run, execute `dbt compile` then `dbt run` and notice how analyses is not run.

### To setup a snapshots table

We would ideally have a source table with `updated_at`, but we could also define a seed and manually change data in csv.

For example, start with a `seeds/orders.csv`:

```csv
id,status,updated_at
1,pending,2019-01-01
```

Create a snapshot based on this seed, and then run `dbt build -s +snapshot_name+` to run the seed and snapshot.

Then, change the column values in the csv, and make sure to change `updated_at` too.

Run `dbt build -s +snapshot_name+` again, and you should be able to query from `{{ ref('snapshot_name') }}`.

Scenarios we tried where we built snapshots with **timestamp** and **check** strategies together, and we observed:

- Hard deletes can only be tracked with **timestamp**
- Changing just the column `status` (and not changing `updated_at`) would insert one row to **check**, and none to **timestamp**.
  - This is because the **timestamp** is only inserted to when there is a change in `updated_at`.
- Changing just the column `updated_at` would insert one to **timestamp**, and none to **check**.
  - This is because even if `status` didn't change, the **timestamp** table will record a change due to `updated_at`. On the contrary when the **check** table is not configured to check `updated_at` (which is what we tested with), it expectedly does not add any rows to **check** table because no rows have changed in `status`.

---

Learning Objectives

- [ ] Setup metrics
- [X] Setup exposures
- [X] Create a Python model
- [ ] Create a Python model (Advanced)
- [ ] Implement an ephemeral model
- [ ] Implement an incremental model
- [X] Implement a snapshot table using timestamp strategy
- [X] Implement a snapshot table using check strategy

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
