# UTS Praktikum Pemrograman Mobile - Hunter Quest App ⚔️

Project ini dibuat untuk memenuhi tugas **UTS Praktikum Pemrograman Mobile Semester 6**. Aplikasi ini bertema "Hunter & Guild" dengan fitur utama pendaftaran Hunter dan pengelolaan Quest misi.
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
**Status**: Tugas UTS Prak Mobile 
