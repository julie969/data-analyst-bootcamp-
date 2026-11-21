
--Mini Project SQL (dataset bigquery-public-data.thelook_ecommerce di Google Bigquery)
--1. Analisa Produk (tampilkan nama produk,kategori, departemen, merek dan harga retail dari tabel products. batasi hasil menjadi 20 produk pertama) 
SELECT 
  name,
  category,
  department,
  brand,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 20;

--2.identifikasi produk premium (cari produk dengan retail_price di atas 100. tampilkan nama produk, kategori,merk dan harga retails, lalu urutkan dari harga tertinggi ke terendah)
SELECT 
  name,
  category,
  brand,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price >100
ORDER BY retail_price DESC;

--3.Evaluasi Kategori Produk (hitung jumlah produk pada setiap kategori dari tabel products, lalu urutkan hasil dari jumlah produk terbesar)
SELECT 
  category,
COUNT (name) as Total_Item
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY Total_item DESC;

--4.mengenal pelanggan dan pesanan (gabungkan tabel users dan orders untuk menampilkan ID pesanan, status pesanan, tanggal pesanan dibuat serta nama depan dan nama belakang pelanggan) 
SELECT 
 o.order_id AS Order_id,
 o.status,
 o.created_at,
 u.first_name,
 u.last_name
 FROM `bigquery-public-data.thelook_ecommerce.orders` o
 INNER JOIN `bigquery-public-data.thelook_ecommerce.users` u
  ON o.user_id = u.id;

--5.analisis penjualan per kategori (gabungkan tabel order dan products, hitung total nilai penjualan berdasarkan kategori. tampilkan kategori dan total penjualan, urutkan dari nilai terbesar)
SELECT DISTINCT *
FROM `bigquery-public-data.thelook_ecommerce.order_items`;

SELECT DISTINCT *
FROM `bigquery-public-data.thelook_ecommerce.products`;

SELECT 
  p. category,
    ROUND (SUM(sale_price),2) AS Total_Sales
  FROM `bigquery-public-data.thelook_ecommerce.order_items` o
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON o.user_id = p.id
GROUP BY category
ORDER BY total_Sales DESC;
