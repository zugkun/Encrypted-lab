# Encrypted-lab — repo rules

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

## Untuk Claude

Saat diminta menambah atau mengubah kode di repo ini, hasilkan/minta bentuk
obfuscated; jangan commit implementasi plaintext. Jika diberi source yang belum
di-obfuscate, ingatkan bahwa ia harus di-obfuscate dulu sebelum masuk ke sini,
dan audit keamanannya di tahap plaintext.
