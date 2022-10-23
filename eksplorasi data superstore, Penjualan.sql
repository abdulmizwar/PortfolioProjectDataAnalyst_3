show databases;
use superstardb;
show tables;
select * from returns;
select * from superstore;

-- 1.melihat total penjualan setahun di kota 'New York City'
select City, Sales, month(Order_date) as bulan, year(Order_date) as Tahun
from superstore
where City= 'New York City' and year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);

-- 2.melihat rata-rata profit setahun di kota 'New York City'
select City, 
avg(Profit) as rata_rata,  
month(Order_date) as bulan,
year(Order_date) as tahun
from superstore
where City= 'New York City' and year(Order_date) = 2016
group by month(Order_date)
order by Order_date;

-- 3.melihat keuntungan terbesar dari category di  'New York City' tahun 2016
select Category, Profit,City
from superstore
where (select max(Profit) from superstore) and City= 'New York City' and year(Order_date) = 2016
group by Category
order by Profit desc;

-- 4.melihat total keuntungan setahun di kota 'New York City'
select  month(Order_date) as bulan,
(Profit/Sales)*100 as Total_keuntungan
from superstore
where City= 'New York City' and year(Order_date) = 2016 
group by month(Order_date)
order by Order_date ;

-- 5.melihat total penjualan & keuntungan berdasarkan Sub kategory di tahun 2016
select distinct Sub_Category, 
(Profit/Sales)*100 as Total_keuntungan,
Sales as Penjualan,
month(Order_date) as bulan,
year(Order_date) as Tahun
from superstore
where year(Order_date) = 2016 
order by bulan ;

-- 1.melihat rata-rata penjualan per bulan di tahun 2016 di kota 'New York City'
select avg(Sales), month(Order_date), year(Order_date)
from superstore 
where year(Order_date) = 2016 
group by month(Order_date)
order by month(Order_date);

-- 2.melihat data penjualaan produk diatas rata-rata, di tahun 2016
select avg(Sales) as Rata_Rata, month(Order_date) as bulan, year(Order_date) as tahun
from superstore 
where Sales > (select avg(Sales) from superstore) 
and year(Order_date) = '2016'
group by month(Order_date)
order by month(Order_date);

-- penjualan & keuntungan by sub-category 
select Sub_Category, Sales, Profit 
from superstore
group by Sub_Category
order by Profit and Sales desc
limit 17;

-- Perbandingan keuntungan berdasarkan negara 
select State, Profit, (Sales/Profit)*100 as hasil_Perbandingan
from superstore 
group by State
order by Sales;



