# UTS Praktikum Pemrograman Mobile - Hunter Quest App 

Project ini adalah aplikasi berbasis Flutter bertema "Hunter & Guild" (terinspirasi dari Solo Leveling) yang dibuat untuk tugas UTS Praktikum Pemrograman Mobile Semester 6. Aplikasi ini berfokus pada simulasi pendaftaran Hunter dan pengelolaan misi (Quest) yang interaktif.

##  Fitur Utama Aplikasi

Aplikasi ini memiliki beberapa fitur fungsional dan desain antarmuka yang menarik:

*   **Pendaftaran Hunter (Register Page)**: 
    Halaman awal untuk mendaftarkan karakter. Terdapat form input lengkap meliputi Nama, Password, Level, Rank, dan Job/Kelas. Dilengkapi dengan sistem validasi (contoh: Level hanya bisa diisi angka, Rank hanya bisa huruf, dan batas minimal karakter password).
*   **Profil Hunter Terintegrasi (Home Page)**: 
    Data yang diinputkan pada halaman register akan langsung ditampilkan secara dinamis di Header aplikasi. Header ini juga dilengkapi dengan *Progress Bar* untuk memvisualisasikan status karakter seperti HP, MP, dan STR.
*   **Manajemen Quest (Sistem Tab)**: 
    Daftar misi ditampilkan secara interaktif. Pengguna bisa melihat quest menggunakan sistem *Tab Filtering* untuk memisahkan kategori quest: "Semua", "Aktif", dan "Selesai".
*   **Detail Quest & Tracking Status**: 
    Setiap quest dapat diklik untuk membuka halaman *Detail Quest* yang menampilkan info lengkap (Tingkat bahaya, tipe quest, hadiah, deskripsi). Terdapat tombol "Ambil Quest" yang jika ditekan akan secara otomatis mengubah status quest di halaman utama (icon berubah menjadi centang).

##  Penjelasan Struktur Folder

Aplikasi ini dibangun dengan struktur yang rapi untuk memisahkan logika dan antarmuka:

```text
lib/
├── models/
│   ├── quest_model.dart       # Blueprint data untuk struktur misi (Quest)
│   └── user_model.dart        # Blueprint data untuk menyimpan info profil Hunter
├── pages/
│   ├── register_page.dart     # Halaman formulir pendaftaran beserta validasinya
│   ├── home_page.dart         # Halaman utama (Dashboard profil & Daftar misi)
│   └── detail_quest_page.dart # Halaman rincian misi dan tombol interaksi
├── widgets/
│   ├── header_widget.dart     # Komponen UI khusus untuk menampilkan profil di Home
│   ├── quest_widget.dart      # Komponen UI untuk setiap baris quest di daftar
│   └── chip_widget.dart       # Komponen pendukung untuk elemen statistik
└── main.dart                  # Titik awal aplikasi berjalan & konfigurasi tema warna
```

##  Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstal di perangkat Anda.
2. Clone repo: `git clone https://github.com/vitogunawan18/UTS_Praktikum_Mobile.git`
3. Masuk ke folder project, lalu jalankan perintah: `flutter pub get`
4. Jalankan aplikasi dengan perintah: `flutter run`

---
**Status**: Tugas UTS Praktikum Pemrograman Mobile Semester 6
