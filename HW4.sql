--Write a query to get Product name and quantity/unit. 
select product_id 
, quantity_per_unit 
from products
--Write a query to get current Product list (Product ID and name).
select product_id 
, product_name  
from products
--Write a query to get discontinued Product list (Product ID and name).
select product_id 
, product_name  
from products 
where discontinued = 1;
--Write a query to get most expense and least expensive Product list (name and unit price).
select product_name 
, unit_price 
from products
where unit_price = (select
min(unit_price) from products p)
or unit_price = (select
max(unit_price) from products p)
--Write a query to get Product list (id, name, unit price) where current products cost less than $20. 
select product_name 
, unit_price 
from products
where unit_price < 25;
--Write a query to get Product list (id, name, unit price) where products cost between $15 and $25. 
select product_name 
, unit_price 
from products
where unit_price between 15 and 25;
--Write a query to get Product list (name, unit price) of above average price.
select product_name 
, unit_price 
from products
where unit_price < (select
avg(unit_price) from products);
--Write a query to get Product list (name, unit price) of ten most expensive products.
select product_name 
, unit_price 
from products
order by unit_price desc
limit 10
--Write a query to count current and discontinued products.
 (select 'discont' as type
, count(product_id)
from products
where discontinued = 1)
union
(select 'no discont' as type 
, count(product_id) 
from products
where discontinued = 0)
--Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order.
select product_name 
, units_on_order 
, units_in_stock 
from products
where units_in_stock < units_on_order;