{{ config(materialized="table") }}

with cleansed_subscriptions as (
    select
        *
    from
        {{ ref("subscriptions") }}
)

select
    cs.user_id,
    cs.plan,
    case
        when
            plan in ('Business', 'Diamond', 'Gold', 'Platinum', 'Premium') then 'High'
        when
            plan in ('Bronze', 'Essential', 'Professional', 'Silver', 'Standard') then 'Normal'
        else
            'Low'
    end as subscription_importance,
    cs.status,
    cs.payment_term,
    cs.payment_method,
    cs.subscription_term
from
    cleansed_subscriptions as cs
