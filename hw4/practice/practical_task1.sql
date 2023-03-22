-- 1. Write a query to get most expense and least expensive Product list (name and unit price).
select product_name, unit_price
    from products
where unit_price = (select max(unit_price) from products) or unit_price = (select min(unit_price) from products)
order by unit_price desc;


-- 2. Write a query to get Product list (name, unit price) of above average price.
select product_name, unit_price
    from products
where unit_price > (select avg(unit_price) from products)
order by unit_price desc;


-- 3. Write a query to get Product list (name, unit price) of ten most expensive products.
select product_name, unit_price
    from products
order by unit_price desc limit 10;


-- 4. For each employee that served the order (identified by employee_id), calculate a total freight
select employee_id, sum(freight) as total_freight
    from orders
group by employee_id
order by employee_id;
