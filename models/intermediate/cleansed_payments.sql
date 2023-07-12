{{ config(materialized="table") }}

with cleansed_payments as (
    select
        *
    from
        {{ ref("payments") }}
)

select
    cp.user_id,
    cp.city,
    cp.race,
    cp.country,
    cp.currency,
    cp.credit_card_type,
    TO_DECIMAL(REPLACE(cp.subscription_price, '$'), 10, 2) as subscription_price
from
    cleansed_payments as cp