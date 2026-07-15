#Subquery Basics

select *
from customers
where customer_id in (
			select customer_id
            from customer_orders
            where tip > 1);
            
select *
from customers
where total_money_spent > (select avg(total_money_spent) from customers)