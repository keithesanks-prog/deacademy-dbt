with sales as (
    select * from {{ ref('stg_walmart_sales') }}
),
features as (
    select * from {{ source('walmart_raw', 'stg_fact') }}
)

select
    s.store_id,
    s.dept_id,
    s.sale_date,
    s.weekly_sales,
    f.fuel_price,
    f.cpi,
    f.unemployment,
    s.is_holiday_flag
from sales s
left join features f 
    on s.store_id = f.store_id 
    and s.sale_date = f.sale_date