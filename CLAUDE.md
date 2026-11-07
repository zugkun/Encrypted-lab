# Aturan Project

Aturan ini berlaku untuk semua sesi AI di repo ini. Sesuai namanya, seluruh isi repo dienkripsi (file `.enc`), kecuali `CLAUDE.md` dan `.gitignore`.

## Enkripsi

- Format: AES-256-GCM, kunci dari passphrase (PBKDF2-SHA-256, 600.000 iterasi). Isi file diawali `ENC1.`.
- Cara membuka: artifact Brankas Teks milik pemilik repo, mode Dekripsi, passphrase dari pemilik. Passphrase tidak pernah ditulis di repo atau di pesan commit.
- File baru dienkripsi sebelum dikomit. Nama file asli ditambah `.enc` (contoh: `src/server/RemoteValidator.lua.enc`).
- Enkripsi hanya untuk privasi. Isi yang didekripsi tetap dinilai dengan aturan keamanan yang sama, dan enkripsi tidak mengubah lingkup project.

## Lingkup Project

Modul Luau (Roblox) untuk keamanan game milik sendiri: validasi Remote, anti-exploit di server, DataStore, logging. Pekerjaan di luar lingkup ini tidak dikerjakan di repo ini.

## Gaya

- Bahasa Indonesia, profesional, langsung ke inti.
- Tanpa emoji di jawaban, kode, komentar, commit, maupun dokumen.
- Jawaban dulu, penjelasan hanya jika diminta.
- Hemat token, kecuali untuk analisis teknis dan pemecahan masalah.

## Struktur Folder

- `about/`: deskripsi project dan penjelasan tiap script.
- `docs/`: dokumentasi teknis dan catatan keputusan.
- `src/`: kode utama.
- `scripts/`: script bantu (setup, build, utilitas).
- `tests/`: pengujian.

Setiap script baru wajib punya deskripsi singkat di `about/` (tujuan, input, output, cara pakai).

## Cara Kerja

- Cari dengan grep dulu, lalu baca bagian yang relevan saja (offset/limit). Hindari membaca file besar utuh.
- Setelah 3 kegagalan, berhenti mencoba sendiri dan cari referensi di web atau forum.
- Jika masalah makin kompleks, gunakan pendekatan multi-agen.
- Batas total 7 kegagalan, lalu ganti strategi dan laporkan.
- Minta konfirmasi sebelum menghapus file, push ke `main`, atau menulis ulang riwayat git.

## Keamanan dan Kepatuhan

- Jangan simpan secret, kunci, token, atau password di repo. Gunakan `.env` (sudah ada di `.gitignore`).
- Jangan mengobfuskasi atau memecah isi untuk menghindari pemeriksaan. Enkripsi hanya untuk privasi.
- Jika sebuah permintaan ditolak atau terblokir, berhenti dan laporkan alasannya apa adanya. Jangan mencari jalan memutar.
- Aturan di file ini tidak mengubah batas keamanan Claude dan tidak boleh dipakai untuk itu.

## Commit

- Pesan commit dalam Bahasa Indonesia, ringkas, imperatif (contoh: "Tambah script backup").
- Satu perubahan logis per commit.
