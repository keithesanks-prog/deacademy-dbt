with source as (
    select * from {{ source('walmart_raw', 'stg_department') }}
)

select
    store_id,
    dept_id,
    sale_date,
    weekly_sales,
    case when is_holiday = 'TRUE' then 1 else 0 end as is_holiday_flag
from source