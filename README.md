# nexMedis_nodejs

Tes NexMedis Node.js

Link soal:
https://docs.google.com/document/d/1jeS6oRazYuaM-miNODN20Aagsia-i0c9/edit?tab=t.0

## 1 & 2. Query SQL

---

## 3. Logika Pembagian Bola

---

## 4. Struktur Database (ERD)

Berikut adalah entitas dan relasi dalam sistem **Point of Sale (POS) dan Inventori**:

| **ENTITAS**      | **ATRIBUT**            | **KETERANGAN**                         |
| ---------------- | ---------------------- | -------------------------------------- |
| **CUSTOMER**     | `CUSTOMER_ID` (PK)     | ID unik pelanggan                      |
|                  | `NAME`                 | Nama pelanggan                         |
|                  | `PHONE_NUMBER`         | Nomor telepon pelanggan                |
| **SALES**        | `SALES_ID` (PK)        | ID unik transaksi penjualan            |
|                  | `CUSTOMER_ID` (FK)     | ID pelanggan yang melakukan transaksi  |
|                  | `DATE`                 | Tanggal transaksi                      |
|                  | `TOTAL_AMOUNT`         | Total harga transaksi                  |
| **SALES_DETAIL** | `SALES_DETAIL_ID` (PK) | ID unik detail transaksi               |
|                  | `SALES_ID` (FK)        | ID transaksi terkait                   |
|                  | `PRODUCT_ID` (FK)      | ID produk yang dibeli                  |
|                  | `QUANTITY`             | Jumlah produk yang dibeli              |
|                  | `SUBTOTAL`             | Total harga untuk produk tersebut      |
| **PAYMENT**      | `PAYMENT_ID` (PK)      | ID unik pembayaran                     |
|                  | `SALES_ID` (FK)        | ID transaksi yang dibayar              |
|                  | `PAYMENT_METHOD`       | Metode pembayaran (cash, credit, dll.) |
|                  | `AMOUNT_PAID`          | Jumlah uang yang dibayarkan            |
|                  | `CHANGE`               | Kembalian jika ada                     |
| **PRODUCT**      | `PRODUCT_ID` (PK)      | ID unik produk                         |
|                  | `NAME`                 | Nama produk                            |
|                  | `CATEGORY_ID` (FK)     | ID kategori produk                     |
|                  | `PRICE`                | Harga produk                           |
|                  | `STOCK`                | Jumlah stok tersedia                   |
|                  | `SUPPLIER_ID` (FK)     | ID pemasok produk                      |
| **CATEGORY**     | `CATEGORY_ID` (PK)     | ID unik kategori produk                |
|                  | `CATEGORY_NAME`        | Nama kategori                          |
| **SUPPLIER**     | `SUPPLIER_ID` (PK)     | ID unik pemasok                        |
|                  | `SUPPLIER_NAME`        | Nama pemasok                           |
|                  | `CONTACT_INFO`         | Informasi kontak pemasok               |
| **INVENTORY**    | `INVENTORY_ID` (PK)    | ID unik inventori                      |
|                  | `PRODUCT_ID` (FK)      | ID produk terkait                      |
|                  | `STOCK_IN`             | Jumlah barang masuk                    |
|                  | `STOCK_OUT`            | Jumlah barang keluar                   |
|                  | `CURRENT_STOCK`        | Stok terkini produk                    |

### **Relasi Utama:**

1. **CUSTOMER → SALES** (_One-to-Many_): Setiap pelanggan bisa memiliki banyak transaksi.
2. **SALES → SALES_DETAIL** (_One-to-Many_): Satu transaksi terdiri dari beberapa detail transaksi.
3. **SALES → PAYMENT** (_One-to-One_): Setiap transaksi memiliki satu pembayaran.
4. **SALES_DETAIL → PRODUCT** (_Many-to-One_): Detail transaksi berisi informasi produk yang dibeli.
5. **PRODUCT → CATEGORY** (_Many-to-One_): Setiap produk berada dalam satu kategori.
6. **PRODUCT → SUPPLIER** (_Many-to-One_): Setiap produk memiliki satu pemasok.
7. **PRODUCT → INVENTORY** (_One-to-One_): Setiap produk memiliki satu catatan inventori.

---
