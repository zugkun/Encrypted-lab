# Tentang Project

Isi folder ini dienkripsi untuk privasi (AES-256-GCM, kunci dari passphrase dengan PBKDF2-SHA-256, 600.000 iterasi).

## File

- `deskripsi.md.enc`: ringkasan, tujuan, ruang lingkup, daftar modul, konvensi.
- `ancaman-dan-mitigasi.md.enc`: ancaman dan mitigasi sisi server.

## Cara Membuka

1. Buka artifact Brankas Teks milik pemilik repo.
2. Pilih mode Dekripsi.
3. Tempel isi file `.enc` (teks yang diawali `ENC1.`).
4. Masukkan passphrase yang disimpan pemilik repo, lalu tekan Dekripsi.

Passphrase tidak disimpan di repo. Jika passphrase hilang, isi file `.enc` tidak bisa dipulihkan.

## Format

`ENC1.` diikuti base64url dari salt (16 byte), IV (12 byte), dan ciphertext.

## Lingkup Project

Modul Luau (Roblox) untuk keamanan game milik sendiri. Ringkasan di `README.md` di root repo.
