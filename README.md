# UTS Praktikum Pemrograman Mobile - Hunter Quest App ⚔️

Project ini dibuat untuk memenuhi tugas **UTS Praktikum Pemrograman Mobile Semester 6**. Aplikasi ini bertema "Hunter & Guild" dengan fitur utama pendaftaran Hunter dan pengelolaan Quest misi.

## 📋 Pemenuhan Instruksi Tugas

Aplikasi ini telah memenuhi seluruh kriteria yang ditetapkan dalam instruksi UTS:

1.  **Register Page**:
    *   Input yang tersedia: **Nama, Password, Level, Rank, dan Job**.
    *   **Validasi Input**:
        *   Nama: Tidak boleh kosong.
        *   Password: Minimal terdiri dari 8 karakter.
        *   Level: Hanya boleh diisi angka (Numeric validation).
        *   Rank: Hanya boleh diisi huruf (Regex validation).
2.  **Integrasi Header**:
    *   Seluruh data dari Register Page dikirim dan ditampilkan pada **Header Widget** di Home Page (Nama, Level, Rank, Job).
3.  **Data Quest**:
    *   Data misi sudah lengkap terdiri dari: **Title, Rank, Reward, Image, dan Description**.
4.  **List Quest**:
    *   Menampilkan **Icon Status** (untuk membedakan quest diambil atau belum), **Title**, dan **Rank**.
5.  **Halaman Detail Quest**:
    *   Dibuat halaman baru bernama `DetailQuestPage`.
    *   Menampilkan **seluruh data** misi secara lengkap.
    *   Terdapat tombol **"Ambil Quest"** di bagian bawah.
6.  **Logika Status Quest**:
    *   Ketika tombol "Ambil Quest" diklik, status quest akan berubah secara otomatis.
    *   Icon pada daftar quest yang awalnya bulat/panah akan berubah menjadi **Checklist (Centang)**.

## 🚀 Fitur Tambahan (Kreativitas)

*   **Tema Solo Leveling**: Menggunakan desain premium bertema *Dark Mode* dengan aksen *Electric Blue*.
*   **Progress Bar Stats**: Statistik HP, MP, dan STR Hunter divisualisasikan dengan Progress Bar.
*   **Tab Filtering**: Quest dibagi menjadi kategori *Semua, Aktif,* dan *Selesai* untuk UX yang lebih baik.
*   **Hero Animation**: Transisi gambar yang mulus saat berpindah ke halaman detail.

## 📂 Struktur Project

```text
lib/
├── models/
│   ├── quest_model.dart  # Data model Quest
│   └── user_model.dart   # Data model Hunter (dari Register)
├── pages/
│   ├── register_page.dart # Implementasi Form & Validasi
│   ├── home_page.dart     # Dashboard & List Quest (Tab System)
│   └── detail_quest_page.dart # Halaman Detail & Logic "Ambil Quest"
├── widgets/
│   ├── header_widget.dart # Widget profil data Hunter
│   ├── quest_widget.dart  # Widget item list quest dengan Icon Status
│   └── chip_widget.dart   # Widget statistik tambahan
└── main.dart              # Konfigurasi Tema & Entry Point
```

## 🛠️ Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstal.
2. Clone repo: `https://github.com/vitogunawan18/UTS_Praktikum_Mobile.git`
3. Jalankan `flutter pub get`
4. Jalankan `flutter run`

---
**Status**: Tugas UTS Prak Mobile - Selesai sesuai instruksi.
