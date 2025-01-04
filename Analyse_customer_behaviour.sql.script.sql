-- 1. Combine the menu_items and order_details tables into a single table (typically when joining tables, the first table to list is your transaction table)

select * from menu_items;
select * from order_details;

-- LEFT JOIN (keeps all rows in first table and adds on rows from the right/second table):
select *
FROM order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id;


-- 2. What were the least and most ordered items? What categories were they in?

-- what you "group by" needs to be in your "select"
select item_name, category, count(order_details_id) AS nr_purchases
FROM order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
group by item_name, category
order by nr_purchases desc;

-- 3. What were the top 5 orders that spent the most money?

select order_id, sum(price) AS total_spend
FROM order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?

select category, count(item_id) AS nr_items
FROM order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

-- Italian food is very popular

-- 5. BONUS: View the details of the top 5 highest spend orders. What insights can you gather from the results?

-- using the code where we identified the top 5 orders that spent the most money we can then take those numbers order_id values and using the code where we identified the details of the highest spend order. We can use the "IN" function by "Where" to determine the details of the top 5 spend orders.

select order_id, category, count(item_id) AS nr_items
FROM order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
where order_id IN (440, 2075, 1957, 330, 2675)
group by order_id, category;

-- Italian food is very popular
