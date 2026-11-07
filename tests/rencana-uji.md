# Rencana Kasus Uji

Status semua kasus: belum ditulis. Centang setelah ada tesnya.

## RemoteValidator

- [ ] Menolak argumen nil.
- [ ] Menolak tipe yang salah (string saat diharapkan angka).
- [ ] Menolak angka di luar rentang, termasuk NaN dan tak hingga.
- [ ] Menolak string yang melebihi panjang maksimum.
- [ ] Menolak Instance yang bukan milik atau tidak terkait pemain pemanggil.
- [ ] Menerima argumen yang valid.

## RateLimiter

- [ ] Panggilan di bawah batas lolos.
- [ ] Panggilan di atas batas dalam satu jendela waktu ditolak.
- [ ] Hitungan reset setelah jendela waktu berlalu.
- [ ] Pemain berbeda dihitung terpisah.
- [ ] Data pemain dibersihkan saat pemain keluar.

## MovementCheck

- [ ] Gerakan normal lolos.
- [ ] Kecepatan di atas batas ditambah toleransi ditandai.
- [ ] Lonjakan lag sesaat tidak langsung ditandai.
- [ ] Teleport sah yang dilakukan server dikecualikan.
- [ ] Respawn tidak dihitung sebagai pelanggaran.

## DataStoreGuard

- [ ] Data sesuai skema disimpan.
- [ ] Field yang tidak dikenal ditolak.
- [ ] Nilai di luar rentang ditolak.
- [ ] Dua penyimpanan bersamaan tidak menggandakan item.
- [ ] Kegagalan simpan dicoba ulang dengan batas percobaan.

## ExploitLogger

- [ ] Entri memuat pemain, waktu, dan jenis kejadian.
- [ ] Data sensitif tidak ikut tercatat.
- [ ] Ukuran log dibatasi.

## ModerationService

- [ ] Skor pelanggaran naik bertahap.
- [ ] Kick hanya terjadi setelah ambang terlampaui.
- [ ] Skor turun seiring waktu tanpa pelanggaran baru.
- [ ] Pemain tanpa pelanggaran tidak terpengaruh.
