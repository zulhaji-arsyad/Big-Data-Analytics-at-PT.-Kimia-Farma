--- create aggregat table
create table aggregate_table as (select
							   tanggal,
							   id_invoice,
							   id_customer,
							   id_barang,
							   nama_cabang,
							   cabang_sales,
							   kode_barang,
							   produk,
							   brand, 
							   jumlah_unit,
							   unit,
							   harga_per_unit,
							   mata_uang,
							   sum(jumlah_unit * harga_per_unit ) as total_sales
			from base_table 
							group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
								
							   );
							   

--- Export Queries to CSV
 COPY (SELECT *
     FROM aggregate_table
	 ) TO 'C:\Users\ASUS\Documents\zulhaji\Virtual Intership Program Big Data Analysis Kimia Farma\aggregate_table.csv' with DELIMITER ',' CSV HEADER;