show databases;
use superstardb;
show tables;
select * from returns;
select * from superstore;

-- 1.
-- jumlah pelanggan di tahun 2016 
select month(Order_date) as Bulan, year(Order_date) as Tahun,
count(Customer_ID) as Jumlah_Customer
from superstore
where year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);


-- 2.
--  penjualan berdasarkan pelanggan di tahun 2016 
select monthname(Order_date) as bulan,
sum(Sales) as Jumlah_Penjualan 
from superstore
where year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);

-- 3.
-- Rata-Rata penjualan berdasarkan pelanggan di tahun 2016 
select Customer_Name,
avg(Sales) as Jumlah_Ratarata_Penjualan
from superstore
where year(Order_date) = 2016
group by Customer_ID
order by Jumlah_Ratarata_Penjualan desc;

-- 4. melihat mode kapal yang paling banyak digunakan tahun 2016
-- di tahun 2016 
select Ship_mode, count(Ship_mode) as jumlah
from superstore
where year(Order_date) = 2016
group by Ship_mode
order by jumlah desc;

-- 5. melihat 10 peringkat teratas nama pelanggan di tahun 2016 berdasarkan profit
select Customer_Name, count(Order_ID) as jumlah, Sales ,
Profit
from superstore
where year(Order_date) = 2016
group by Customer_Name
order by Profit desc
limit 11;


-- 6. Penjualan per pelanggan berdasarkan kategory
select Category, 
count(Sales) Jumlah_Penjualan
from superstore 
where year(Order_date) = 2016
group by Category 
order by Jumlah_Penjualan desc
limit 3;

-- CONTOH SUB-QUERY 2.
-- Rata-Rata penjualan berdasarkan pelanggan di tahun 2016 
select avg(Sales)
from (select Sales 
from Customer inner join sales on 
(sales.id = Customer.id_sales))as sc;

-- melihat harga tertinggi pada product yang memiliki category 
select max(harga) as harga_tertinggi
from (select harga from product inner join category on( 
category.id_product = product.id)) as cp
group by category.name_category
order by harga_tertinggi; 

-- melihat harga tertinggi pada product yang memiliki category 