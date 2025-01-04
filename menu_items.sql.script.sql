USE Restaurant_db;

-- 1.View the menu_items table

select * from menu_items;

-- 2. find the number of items on the menu
select count(*) from menu_items;

-- 3. what are the least and most expensive items on the menu?

-- Most Expensive
Select * from menu_items
order by price DESC;

-- Least Expensive
Select * from menu_items
order by price ASC;

-- 4. How many Italian dishes are on the menu?

Select COUNT(*) From menu_items
where category = "Italian";

-- 5. What are the least and most expensive ITALIAN dishes on the menu?

-- Most Expensive
Select * From menu_items
where category = "Italian"
order by price DESC;

-- Least Expensive
Select * From menu_items
where category = "Italian"
order by price ASC;

-- 6. How many Dishes are in each category?
Select category, 
count(menu_item_id) AS nr_dishes 
From menu_items
group by category;

-- 7. what is the avg dish price within each category?
Select category, 
avg(price) AS AVG_dish_price
From menu_items
group by category;