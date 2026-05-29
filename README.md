# GoRoyo — Sistem Tanggap Cepat Berbasis Warga

> **"Dari warga, untuk warga. Gotong royong dalam genggaman."**

![Demo Badge](https://img.shields.io/badge/status-demo%20konsep-orange)
![JuaraVibeCoding](https://img.shields.io/badge/%23JuaraVibeCoding-Google-4285F4)
![License](https://img.shields.io/badge/license-MIT-green)

---

## ⚠️ Catatan Penting

> **Ini adalah demo konsep** yang dibuat untuk kompetisi **#JuaraVibeCoding by Google**.
>
> Aplikasi ini mendemonstrasikan visi dan alur kerja GoRoyo dalam bentuk prototype interaktif satu halaman. **Pengembangan full app** membutuhkan waktu yang lebih panjang, tim pengembang, infrastruktur backend, dan investasi yang lebih besar.
>
> Nomor telepon, data petugas, dan informasi RT/RW yang tampil bersifat **ilustratif** dan bukan data nyata.

---

## Tentang GoRoyo

GoRoyo (singkatan dari **Gotong Royong**) adalah konsep platform tanggap darurat berbasis komunitas RT/RW Indonesia. Terinspirasi dari nilai gotong royong dan pengalaman nyata kerja di lapangan mitigasi bencana PMI.

**Masalah yang coba diselesaikan:**
- Warga kesulitan menghubungi petugas lokal saat darurat
- Tidak ada panduan cepat yang kontekstual saat bencana
- Informasi pengumuman RT/RW tersebar tidak terstruktur
- Koordinasi petugas siskamling masih manual

**Solusi:**
Tombol darurat satu ketuk → notifikasi ke petugas lokal → panduan AI kontekstual → info petugas siaga.

---

## Fitur Demo (MVP)

| Fitur | Deskripsi |
|-------|-----------|
| 🔴 Tombol Darurat | 6 kategori: Kebakaran, Banjir, Medis, Keamanan, Gas Bocor, Gempa |
| 🤖 Panduan AI | Gemini 2.0 Flash generate panduan kontekstual berdasarkan jenis darurat & waktu kejadian |
| 👮 Petugas Siaga | Status shift & kontak langsung 3 petugas siskamling |
| 📢 Pengumuman | Papan informasi RT/RW dengan kategori |
| 📱 PWA-ready | Responsif untuk mobile, bisa diakses offline (data statis) |

---

## Teknologi

```
Frontend   : HTML5 + CSS3 + Vanilla JavaScript
AI         : Google Gemini 2.0 Flash API (via AI Studio)
Font       : Plus Jakarta Sans + Syne (Google Fonts)
Deploy     : GitHub Pages / Firebase Hosting
```

---

## Cara Menjalankan Demo

### 1. Clone repository
```bash
git clone https://github.com/[username]/goroyo.git
cd goroyo
```

### 2. Buka di browser
```bash
# Langsung buka file
open index.html

# Atau gunakan live server (VS Code extension)
# Atau Python simple server:
python -m http.server 8000
```

### 3. Aktifkan fitur AI (opsional)
1. Kunjungi [aistudio.google.com](https://aistudio.google.com)
2. Login dengan akun Google → klik **"Get API Key"**
3. Salin API key (format: `AIzaSy...`)
4. Masukkan di banner kuning di atas aplikasi → klik **Simpan**
5. Sekarang setiap tombol darurat akan menghasilkan panduan AI yang kontekstual!

> Tanpa API key, panduan statis offline tetap tersedia.

---

## Struktur Folder

```
goroyo/
├── index.html          # Aplikasi utama (single-file demo)
└── README.md           # Dokumentasi ini
```

---

## Roadmap Pengembangan (Full App)

### MVP Lanjutan (3–6 bulan)
- [ ] Sistem autentikasi warga & petugas (role-based)
- [ ] Push notification real ke HP petugas (Firebase FCM)
- [ ] Form laporan warga dengan foto & lokasi GPS
- [ ] Pusat edukasi offline (PDF lokal: P3K, APAR, evakuasi)
- [ ] Chat assistant berbasis keyword retrieval (offline-first)

### V2 (6–12 bulan)
- [ ] Peta mitigasi bencana (OpenStreetMap + Leaflet)
- [ ] Transparansi keuangan RT/RW sederhana
- [ ] Sistem shift & manajemen petugas
- [ ] Early Warning System (integrasi BMKG)
- [ ] Mode Krisis (UI berubah otomatis saat bencana besar)

### V3 (12+ bulan)
- [ ] Sistem ketahanan pangan RT (kebun, kolam lele, urban farming)
- [ ] Gamifikasi petugas (badge & reward digital)
- [ ] Dashboard statistik RT/RW
- [ ] Sinkronisasi lintas RW & kelurahan
- [ ] Integrasi BNPB, PMI, Basarnas

---

## Arsitektur Full App (Konsep)

```
┌─────────────────────────────────────────────┐
│              GoRoyo App                     │
├─────────────┬───────────────┬───────────────┤
│   Warga     │   Petugas     │   RT/RW Admin │
│  (Darurat,  │  (Dashboard,  │  (Pengumuman, │
│  Laporan,   │   Status,     │   Keuangan,   │
│  Edukasi)   │   Respon)     │   Statistik)  │
└─────────────┴───────────────┴───────────────┘
         │              │              │
         ▼              ▼              ▼
┌─────────────────────────────────────────────┐
│            Firebase Backend                 │
│  Firestore │ FCM │ Auth │ Hosting           │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│         Offline-First Layer                 │
│  IndexedDB │ Local Knowledge │ Service Worker│
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│           AI Layer (Optional)               │
│  Gemini API │ Rule Engine │ Keyword Search  │
└─────────────────────────────────────────────┘
```

---

## Estimasi Biaya (Pilot Kecil, 1 RT)

| Komponen | Biaya |
|----------|-------|
| Firebase Spark Plan | Gratis |
| GitHub Pages / Vercel | Gratis |
| Gemini API (kuota gratis) | Gratis |
| OpenStreetMap + Leaflet | Gratis |
| **Total pilot awal** | **~Rp 0/bulan** |

Biaya mulai muncul saat scaling ke ratusan RT atau menggunakan SMS gateway.

---

## Filosofi Desain

GoRoyo dibangun dengan prinsip:

- **Offline-first** — tetap berfungsi saat internet terbatas atau mati
- **Hyperlocal** — berbasis kondisi nyata RT/RW setempat
- **Lightweight** — berjalan di HP Android low-end
- **Community-driven** — warga sebagai first responder, teknologi sebagai enabler
- **Manusiawi** — bukan sekadar app darurat, tapi ekosistem gotong royong digital

---

## Latar Belakang Pembuatan

Dibuat dengan semangat pengalaman nyata di lapangan:
- Latar belakang kerja di **Mitigasi Bencana PMI**
- Keprihatinan terhadap minimnya sistem tanggap darurat di level RT/RW
- Keyakinan bahwa teknologi sederhana bisa menyelamatkan nyawa

---

## Kredit & Acknowledgment

- Konsep dikembangkan dengan bantuan AI (ChatGPT, Google Gemini, Claude)
- Panduan darurat dikembangkan berdasarkan standar PMI & BNPB
- Dibuat untuk **#JuaraVibeCoding by Google** — event vibe coding komunitas Indonesia

---

## Lisensi

MIT License — bebas digunakan, dimodifikasi, dan dikembangkan untuk kepentingan komunitas.

---

*GoRoyo — Karena dalam kedaruratan, tetangga adalah pertolongan pertama.*

## 👤 Author

**[Wahid S. Darmadi]**
- GitHub: [@whddarmadi](https://github.com/whddarmadi)
- LinkedIn: [linkedin.com/in/whddarmadi](https://linkedin.com/in/whddarmadi)
- Instagram: [@wahwahcreative] (https://www.instagram.com/wahwahcreative/)
