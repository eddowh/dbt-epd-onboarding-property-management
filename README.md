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
