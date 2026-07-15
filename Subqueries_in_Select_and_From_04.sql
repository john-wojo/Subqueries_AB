#Subqueries in Select and From Statements

#Produces error because cannot have aggregate column with non aggregate columns
select product_id, quantity, avg(quantity)
from ordered_items;

select product_id, 
	   quantity,
       (select avg(quantity)
       from ordered_items) as Avg_Qty
from ordered_items;


select product_id, 
	   quantity,
       (select sum(quantity)
        from ordered_items) as Sum_Qty,
       (quantity / (select sum(quantity)
				   from ordered_items) * 100) as Pct_Qty
from ordered_items
group by product_id, quantity
order by product_id;


select *
from ordered_items;

select product_id, 
	   Avg_Qty
from (select product_id,
			 quantity,
             (select avg(quantity)
			  from ordered_items) Avg_Qty
	  from ordered_items) as avg_quant;