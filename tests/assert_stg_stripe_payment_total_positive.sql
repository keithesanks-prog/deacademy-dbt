select order_id
where sum(amount) as total_amount
from {{ref("stg_stripe__payments")}}
grouby 1
having sum(amount) < 0