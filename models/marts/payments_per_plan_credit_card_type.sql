{{ config(materialized='table') }}

with cleansed_payments as (
    select
        *
    from
        {{ ref('cleansed_payments') }}
),

cleansed_subscriptions as (
    select
        *
    from
        {{ ref('cleansed_subscriptions') }}
),
payments_per_plan_credit_card_type as (
    select
        cs.plan,
        cp.credit_card_type,
        sum(cp.subscription_price) as total_price
    from
        cleansed_payments as cp
    inner join
        cleansed_subscriptions as cs using(user_id)
    group by
        cs.plan, cp.credit_card_type
    order by
        cs.plan asc, total_price desc
)

select
    *
from
    payments_per_plan_credit_card_type