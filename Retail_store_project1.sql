/*
-- - Tasks:
    1. Create tables for products, customers, and sales.
    2. Insert sample data into each table.
    3. Write queries to find the top 5 best-selling products.
*/

create  table customer(
	 	customer_id varchar(20),
		gender  varchar(15),
		age int,
		payment_method varchar(20)

)

 drop table if exists sales;
		 create table sales(
			 		invoice_no  varchar(15),
					 customer_id varchar(20),
					 category varchar(50),
					 quantity int,
					 price	float,
					 invoice_date date,
					 shopping_mall varchar(50)
			);
select * from sales;
--  Write queries to find the top 5 best-selling products.

select 
	category,
	quantity,
	price
	from sales
 	order by category Desc
	limit 5


--  questions

	select * from customer
	select * from sales
1 What is the total revenue generated?
 select
	sum(price) as total_revenue
	from  sales
	
What is the most popular product category in terms of sales?

select 
		category,
		invoice_date,
		quantity
	from sales
	order by category
	limit 5

	
What are the three top shopping malls in terms of sales revenue?
What is the gender distribution across different product categories?
What is the age distribution of customers who prefer each payment method?
 select * from customer;





