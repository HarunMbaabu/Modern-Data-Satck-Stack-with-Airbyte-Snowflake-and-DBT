{{ config(materialized='table') }}

with cleansed_user as (
    select
        *
    from
        {{ ref('cleansed_user') }}
),

cleansed_payments as (
    select
        *
    from
        {{ ref('cleansed_payments') }}
),

credit_card_usage_per_country as (
    select
        cp.country,
        cp.currency,
        cp.credit_card_type,
        count(*) as amount
    from
        cleansed_user as cu
    inner join
        cleansed_payments as cp using(user_id)
    group by
        cp.country,
        cp.currency,
        cp.credit_card_type
)
select
    *
from
    credit_card_usage_per_country