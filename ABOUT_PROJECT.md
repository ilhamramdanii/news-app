# Dokumentasi Proyek: NewsApp

Aplikasi ini adalah platform berita dan kampanye komprehensif yang dibangun menggunakan Flutter. Proyek ini mendemonstrasikan implementasi arsitektur perangkat lunak berstandar industri (*Clean Architecture*), state management modern, dan integrasi fitur kompleks seperti *offline storage* dan layanan Firebase.

---

## 🛠 Tech Stack yang Digunakan

Proyek ini dibangun menggunakan teknologi dan *packages* modern:

- **Framework:** Flutter & Dart
- **Arsitektur:** Clean Architecture (Data, Domain, Presentation Layers)
- **State Management:** `flutter_bloc` (BLoC Pattern)
- **Dependency Injection (DI):** `get_it` dikombinasikan dengan `injectable` (untuk inisiasi service dan repository secara otomatis dan terpusat).
- **Networking (HTTP Client):** `dio` (digunakan untuk melakukan request ke NewsAPI).
- **Local Storage (Offline Database):** `hive` & `hive_flutter` (penyimpanan NoSQL yang sangat cepat untuk fitur *Bookmark* artikel offline).
- **Routing & Navigasi:** `go_router` (sistem navigasi berbasis URL/Path modern di Flutter).
- **Image Caching:** `cached_network_image` (menyimpan gambar sementara agar hemat kuota dan memuat lebih cepat).
- **Eksternal URL Launcher:** `url_launcher` (membuka artikel asli di web browser HP).
- **Backend Services:** `firebase_core`, `firebase_messaging` (Push Notification), `firebase_remote_config` (Dynamic Campaign Banner).

---

## ✨ Fitur-Fitur Aplikasi

1. **📰 News Feed (Berita Utama)**
   Mengambil data secara real-time dari *NewsAPI* (`/top-headlines`). Menampilkan gambar sampul, judul, tanggal, dan penulis dengan desain *card* yang responsif.
   
2. **🔍 Fitur Search (Pencarian Berita)**
   Pengguna dapat mencari artikel berita tertentu menggunakan kata kunci (terintegrasi dengan endpoint `/everything` dari NewsAPI). Tampilan kolom pencarian otomatis beradaptasi dengan *Dark/Light Theme*.

3. **🔖 Bookmark Offline (Tersimpan)**
   Artikel yang disukai dapat disimpan menggunakan tombol Bookmark. Data ini langsung masuk ke dalam *Hive Database*. Hebatnya, artikel yang di-bookmark bisa tetap dilihat dan dibaca kapan saja **meskipun HP sedang tidak ada internet (offline)**.

4. **👤 Autentikasi (Mock Login & Profile)**
   Terdapat alur login (email: `test@example.com`, password: `password`). BLoC mengatur perubahan layar (State) dari form login menjadi "Halaman Profil" (*Smart UI Routing*). Setelah berhasil login, aplikasi otomatis akan...

5. **🔔 Notifikasi Pintar (Firebase Cloud Messaging - FCM)**
   Meminta izin pengiriman notifikasi (*Permission Popup*) **hanya** setelah pengguna sukses login, sehingga lebih ramah privasi.

6. **📢 Dynamic Campaign Banner (Firebase Remote Config)**
   Banner promosi di halaman utama (*NewsApp Premium*) yang dikendalikan oleh *Firebase Remote Config*. Artinya, warna atau tulisan promo dapat diubah kapan saja lewat *Firebase Console* tanpa perlu memperbarui aplikasi di PlayStore.

7. **🔗 Read Full Article**
   Karena batasan gratis dari *NewsAPI* yang hanya memotong konten (maksimal 200 karakter beserta `[+1234 chars]`), tersedia opsi tombol **"Read Full Article on Source"** di halaman Detail untuk membuka berita versi lengkap langsung di browser bawaan HP.

---

## 🚀 Cara Menjalankan Aplikasi

Berikut adalah instruksi langkah demi langkah untuk menjalankan aplikasi ini:

### 1. Persiapan Awal
Pastikan Anda sudah berada di dalam folder proyek melalui terminal:
```bash
cd news_app
```

Lalu, ambil semua dependensi yang dibutuhkan:
```bash
flutter pub get
```

### 2. Code Generation (Wajib!)
Karena aplikasi ini menggunakan `injectable` (DI) dan `hive` (Database), kita perlu melakukan regenerasi file `.g.dart` dan `injection.config.dart`. Tanpa langkah ini, aplikasi **tidak akan bisa berjalan**.
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Setup NewsAPI
1. Daftar ke [NewsAPI.org](https://newsapi.org/) dan dapatkan API Key Anda.
2. Buka file `lib/features/news/data/datasources/news_remote_ds.dart`.
3. Ganti teks `'YOUR_NEWS_API_KEY'` pada variabel `_apiKey` dengan kode API milik Anda.

### 4. Setup Firebase (Opsional, Untuk Fitur Notifikasi)
Jika Anda ingin mengetes notifikasi (FCM) dan Remote Config:
1. Buat proyek baru di [Firebase Console](https://console.firebase.google.com/).
2. Daftarkan aplikasi Android/iOS Anda.
3. Download file `google-services.json` (untuk Android) dan taruh di folder `android/app/`.
4. Download file `GoogleService-Info.plist` (untuk iOS) dan taruh di folder `ios/Runner/` lewat Xcode.
*(Catatan: Jika ini tidak dilakukan, sistem sudah dilengkapi try-catch sehingga aplikasi tidak akan crash, namun fitur notifikasi akan diskip).*

### 5. Menjalankan di Perangkat/Emulator
Pastikan HP Anda sudah dicolok dan *USB Debugging* aktif, atau Emulator sudah menyala.
Cek perangkat dengan perintah:
```bash
flutter devices
```

Lalu jalankan aplikasinya:
```bash
flutter run
```

> **Tips:** Gunakan tombol `r` di terminal untuk melakukan *Hot Reload* setiap kali Anda mengubah kode UI, tanpa perlu compile ulang yang memakan waktu.

Selamat mengeksplorasi NewsApp! Proyek ini dirancang kuat sebagai portofolio kelas atas.
