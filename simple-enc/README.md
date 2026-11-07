# simple-enc (POC)

Alternatif tanpa obfuscate: payload **dienkripsi** (XOR repeating-key + base64),
loader-nya plaintext, dan **key hanya disimpan di sebuah Claude Artifact** yang
diambil saat runtime.

## File
- `payload.enc` — payload terenkripsi (base64). Ini yang di-commit, bukan source asli.
- `loader.lua` — loader plaintext: ambil `payload.enc` + ambil key dari artifact, lalu decrypt & jalankan.
- `build.lua` — helper untuk membuat `payload.enc` dari plaintext + key (key tidak di-commit).

## Cara pakai
1. Edit `build.lua` (isi `PLAINTEXT` dan `KEY`), jalankan → dapat `payload.enc` dan KEY (base64).
2. Commit `payload.enc` ke repo ini.
3. Publish KEY di Claude Artifact dalam format `KEYSTART:<base64-key>:KEYEND`.
4. Isi `KEY_URL` di `loader.lua` dengan URL artifact tsb.
5. Distribusikan `loader.lua`.

## ⚠️ Catatan keamanan — WAJIB dibaca

Skema ini **security-by-obscurity, bukan enkripsi yang benar-benar aman.**

- Client (executor) harus bisa mendekripsi untuk menjalankan, jadi client harus
  mendapat key. Karena key diambil dari URL artifact yang publik, **siapa pun yang
  menemukan URL itu bisa mengambil key dan mendekripsi payload.** Proteksinya sama
  lemahnya dengan menaruh key di dalam script, hanya dipindah lokasinya.
- Juga belum pasti Roblox executor bisa `HttpGet` ke `claude.ai` (bisa diblokir /
  butuh render JS). **Harus dites dari executor kamu.** Alternatif hosting key yang
  lebih andal: GitHub raw (pin ke commit hash) atau endpoint milik sendiri.

**Nilai sebenarnya dari "key di artifact":** kamu bisa cabut/rotasi akses kapan saja
dengan meng-unpublish/ubah artifact (kill-switch), bukan untuk menyembunyikan kode
dari orang yang serius.

Untuk proteksi nyata: butuh server-side auth (key per-user, verifikasi di server,
payload dikirim hanya setelah lolos cek) — bukan sekadar key statis di URL publik.
