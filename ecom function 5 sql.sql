select * from sales
select * from customer
select profit > 500 from sales where order_line = 123
select min (profit), max (profit), avg (profit)from sales

select case
when profit < 0 then 'no profit'
when profit > 20 then 'good profit'
when profit > 50 then 'best profit'
when profit > 80 then 'great profit'
else 'min profit'
end
from sales

create or replace function checkprofit (prof int)
returns varchar as $$
DECLARE
profit_status varchar;
begin 
case
when prof > 0 then profit_status :='no profit';  
when prof > 20 then profit_status :='good profit';
when prof > 50 then profit_status :='best profit';
when prof > 80 then profit_status :='great profit';
else profit_status := 'no profit';
end case;
return profit_status;
end
$$ language plpgsql;
select checkprofit(50)
-----
select * from sales
select * from customer

select sales > 100 from sales where ship_mode = 'second class'
select sales from sales

select sales, case
when sales > 100 then 'good'
when sales > 200 then 'very good'
when sales > 300 then 'excellent'
else 'sales ok'
end as sales_status
from sales

create or replace function check_sales_value(sal double precision)
returns varchar as $$
declare
sales_status varchar;
begin
case
when sal > 100 then sales_status :='good';
when sal > 200 then sales_status :='very good';
when sal > 300 then sales_status :='excellent';
else sales_status := 'sales ok';
end case;
return sales_status;
end;
$$ language plpgsql;

 select check_sales_value(200)
-----
select * from sales
select * from customer
select age,case
when age > 25 then 'she is female'
when age > 30 then 'he is male'
when age = 27 then 'she is young'
else 'either male or female'
end as age_status
from customer

create or replace function checkage(age int)
returns varchar as $$
declare 
age_status varchar;
begin
case
when age > 25 then age_status := 'she is female';
when age > 30 then age_status := 'he is male';
when age = 27 then age_status := 'she is young';
else age_status := 'either male or female';
end case;
return age_status;
end
$$ language plpgsql;

select checkage(45)

	-------
select * from sales
select * from customer

select quantity, case
when quantity = 1 then 'less'
when quantity = 5 then 'good'
when quantity = 8 then 'very good'
else 'fine'
end as quantity_status
from sales

create or replace function checkquantity(quan int)
returns varchar as $$
declare
quantity_status varchar;
begin
case
when quan = 1 then quantity_status := 'less';
when quan = 5 then quantity_status := 'good';
when quan = 8 then quantity_status := 'very good';
else quantity_status :='fine';
end case;
return quantity_status;
end
$$ language plpgsql;	

select checkquantity(5)

select * from sales
select * from customer
select segment,case 
when segment = 'home office' then 'they are home seek'
when segment = 'corporate' then 'they are hard worker'
when segment = 'consumer' then 'they are customer'
else 'none'
end as segment_status
from customer

create or replace function checksegment(seg varchar)
returns varchar as $$
declare
segment_status varchar;
begin
case
when seg = 'home office' then segment_status:='they are home seek';
when seg = 'corporate' then segment_status:='they are hard worker';
when seg = 'consumer' then segment_status:='they are customer';
else segment_status :='none';
end case;
return segment_status;
end
$$ language plpgsql;
select checksegment('home office')
 ---------------

select * from sales
select * from customer
	
select discount,case
when discount = 0 then 'no discount'
when discount between 0.2 and 0.4 then 'medium discount'
when discount = 0.45 then 'good discount'
else 'null'
end as discount_status
from sales

create or replace function checkdiscount(dis float)
returns varchar as $$
declare
discount_status varchar;
begin
case 
when dis = 0 then discount_status := 'no discount';
when dis between 0.2 and 0.4 then discount_status:='medium discount'; 
when dis = 0.45 then discount_status :='good discount';
else discount_status := 'null';
end case;
return discount_status;
end
$$ language plpgsql;
select checkdiscount(0.4)



