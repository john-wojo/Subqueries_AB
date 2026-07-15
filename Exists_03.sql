#Exists

#Old query from earlier
select *
from customers
where customer_id in
	(select customer_id
     from customer_orders);

#Same query using exists instead, returns all rows from customers
select *
from customers
where exists 
	(select customer_id
     from customer_orders);
	
#Same query using exists, but where clause in the subquery gives us the original results
select *
from customers c
where exists 
	(select customer_id
     from customer_orders
     where customer_id = c.customer_id);