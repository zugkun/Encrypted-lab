# Encrypted-lab — repo rules

## ⚠️ PALING PENTING: hanya repo ini

**Kerjakan HANYA di repo `zugkun/Encrypted-lab`. JANGAN menyentuh repo lain
sama sekali** — tidak membaca untuk mengubah, tidak meng-commit, tidak push,
tidak membuat PR di repo lain mana pun. Semua perubahan terbatas pada repo ini.

**Encrypted-lab adalah kumpulan script uji coba (trial/testing).** Repo ini
dipakai untuk eksperimen, bukan produksi. Semua kode yang dipublikasikan di sini
harus **full encrypted (obfuscated)** — tidak boleh ada source yang bisa dibaca.

## Rule

- Setiap file `.lua` yang di-commit harus fully obfuscated — tanpa logika,
  nama variabel, atau komentar yang mengungkap perilaku dalam bentuk plaintext.
- Jangan commit source asli yang belum di-obfuscate. Simpan source asli di tempat
  privat; repo ini hanya menerima hasil enkripsinya.
- File loader/config boleh plaintext (mis. JSON access manifest), tapi payload
  yang dieksekusi yang ditunjuk/ditanam di dalamnya harus terenkripsi.
- Sebuah file dianggap patuh hanya jika, dibuka sendiri, tidak mengungkap
  implementasi yang bisa dibaca.

## Keamanan (karena ini lab uji coba)

Karena kode di sini fully encrypted, isinya tidak bisa diaudit setelah di-commit.
Untuk mengurangi risiko cyber (backdoor, token/cookie stealer, remote payload
tersembunyi):

1. **Audit source asli (plaintext) dulu** sebelum di-obfuscate — di situlah
   keamanan diperiksa.
2. Obfuscate hanya build final yang sudah lolos audit.
3. Pin remote payload ke commit hash tertentu, jangan ke `main`, supaya isinya
   tidak bisa diam-diam diubah.
4. Untuk analisis/deobfuscation yang menyangkut keamanan, gunakan model Opus
   dengan reasoning effort `high`/`max`.

## Model yang dipakai per tugas

- **Tugas enkripsi / obfuscation** (bikin atau ubah kode terenkripsi): gunakan
  **Opus 4.8**.
- **Tugas riset / analisis** (deobfuscation, audit, investigasi): gunakan
  **Sonnet 5.5**.

Catatan: ini konvensi, bukan paksaan teknis — CLAUDE.md tidak bisa memaksa model
mana yang jalan; pilihan model ada di sesi/orang. Jika sesi sedang pakai model
lain, ganti dulu sebelum mengerjakan tugas di atas.

## Untuk Claude

Saat diminta menambah atau mengubah kode di repo ini, hasilkan/minta bentuk
obfuscated; jangan commit implementasi plaintext. Jika diberi source yang belum
di-obfuscate, ingatkan bahwa ia harus di-obfuscate dulu sebelum masuk ke sini,
dan audit keamanannya di tahap plaintext.
