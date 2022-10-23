show databases;
use superstardb;
show tables;
select * from returns;
select * from superstore;

-- melihat jumlah kota dari yang paling banyak melakukan order
select City, count(Order_id) as Jumlah_order 
from superstore 
group by City 
order by Jumlah_order desc;

-- melihat kategory dari yang paling banyak dalam melakukan order
select Category, count(Order_id) as Jumlah_order 
from superstore 
group by Category 
order by Jumlah_order desc;

-- melihat order apa saja yang mengalami proses kembalian di table superstore &  di table retuns 
select r.Returned, s.Order_id
from superstardb.superstore as s
join superstardb.returns as r
group by s.Order_id;

-- melihat region yang paling banyak melakukan order 
select Region, count(Order_id) as Jumlah_order
from superstore
group by Region
order by Jumlah_order desc;

-- melihat jumlah region yang ordernya mengalami pengembalian
select s.Region, count(r.Order_ID) as JumlahPengembalian
from superstardb.returns as r
join superstardb.superstore as s
on r.Order_ID =  s.Order_id
group by s.Region
order by JumlahPengembalian desc;

-- melihat rata-rata profit pertahun pada table superstore 
select year(Order_Date) as tahun , avg(Profit)
from superstore 
group by tahun;

drop table date;
select * from superstore;

alter table superstore
modify Order_Date date;

alter table superstore
add primary key (Row_ID);

select * from superstore;
alter table superstore 
modify Ship_Date date;

desc superstore;

-- melihat 50 product yang memiliki jumlah quantity terbanyak dari keseluruhan produk yang dilakukan order
-- check quantity tertinggi 
select max(Quantity) from superstore;

select Product_Name, 
max(Quantity) as Quantity_tertinggi 
from superstore
group by Product_Name
order by Quantity_tertinggi desc
limit 50;
