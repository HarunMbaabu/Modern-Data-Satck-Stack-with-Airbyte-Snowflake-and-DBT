{{ config(materialized="table") }}

with cleansed_user as (
    select
        *
    from
        {{ ref("user") }}
)

select
    cu.user_id,
    cu.username as user_name,
    cu.gender,
    json_extract_path_text(cu.employment, 'title') as title, -- function from snowflake
    json_extract_path_text(cu.subscription, 'payment_method') as payment_method
from
    cleansed_user as cu
