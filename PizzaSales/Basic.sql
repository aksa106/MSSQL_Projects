-- Retrieve the total number of orders placed.

select count(order_id) from orders
-- Total orders placed til date is - 21350



-- Calculate the total revenue generated from pizza sales.

-- revenue = profit = price * qty 

select 

    sum(p.price * od.quantity) as Total_Revenue   
from 
    pizzas as p
join 
    order_details as od

on 
    od.pizza_id = p.pizza_id  

-- Total Revenue generated = 817860.0508384705





-- Identify the highest-priced pizza.

select 

    top 1 *,pt.name ,p.price

from pizza_types as pt   

join 
    pizzas as p   

on  pt.pizza_type_id = p.pizza_type_id

order by p.price desc 




-- Identify the most common pizza size ordered.


select size, count(size)[Size ordered] from pizzas 
group by size




-- List the top 5 most ordered pizza types along with their quantities.


-- We need two things : pizza types and total quantity ordered.


--pizza types is in pizza_type table and quantity is in order_details table so , they both are connecte with one table pizzas 

-- What operations are needed?
-- Join the tables
-- Group by pizza type
-- Sum the quantities
-- Sort in descending order
-- Return the top 5

select top 5 pt.name , sum(od.quantity) as total_qty

from order_details od   

join  pizzas p  

on p.pizza_id = od.pizza_id

join pizza_types pt  

on pt.pizza_type_id = p.pizza_type_id  

group by  pt.name  

order by total_qty desc



