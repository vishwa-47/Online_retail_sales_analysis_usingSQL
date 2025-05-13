drop table if exists sales_data;

create table sales_data(
	InvoiceNo varchar(20),
	StockCode varchar(20),
	Description varchar(60),
	Quantity int,
	InvoiceDate timestamp,
	UnitPrice decimal(10,2),
	CustomerID int,
	Country varchar(30)



	
)

--finding if the dataset conatins null values

select * from sales_data

select * from sales_data where description is null

select * from sales_data where customerid is null



--handling null values


update sales_data set customerid = 'unknown person' where customerid is null

alter table sales_data alter customerid type varchar(20)

select * from sales_data



--1. Total number of unique customers:


select count(distinct customerid) as total_number_of_customers from sales_data




--2.Total number of transactions:


select count(distinct invoiceno) as total_number_of_transactions from sales_data



--3. Total sales amount:



select sum(quantity * unitprice) as total_sales from sales_data




--4. Average order value:


select round(avg(total_amount),2) from(
	select invoiceno, sum(quantity * unitprice) as total_amount
	from sales_data
	group by invoiceno
)as average_findings



--5. Top 10 customers by total spend:


select * from sales_data


select customerid,
sum(quantity * unitprice) as total_spends
from sales_data
where customerid ~ '^\d+$'
group by customerid
order by 2 desc
limit 10


--6. Top 10 selling products:


select description,
sum(quantity ) as total_quantity
from sales_data
group by description
order by 2 desc
limit 10




--7. Monthly sales trend:


select
	extract(month from invoicedate) as month_number,
	to_char(invoicedate,'month') as month,
sum(quantity * unitprice) as total_sales
from sales_data
group by 1,2
order by 1




--8. Sales by country:



select country,
sum(quantity*unitprice) as total_sales
from sales_data
group by 1
order by 2 desc


--9. Average number of items per order:


select round(avg(itemcount),2) 
	from(select invoiceno,
	count(*) as itemcount 
	from sales_data group by 1
)as average_items




--10.Repeat customer rate:


select (count(*)filter(where ordercount>1)::float/count(*))*100 as repeated_customer_rate
from (
	select customerid,count(distinct invoiceno) as ordercount
	from sales_data
	group by customerid
) as repeat_rate




--11.Customer segmentation based on total spend:


select customerid,
	case
	when total_sale>1000 then 'High_sale'
	when total_sale>500 and total_sale<1000 then 'Medium_sale'
	else 'Low_sale'
end
Total_spend_category
from (
	select customerid, sum(quantity * unitprice) as total_sale
	from sales_data
	group by 1
)as cust_segmentation




--12. Peak order hours:

select extract(hour from invoicedate)as hour,
count(*) as order_count
from sales_data
group by 1
order by 2 desc



--13. Top 5 countries by customer count:



select * from sales_data

select country,
count(distinct customerid) as total_customers
from sales_data
group by 1
order by 2 desc
limit 5




--14.Average basket size (number of items per transaction):


select avg(total_sales) 
	from(
	select invoiceno, sum(quantity) as total_sales
	from sales_data
	group by 1
	)as average_basket_size



--15. Cancellation rate:



select invoiceno from sales_data where invoiceno ilike 'c%'

select (count(*)filter(where invoiceno like 'C%')::float/count(*))* 100 as cancellation_rate
from sales_data





--16. Return rate by product:



select invoiceno,
	(count(*) filter(where quantity <0)::float/count(*))*100 as return_rate
from sales_data
group by 1
order by 2 desc
limit 10







