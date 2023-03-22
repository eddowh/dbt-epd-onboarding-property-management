import pandas as pd


def model(dbt, session):
    # setting configuration
    # dbt.config(materialized="table")

    target_name = dbt.config.get("target_name")

    # properties_df = dbt.ref("stg_properties").to_pandas()
    # units_df = dbt.ref("stg_units").to_pandas()

    # print(properties_df)
    # print(units_df)

    # dim_df = (
    #     pd.merge(properties_df, units_df, on='property_id') \
    #         .loc[:, properties_df.columns]
    # )

    dim_df = dbt.ref("stg_properties")

    # limit data in dev
    if target_name == "dev":
        dim_df = dim_df.limit(500)

    return dim_df
