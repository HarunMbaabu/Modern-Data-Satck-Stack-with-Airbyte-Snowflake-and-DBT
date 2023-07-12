with src_payments as (
    select
        *
    from
        workshop_mds.mongodb_payments
)

select
    sp.user_id,
    sp.city,
    sp.race,
    sp.country,
    sp.currency,
    sp.credit_card_type,
    sp.subscription_price
from
    src_payments as sp
