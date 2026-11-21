# data-analyst-bootcamp-
Repository berisi file hasil pengerjaan selama mengikuti BOotcamp Data Analyst sebagai bagian dari portofolio.

# Tujuan Project 
Project ini diadakan untuk menganalisis data dan menjawab berbagai pertanyaan bisnis guna mendukung pengambilan keputusan.

# Dataset 
Dataset yang digunakan bersumber dari database publik TheLook eCommcerce yang tersedia di Google BigQuery. 

# Pertanyaan Bisnis 
1. Analisis Produk: Tim product ingin mengetahui karakteristik produk yang dijual. Tampilkan nama produk, department,merek, dan harga retail dari tabel producst. Batasi hasil menjadi 20 produk pertama.

 SQL Query:
 SELECT 
  name,
  category,
  department,
  brand,
  retail_price
 FROM `bigquery-public-data.thelook_ecommerce.products`
 LIMIT 20;

 <img width="560" height="514" alt="Screenshot 2026-11-21 134725" src="https://github.com/user-attachments/assets/e760fced-0d46-4c5e-8ef5-38d4c1a896ee" />


2. Identifikasi Produk Premium: Tim Marketing ingin menyiapkan kampanye untuk produk premium. Cari produk dengan retail_price diatas 100. Tampilkan nama produk, kategori, merek dan harga retail, lalu urutkan dari harga tertinggi ke terendah.

SQL Query:
SELECT 
  name,
  category,
  brand,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price >100
ORDER BY retail_price DESC;

<img width="864" height="682" alt="Screenshot 2026-11-21 135105" src="https://github.com/user-attachments/assets/07fadc79-5bb3-4e17-b1cc-8637d5fe52d9" />


3. Evaluasi Kategori Produk: Tim Product ingin mengetahui kategori dengan jumlah produk terbanyak. Hitung jumlah produk pada setiap kategori dari tabel products, lalu urutkan hasil dari jumlah produk terbesar.

SQL Query:
SELECT 
  category,
COUNT (name) as Total_Item
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY Total_item DESC;

<img width="325" height="627" alt="Screenshot 2026-11-21 135432" src="https://github.com/user-attachments/assets/4fc12052-3804-4aa3-b00b-4319b3333b8a" />


4. Mengenal Pelanggan dan Pesanan: Tim CRM ingin melihat pelanggan yang melakukan pemesanan. Gabungkan tabel users dan orders untuk menampilkan ID pesanan, status pesanan, tanggal pesanan dibuat, serta nama depan dan nama belakang pelanggan.

SQL Query:
SELECT 
 o.order_id AS Order_id,
 o.status,
 o.created_at,
 u.first_name,
 u.last_name
 FROM `bigquery-public-data.thelook_ecommerce.orders` o
 INNER JOIN `bigquery-public-data.thelook_ecommerce.users` u
  ON o.user_id = u.id;

<img width="468" height="615" alt="Screenshot 2026-11-21 135551" src="https://github.com/user-attachments/assets/62e03860-6036-494b-9f8b-9665b70609e0" />

   
5. Analisis Penjualan per Kategori: Manajer bisnis ingin mengetahui kategori produk dengan nilai penjualan terbesar. Gabungan tabel order_items dan products, lalu hitung total nilai penjualan berdasarkan kategori. Tampilkan kategori dan total penjualan, kemudian urutkan dari nilai terbesar. Gunakan order_items.sale_price sebagai nilai trasaksi per item.

SQL Query:
SELECT 
  p. category,
    ROUND (SUM(sale_price),2) AS Total_Sales
  FROM `bigquery-public-data.thelook_ecommerce.order_items` o
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON o.user_id = p.id
GROUP BY category
ORDER BY total_Sales DESC;

<img width="317" height="621" alt="Screenshot 2026-11-21 135751" src="https://github.com/user-attachments/assets/55e35b5a-0dc8-4f22-86af-36936b6847a3" />


# Insight 
tuliskan dua insight bisnis berdasarkan hasil soal 3 dan 5.

<img width="855" height="660" alt="Screenshot 2026-11-21 131101" src="https://github.com/user-attachments/assets/4d1cc9ab-a5f3-4db4-903f-4785be77186f" />


Berdasarkan data yang dianalisis, tingginya volume atau jumlah produk terjual tidak selalu berbanding lurus dengan total nilai penjualan (revenue) yang dihasilkan.

Kategori Intimates dan Jeans memang secara konsisten menduduki peringkat teratas, baik dari segi kuantitas maupun nilai penjualan. Namun, pola ini tidak berlaku pada kategori lainnya—seperti Tops & Tees serta Fashion Hoodies—yang memiliki peringkat berbeda antara jumlah unit terjual dan total pendapatannya.
