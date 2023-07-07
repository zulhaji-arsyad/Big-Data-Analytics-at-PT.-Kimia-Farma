--- Create Base Table
create table base_table as(
select p1.tanggal,
       p1.id_invoice,
       p1.id_customer,
       p1.id_barang,
       p2.nama as nama_cabang,
       p2.cabang_sales,
       b1.kode_barang,
       b1.nama_barang as produk,
       b1.brand,
       p1.jumlah_barang as jumlah_unit,
       p1.unit,
       p1.harga as harga_per_unit,
       p1.mata_uang
from penjualan as p1
join pelanggan as p2 on p1.id_customer = p2.id_customer
join barang  as b1 on p1.id_barang = b1.kode_barang
);

--- Define Primary Key
ALTER TABLE base_table ADD PRIMARY KEY(id_customer);

--- Export Queries to CSV
 COPY (SELECT *
     FROM base_table
	 ) TO 'C:\Users\ASUS\Documents\zulhaji\Virtual Intership Program Big Data Analysis Kimia Farma\table_base.csv' WITH DELIMITER ',' CSV HEADER;
	
	
