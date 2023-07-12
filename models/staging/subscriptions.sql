with src_subscriptions as (
    select
        *
    from
        workshop_mds.mongodb_subscriptions
)

select
    ss.user_id,
    ss.plan,
    ss.status,
    ss.payment_term,
    ss.payment_method,
    ss.subscription_term
from
    src_subscriptions as ss
