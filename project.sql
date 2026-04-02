-- create a one to many and many to many relationship in a shopping store context using four tables:
-- 1. customers
-- 2. orders
-- 3. products
-- 4. order_items

-- Include a price column in the products table and display
-- the relationship between customers and their orders 
-- along with the details of the products in each order.


create table customers(cust_id SERIAL PRIMARY KEY,
cust_name VARCHAR(100)NOT NULL);

INSERT INTO customers (cust_name)
VALUES 
('John Doe'),
('Alice Smith'),
('Bob Johnson'),
('Charlie Brown'),
('David Wilson');

CREATE TABLE orders(
ord_id SERIAL PRIMARY KEY,
ord_date DATE NOT NULL,
cust_id INTEGER NOT NULL,
FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders (ord_date, cust_id)
VALUES
('2026-03-01', 1),
('2026-03-02', 2),
('2026-03-03', 3),
('2026-03-04', 4),
('2026-03-05', 5);

create table products(
p_id SERIAL PRIMARY KEY ,
p_name VARCHAR(100)NOT NULL,
price NUMERIC NOT NULL
);


INSERT INTO products (p_name, price)
VALUES
('Laptop', 1200.50),
('Smartphone', 800.00),
('Headphones', 150.75),
('Keyboard', 60.00),
('Monitor', 300.25);


CREATE TABLE order_item(
item_id SERIAL PRIMARY KEY,
ord_id INTEGER NOT NULL,
p_id INTEGER NOT NULL,
quantity INTEGER NOT NULL,
FOREIGN KEY(ord_id)REFERENCES orders(ord_id),
FOREIGN KEY(p_id)REFERENCES products(p_id)
);

INSERT INTO order_item (ord_id, p_id, quantity)
VALUES
(1, 1, 2),   -- Order 1, Laptop x2
(1, 3, 1),   -- Order 1, Headphones x1
(2, 2, 1),   -- Order 2, Smartphone x1
(3, 5, 2),   -- Order 3, Monitor x2
(4, 4, 3);   -- Order 4, Keyboard x3

select * from customers;
select * from orders;
select * from products;
select * from order_item;


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


