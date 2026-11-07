# Tentang Project

## Ringkasan

Kumpulan modul Luau (Roblox) untuk mengamankan game milik sendiri dari exploit dan penyalahgunaan. Semua logika keamanan dijalankan di server, karena client tidak bisa dipercaya.

## Tujuan

- Memvalidasi semua input dari client sebelum dipakai server.
- Mendeteksi perilaku tidak wajar (gerakan, rate, data) dan menanganinya di server.
- Menjaga data pemain (DataStore) tetap konsisten dan tidak bisa dimanipulasi.
- Mencatat kejadian mencurigakan agar bisa ditinjau.

## Ruang Lingkup

Di dalam lingkup:

- Hardening game yang Anda miliki dan kelola sendiri.
- Validasi RemoteEvent dan RemoteFunction di sisi server.
- Anti-exploit sisi server, logging, dan moderasi.

Di luar lingkup:

- Executor, injector, script cheat, atau bypass anti-cheat untuk game orang lain.
- Obfuscation untuk menyembunyikan script.

## Daftar Modul (Rencana)

Status semua modul di bawah masih rencana. Ubah status menjadi "Dibuat" setelah ada kodenya.

| Modul | Lokasi | Fungsi | Status |
|---|---|---|---|
| RemoteValidator | `src/server/RemoteValidator.lua` | Validasi tipe, rentang, dan pemilik pada setiap Remote | Rencana |
| RateLimiter | `src/server/RateLimiter.lua` | Batasi frekuensi panggilan Remote per pemain | Rencana |
| MovementCheck | `src/server/MovementCheck.lua` | Cek kecepatan dan perpindahan tidak wajar di server | Rencana |
| DataStoreGuard | `src/server/DataStoreGuard.lua` | Validasi skema data sebelum simpan, cegah duplikasi | Rencana |
| ExploitLogger | `src/server/ExploitLogger.lua` | Catat kejadian mencurigakan dengan konteks | Rencana |
| ModerationService | `src/server/ModerationService.lua` | Kick atau flag pemain berdasarkan skor pelanggaran | Rencana |

Format entri script tambahan:

### nama-modul

- Lokasi: 
- Tujuan: 
- Input: 
- Output: 
- Cara pakai: 

## Label dan Topik GitHub

`roblox`, `luau`, `lua`, `anti-exploit`, `game-security`, `roblox-security`

## Konvensi

- Bahasa kode dan komentar: Inggris untuk identifier, Indonesia untuk dokumentasi.
- Satu modul satu file, satu tanggung jawab.
- Semua keputusan keamanan dibuat di server. Client hanya mengirim permintaan.
- Jangan menyimpan secret atau API key di repo.
- Detail ancaman dan mitigasi: lihat `about/ancaman-dan-mitigasi.md`.
