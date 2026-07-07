
-- Intermediate:


-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT  

    pt.category, sum(od.quantity) [Total Qty]

FROM  
    order_details od 

JOIN 
    pizzas p   

ON  
    p.pizza_id = od.pizza_id

JOIN 

    pizza_types pt   

ON  
    pt.pizza_type_id = p.pizza_type_id 

GROUP BY pt.category 

-- Determine the distribution of orders by hour of the day.
-- how many orders were placed in each hour 

select  
    DATEPART(HOUR,time) AS OrderHour ,
    COUNT(order_id) AS TotalOrders 

from 
    orders 

group by 
    DATEPART(HOUR,time)
order by OrderHour





-- Join relevant tables to find the category-wise distribution of pizzas.

select pt.category , count(p.pizza_id) AS TotalPizzas

from pizza_types pt

join pizzas p  

on pt.pizza_type_id = p.pizza_type_id

group by pt.category

-- Group the orders by date and calculate the average number of pizzas ordered per day.



select Avg(DailyTotalPizzas) AS Avg_Pizza_per_day 
From (
    select o.date , sum(od.quantity) AS DailyTotalPizzas
from orders o   
join order_details od  
on o.order_id = od.order_id 

group by o.date) AS DailySales





-- Determine the top 3 most ordered pizza types based on revenue.

-- revenue = qty * price 

-- qty : order_detils 

-- proce : pizzas 


-- more revenue = more orderesd

select 
    TOP 3 
    pt.name,
    sum(od.quantity*p.price) [Revenue]


from 
    order_details od   
join pizzas as p
on od.pizza_id = p.pizza_id
join pizza_types pt   
on p.pizza_type_id = pt.pizza_type_id 

group by  pt.name 

order by Revenue desc













