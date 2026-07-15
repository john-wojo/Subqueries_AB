#ANY and ALL Operators

#Subquery
select max(quantity * unit_price) as total_order_price
from ordered_items
where shipper_id = 1;

#Shows the two largest orders not from shipper_id 1
select shipper_id, order_id, quantity, unit_price, (quantity * unit_price) as total_order_price
from ordered_items
where (quantity * unit_price) > (select max(quantity * unit_price) as total_order_price
						   from ordered_items
						   where shipper_id = 1)
order by unit_price desc;

#Uses all statement and produces the same two larger shipments from the other shipper_ids
select shipper_id, order_id, quantity, unit_price, (quantity * unit_price) as total_order_price
from ordered_items
where (quantity * unit_price) > all (select (quantity * unit_price) as total_order_price
						   from ordered_items
						   where shipper_id = 1);
                           
#Uses any statement and produces a very different result                           
select shipper_id, order_id, quantity, unit_price, (quantity * unit_price) as total_order_price
from ordered_items
where (quantity * unit_price) > any (select (quantity * unit_price) as total_order_price
						   from ordered_items
						   where shipper_id = 1);