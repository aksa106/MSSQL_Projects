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



select pizza_type_id , count(pizza_type_id)from pizza_types
group by pizza_type_id

select 
    p.pizza_id ,
   max(count(p.pizza_id))
    
    from pizzas as p

join 
    order_details as od 
on  p.pizza_id = od.pizza_id

group by p.pizza_id








