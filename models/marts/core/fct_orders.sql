

with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
)

select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    case when p.status='success' then p.amount else 0 end as amount

from 
    orders o left join payments p
    on o.order_id = p.order_id