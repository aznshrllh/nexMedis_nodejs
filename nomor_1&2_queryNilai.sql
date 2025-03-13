-- Struktur Tabel
CREATE TABLE mahasiswa (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(50),
    alamat VARCHAR(100),
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('L', 'P')),
    umur INT,
    no_telepon VARCHAR(15)
);

CREATE TABLE nilai (
    nim VARCHAR(10),
    kode_mk VARCHAR(10),
    nama_mk VARCHAR(50),
    nilai_angka INT CHECK (nilai_angka BETWEEN 0 AND 100),
    nilai_huruf CHAR(1),
    PRIMARY KEY (nim, kode_mk),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Soal nomor 1
SELECT 
    m.nim, 
    m.nama, 
    MAX(n.nilai_angka) AS nilai_tertinggi,
    MIN(n.nilai_angka) AS nilai_terendah,
    ROUND(AVG(n.nilai_angka), 2) AS nilai_rata_rata,
    COUNT(n.kode_mk) AS jumlah_mata_kuliah,
    (
        SELECT n1.nama_mk 
        FROM nilai n1 
        WHERE n1.nim = m.nim 
        ORDER BY n1.nilai_angka DESC 
        LIMIT 1
    ) AS mata_kuliah_dengan_nilai_tertinggi
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim
GROUP BY m.nim, m.nama;

-- Soal nomor 2
SELECT 
    n.kode_mk,
    n.nama_mk,
    COUNT(CASE WHEN n.nilai_huruf IN ('A', 'B') THEN 1 END) AS jumlah_mahasiswa_nilai_A_B,
    ROUND(
        AVG(CASE WHEN m.umur > 20 AND m.umur < 22 THEN n.nilai_angka END), 2
    ) AS rata_rata_mahasiswa_umur_21
FROM nilai n
JOIN mahasiswa m ON n.nim = m.nim
GROUP BY n.kode_mk, n.nama_mk;
