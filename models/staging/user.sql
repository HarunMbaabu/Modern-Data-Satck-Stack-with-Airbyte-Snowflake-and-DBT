with src_user as (
    select 
        *
    from 
        workshop_mds.mongodb_user
)

select
    su.id,
    su.user_id,
    su.username,
    su.gender,
    su.employment,
    su.credit_card,
    su.subscription
from
    src_user as su
