show databases;
use superstardb;
show tables;
select * from returns;
select * from superstore;

#1.
#melihat penjualan mulai dari 2016-2017 berdasarkan city 'New York City'
/*
tetapi sebelum melihat data perlu kita lakukan perhitungan jumlah city yang muncul 
agar data yang di visualkan tersebut mempunyai data waktu penjualan 

*/
-- melihat jumlah pelanggan di Kota, Negara, Negara Bagian, dan Wilayah pada tahun 2016
select City,Country,State,Region,count(Customer_id) as jumlah_pelanggan
from superstore
where year(Order_date) = 2016
group by City
order by jumlah_pelanggan desc;

select City, 
Sales, Order_date
from superstore
where City= 'New York City' and year(Order_date) = 2016
order by Order_date;

#melihat penjualan mulai dari 2016-2017 berdasarkan city 'Los Angeles'
select City, 
avg(Sales) as rata_rata_Penjualan, month(Order_date) as bulan, 
year(Order_date) as Tahun
from superstore
where City= 'Los Angeles' and year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);

#melihat penjualan mulai dari 2016-2017 berdasarkan city 'Philadelphia'
select City, 
avg(Sales), month(Order_date) as bulan, 
year(Order_date) as Tahun
from superstore
where City= 'Philadelphia' and year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);

#melihat penjualan mulai dari 2016-2017 berdasarkan city 'San Francisco'
select City, 
avg(Sales) as rata_rata_Penjualan , month(Order_date) as bulan, 
year(Order_date) as Tahun
from superstore
where City= 'San Francisco' and year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);

#melihat penjualan mulai dari 2016-2017 berdasarkan city 'New York City'
select City, 
avg(Sales) as rata_rata_Penjualan , month(Order_date) as bulan, 
year(Order_date) as Tahun
from superstore
where City= 'New York City' and year(Order_date) = 2016
group by month(Order_date)
order by month(Order_date);

#2.
#melihat penjualan menurut negara
select State, 
Sales
from superstore
where year(Order_date) = 2016
group by State
order by Sales desc
limit 10;

select State, 
Sales
from superstore
where year(Order_date) = 2016
group by State
order by Sales desc
limit 11,21;

select State, 
Sales
from superstore
where year(Order_date) = 2016
group by State
order by Sales desc
limit 21,31;

select State, 
Sales
from superstore
where year(Order_date) = 2016
group by State
order by Sales desc
limit 31,41;






