# GoRoyo — Sistem Tanggap Cepat Berbasis Warga

> **"Dari warga, untuk warga. Gotong royong dalam genggaman."**

![Demo Badge](https://img.shields.io/badge/status-demo%20konsep-orange)
![JuaraVibeCoding](https://img.shields.io/badge/%23JuaraVibeCoding-Google-4285F4)
![License](https://img.shields.io/badge/license-MIT-green)
![Cloud Run](https://img.shields.io/badge/deploy-Cloud%20Run-4285F4?logo=googlecloud)

🌐 **Live Demo:** [nginx-app-596656023692.asia-southeast2.run.app](https://nginx-app-596656023692.asia-southeast2.run.app)

---

## ⚠️ Catatan Penting

> **Ini adalah demo konsep** yang dibuat untuk kompetisi **#JuaraVibeCoding by Google**.
>
> Aplikasi ini mendemonstrasikan visi dan alur kerja GoRoyo dalam bentuk prototype interaktif satu halaman. **Pengembangan full app** membutuhkan waktu yang lebih panjang, tim pengembang, infrastruktur backend, dan investasi yang lebih besar.
>
> Data petugas, nomor RT/RW, dan informasi warga yang tampil bersifat **ilustratif** dan bukan data nyata.

---

## Tentang GoRoyo

**GoRoyo** (singkatan dari **Gotong Royong**) adalah konsep platform tanggap darurat berbasis komunitas RT/RW Indonesia. Terinspirasi dari nilai gotong royong dan pengalaman nyata kerja di lapangan mitigasi bencana bersama PMI.

### Masalah yang Coba Diselesaikan
- Warga kesulitan menghubungi petugas lokal saat darurat
- Tidak ada panduan cepat yang kontekstual saat bencana terjadi
- Informasi pengumuman RT/RW tersebar tidak terstruktur
- Koordinasi petugas siskamling masih manual dan lambat
- Minimnya edukasi siaga bencana di level komunitas

### Solusi
Tombol darurat satu ketuk → panduan AI kontekstual via Gemini → notifikasi petugas lokal → edukasi offline → laporan warga → info komunitas RT/RW.

---

## Fitur Demo (MVP)

| Fitur | Deskripsi |
|-------|-----------|
| 🔴 **Tombol Darurat** | 8 kategori: Kebakaran, Banjir, Medis, Keamanan, Gas Bocor, Gempa, Listrik PLN, Konsultasi Psikologis |
| 🤖 **Panduan AI** | Gemini 2.0 Flash generate panduan kontekstual berdasarkan jenis darurat & waktu kejadian |
| 👮 **Petugas Siaga** | Status shift & kontak langsung 3 petugas siskamling |
| 📢 **Pengumuman** | Papan informasi RT/RW dengan kategori |
| 📋 **Laporan Warga** | Form laporan 6 kategori (anonim/terbuka) dengan riwayat laporan |
| 📚 **Pusat Edukasi** | 13 panduan lengkap: CPR, APAR, banjir, gempa, DBD, rabies, urban farming, dll — searchable |
| 🌱 **Urban Farming RT** | 4 panduan ketahanan pangan: sayur pekarangan, kompos dapur, budikdamber lele, apotek hidup |
| 🧠 **Kesehatan Mental** | Tombol akses cepat ke layanan psikologis Puskesmas Kecamatan |
| 👤 **Profil & Nomor Darurat** | Info warga, lokasi RT/RW, 8 nomor darurat lengkap termasuk PLN, PMI, dan Puskesmas |
| 📱 **Mobile-friendly** | Responsif untuk HP, dioptimalkan untuk penggunaan satu tangan |

---

## Teknologi

```
Frontend   : HTML5 + CSS3 + Vanilla JavaScript (single file, no framework)
AI         : Google Gemini 2.0 Flash API (via Google AI Studio)
Server     : Nginx (Alpine)
Container  : Docker
Deploy     : Google Cloud Run (asia-southeast2 / Jakarta)
Font       : Plus Jakarta Sans + Urbanist (Google Fonts)
```

---

## Cara Menjalankan Secara Lokal

### Opsi 1 — Buka langsung di browser
```bash
# Clone repo
git clone https://github.com/whddarmadi/goroyo.git
cd goroyo

# Buka di browser (Windows)
start index.html

# Buka di browser (Mac)
open index.html
```

### Opsi 2 — Pakai Docker (sama seperti di Cloud Run)
```bash
docker build -t goroyo .
docker run -p 8080:8080 goroyo
# Buka http://localhost:8080
```

### Aktifkan Fitur AI (Opsional tapi Direkomendasikan)
1. Kunjungi [aistudio.google.com](https://aistudio.google.com)
2. Login dengan akun Google → klik **"Get API Key"** → **"Create API key"**
3. Salin API key (format: `AIzaSy...`)
4. Masukkan di banner kuning dalam aplikasi → klik **Simpan**
5. Setiap tombol darurat sekarang menghasilkan panduan AI yang kontekstual berdasarkan waktu kejadian!

> Tanpa API key, panduan statis offline tetap tersedia untuk semua kategori darurat.

---

## Deploy ke Google Cloud Run

### Prasyarat
- Akun Google Cloud dengan billing aktif / kredit JuaraVibeCoding
- Docker terinstall di komputer
- Google Cloud CLI (`gcloud`) terinstall

### Langkah Deploy

**1. Login dan setup project**
```bash
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
```
> Cek Project ID di [console.cloud.google.com](https://console.cloud.google.com) — pojok kiri atas

**2. Aktifkan layanan yang dibutuhkan**
```bash
gcloud services enable run.googleapis.com
gcloud services enable containerregistry.googleapis.com
```

**3. Build dan push Docker image**
```bash
# Ganti YOUR_PROJECT_ID dengan project ID kamu
docker build -t gcr.io/YOUR_PROJECT_ID/goroyo .
docker push gcr.io/YOUR_PROJECT_ID/goroyo
```

**4. Deploy ke Cloud Run**
```bash
gcloud run deploy goroyo \
  --image gcr.io/YOUR_PROJECT_ID/goroyo \
  --platform managed \
  --region asia-southeast2 \
  --allow-unauthenticated \
  --port 8080 \
  --memory 256Mi
```

## Struktur Folder

```
goroyo/
├── index.html       ← Aplikasi utama (single-file PWA)
├── Dockerfile       ← Container config untuk Cloud Run
├── nginx.conf       ← Web server config (port 8080)
├── deploy.sh        ← Script deploy otomatis
├── README.md        ← Dokumentasi ini
└── .gitignore
```

---

## Roadmap Pengembangan (Full App)

### MVP Lanjutan (3–6 bulan)
- [ ] Sistem autentikasi warga & petugas (role: warga / petugas / RT-RW / admin)
- [ ] Push notification real ke HP petugas (Firebase Cloud Messaging)
- [ ] Laporan warga tersimpan ke database (Firebase Firestore)
- [ ] Chat assistant berbasis keyword retrieval (offline-first, tanpa LLM)
- [ ] Peta mitigasi bencana (OpenStreetMap + Leaflet)

### V2 (6–12 bulan)
- [ ] Transparansi keuangan RT/RW (iuran, CSR, hibah)
- [ ] Sistem shift & manajemen jadwal petugas
- [ ] Early Warning System (integrasi BMKG)
- [ ] Mode Krisis (UI darurat otomatis saat bencana besar)
- [ ] Gamifikasi petugas (badge & reward digital)

### V3 (12+ bulan)
- [x] ~~Sistem ketahanan pangan RT (kebun, kolam lele, urban farming)~~ ✅ Sudah ada di Pusat Edukasi
- [ ] Dashboard statistik RT/RW untuk pengambilan keputusan
- [ ] Sinkronisasi lintas RW & kelurahan
- [ ] Integrasi BNPB, PMI, Basarnas untuk konten edukasi resmi
- [ ] AI offline ringan untuk klasifikasi laporan warga

---

## Estimasi Biaya (Pilot Kecil, 1 RT)

| Komponen | Biaya |
|----------|-------|
| Google Cloud Run (traffic rendah) | Gratis (free tier) |
| Firebase Spark Plan | Gratis |
| Gemini API (kuota gratis) | Gratis |
| OpenStreetMap + Leaflet | Gratis |
| **Total pilot awal** | **~Rp 0/bulan** |

Biaya mulai muncul saat scaling ke ratusan RT atau menggunakan SMS gateway dan fitur AI intensif.

---

## Arsitektur Full App (Konsep)

```
┌─────────────────────────────────────────────┐
│              GoRoyo App (PWA)               │
├─────────────┬───────────────┬───────────────┤
│   Warga     │   Petugas     │   RT/RW Admin │
│  Darurat,   │  Dashboard,   │  Pengumuman,  │
│  Laporan,   │  Status,      │  Keuangan,    │
│  Edukasi    │  Respon       │  Statistik    │
└─────────────┴───────────────┴───────────────┘
                     │
         ┌───────────┴───────────┐
         ▼                       ▼
┌─────────────────┐   ┌─────────────────────┐
│ Firebase Backend│   │   Offline-First     │
│ Firestore + FCM │   │ IndexedDB + Cache   │
│ Auth + Hosting  │   │ Knowledge Base PDF  │
└─────────────────┘   └─────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│           AI Layer (Optional)               │
│  Gemini API │ Rule Engine │ Keyword Search  │
└─────────────────────────────────────────────┘
```

---

## Filosofi Desain

GoRoyo dibangun dengan prinsip:

- **Offline-first** — tetap berfungsi saat internet terbatas atau mati
- **Hyperlocal** — berbasis kondisi nyata RT/RW setempat
- **Lightweight** — berjalan di HP Android low-end sekalipun
- **Community-driven** — warga sebagai first responder, teknologi sebagai enabler
- **Manusiawi** — bukan sekadar app darurat, tapi ekosistem gotong royong digital

---

## Latar Belakang Pembuatan

Dibuat dengan semangat pengalaman nyata di lapangan:
- Latar belakang kerja di Mitigasi Bencana PMI
- Keprihatinan terhadap minimnya sistem tanggap darurat di level RT/RW Indonesia
- Keyakinan bahwa teknologi sederhana, lokal, dan manusiawi bisa menyelamatkan nyawa

---

## Kredit & Acknowledgment

- Konsep dikembangkan dengan bantuan AI (AI Studio, Antigravity, ChatGPT, Google Gemini, Claude)
- Panduan darurat mengacu pada standar PMI, BNPB, dan Kemenkes RI
- Dibuat untuk **#JuaraVibeCoding by Google** — event vibe coding komunitas Indonesia

---

## Lisensi

MIT License — bebas digunakan, dimodifikasi, dan dikembangkan untuk kepentingan komunitas.

---

*GoRoyo — Karena dalam kedaruratan, tetangga adalah andalan pertama.*

---

## 👤 Author

**[Wahid S. Darmadi]**
- GitHub: [@whddarmadi](https://github.com/whddarmadi)
- LinkedIn: [linkedin.com/in/whddarmadi](https://linkedin.com/in/whddarmadi)
- Instagram: [@wahwahcreative](https://www.instagram.com/wahwahcreative/)

---