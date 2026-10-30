select
    
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as payment_status,

    -- amount is stored in cents, so we need to divide by 100 to get dollars
    amount / 100.0 as payment_amount,
    created as payment_date,
    _batched_at as loaded_at

from {{ source('stripe', 'payment') }}