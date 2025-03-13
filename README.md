# nexMedis_nodejs

Tes NexMedis Node.js

## 1 & 2. Query SQL

### **Menampilkan Data Nilai Mahasiswa**

```sql
SELECT
    m.nim,
    m.nama,
    MAX(n.nilai_angka) AS nilai_tertinggi,
    MIN(n.nilai_angka) AS nilai_terendah,
    ROUND(AVG(n.nilai_angka), 2) AS nilai_rata_rata,
    COUNT(n.kode_mk) AS jumlah_mata_kuliah,
    (SELECT nama_mk FROM nilai WHERE nilai_angka = MAX(n.nilai_angka) LIMIT 1) AS mata_kuliah_tertinggi
FROM
    mahasiswa m
JOIN
    nilai n
ON
    m.nim = n.nim
GROUP BY
    m.nim, m.nama;
```

---

## 3. Logika Pembagian Bola

Mulai → Bagi 9 bola menjadi 3 grup (3 bola, 3 bola, 3 bola)
|
|— Bandingkan Grup 1 dan Grup 2 dengan timbangan:
| |— Jika berat sama → Bola berat ada di Grup 3
| |— Jika berat tidak sama → Ambil grup yang lebih berat
|
|— Ambil grup yang lebih berat → Pilih 2 bola dan timbang
| |— Jika berat sama → Bola ketiga adalah yang terberat
| |— Jika berat tidak sama → Bola yang lebih berat ditemukan
|
Selesai

---

## 4. Struktur Database (ERD)

Berikut adalah entitas dan relasi dalam sistem **Point of Sale (POS) dan Inventori**:

| **Entitas**      | **Atribut**            | **Keterangan**                         |
| ---------------- | ---------------------- | -------------------------------------- |
| **Customer**     | `customer_id` (PK)     | ID unik pelanggan                      |
|                  | `name`                 | Nama pelanggan                         |
|                  | `phone_number`         | Nomor telepon pelanggan                |
| **Sales**        | `sales_id` (PK)        | ID unik transaksi penjualan            |
|                  | `customer_id` (FK)     | ID pelanggan yang melakukan transaksi  |
|                  | `date`                 | Tanggal transaksi                      |
|                  | `total_amount`         | Total harga transaksi                  |
| **Sales_Detail** | `sales_detail_id` (PK) | ID unik detail transaksi               |
|                  | `sales_id` (FK)        | ID transaksi terkait                   |
|                  | `product_id` (FK)      | ID produk yang dibeli                  |
|                  | `quantity`             | Jumlah produk yang dibeli              |
|                  | `subtotal`             | Total harga untuk produk tersebut      |
| **Payment**      | `payment_id` (PK)      | ID unik pembayaran                     |
|                  | `sales_id` (FK)        | ID transaksi yang dibayar              |
|                  | `payment_method`       | Metode pembayaran (cash, credit, dll.) |
|                  | `amount_paid`          | Jumlah uang yang dibayarkan            |
|                  | `change`               | Kembalian jika ada                     |
| **Product**      | `product_id` (PK)      | ID unik produk                         |
|                  | `name`                 | Nama produk                            |
|                  | `category_id` (FK)     | ID kategori produk                     |
|                  | `price`                | Harga produk                           |
|                  | `stock`                | Jumlah stok tersedia                   |
|                  | `supplier_id` (FK)     | ID pemasok produk                      |
| **Category**     | `category_id` (PK)     | ID unik kategori produk                |
|                  | `category_name`        | Nama kategori                          |
| **Supplier**     | `supplier_id` (PK)     | ID unik pemasok                        |
|                  | `supplier_name`        | Nama pemasok                           |
|                  | `contact_info`         | Informasi kontak pemasok               |
| **Inventory**    | `inventory_id` (PK)    | ID unik inventori                      |
|                  | `product_id` (FK)      | ID produk terkait                      |
|                  | `stock_in`             | Jumlah barang masuk                    |
|                  | `stock_out`            | Jumlah barang keluar                   |
|                  | `current_stock`        | Stok terkini produk                    |

### **Relasi Utama:**

1. **Customer → Sales** (_One-to-Many_): Setiap pelanggan bisa memiliki banyak transaksi.
2. **Sales → Sales_Detail** (_One-to-Many_): Satu transaksi terdiri dari beberapa detail transaksi.
3. **Sales → Payment** (_One-to-One_): Setiap transaksi memiliki satu pembayaran.
4. **Sales_Detail → Product** (_Many-to-One_): Detail transaksi berisi informasi produk yang dibeli.
5. **Product → Category** (_Many-to-One_): Setiap produk berada dalam satu kategori.
6. **Product → Supplier** (_Many-to-One_): Setiap produk memiliki satu pemasok.
7. **Product → Inventory** (_One-to-One_): Setiap produk memiliki satu catatan inventori.

---
