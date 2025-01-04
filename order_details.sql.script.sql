-- 1. View the order_details table?

select * from order_details

-- 2. What is the date range of the table?

select * from order_details
ORDER BY order_date;
-- or a simpler and more accurate method
select min(order_date), max(order_date) 
From order_details;

-- 3. how many orders were made within this date range?

select count(distinct order_id) from order_details;

-- 4. how any itees were ordered within this date range?

select count(order_id) from order_details;

-- 5. which orders had the greatest number of items?

select order_id, count(item_id) AS nr_items
from order_details
group by order_id
order by nr_items DESC;


-- 6. how many orders had more than 12 items?

select count(*) FROM
(select order_id, count(item_id) AS nr_items
from order_details
group by order_id
having nr_items >12) AS nr_orders;
