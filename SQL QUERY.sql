select 
    order_id,
    status_id,
    country_id,
    CASE
        WHEN length(rd.creation_date) = 5 THEN 
            calculate_days(to_date('0'||substr(rd.creation_date,0,2) || substr(rd.creation_date,3,2) || substr(rd.creation_date,5,2),'DDMMYY'))
        WHEN length(rd.creation_date) = 6 THEN
            calculate_days(to_date(substr(rd.creation_date,0,2) || substr(rd.creation_date,3,2) || substr(rd.creation_date,5,2),'DDMMYY'))
        ELSE NULL
    END AS num_days,
    order_value,
    dense_rank() over (partition by country_id order by order_value desc) country_order_value_index
from rd_order rd