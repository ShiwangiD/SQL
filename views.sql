
-- views :== wrap the data single unit.
 -- A view in SQL is a virtual table created from a query.
 -- It shows data from one or more tables but does not store data physically.

CREATE VIEW billing_info AS
select
   c.cust_name,
   p.p_name,
   p.price,
   oi.quantity,
   o.ord_date,
   (oi.quantity*p.price) as total_price
   from order_item oi
   join 
   products p on oi.p_id=p.p_id
   join 
      orders o on o.ord_id=oi.ord_id
	  join 
	  customers c on o.cust_id=c.cust_id;


select * from billing_info;    -- call the virtual table