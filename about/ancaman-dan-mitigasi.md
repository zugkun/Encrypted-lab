# Ancaman dan Mitigasi

Dokumen ini bersifat defensif: apa yang perlu dijaga di game sendiri dan bagaimana menjaganya.

| Ancaman | Dampak | Mitigasi di server |
|---|---|---|
| Remote dipanggil dengan argumen tidak valid | Data rusak, logika dilewati | Validasi tipe, rentang, dan keberadaan objek sebelum dipakai |
| Remote dipanggil berulang sangat cepat | Lag, penyalahgunaan fitur | Rate limit per pemain per Remote |
| Client mengklaim hasil (skor, uang, item) | Ekonomi game rusak | Server yang menghitung hasil, client tidak pernah mengirim hasil |
| Gerakan di luar batas wajar | Ketidakadilan antar pemain | Bandingkan posisi dan kecepatan di server dengan batas yang diizinkan |
| Data pemain tidak konsisten atau diduplikasi | Kehilangan atau penggandaan item | Validasi skema, session locking, simpan hanya dari server |
| Tidak ada jejak kejadian | Sulit menindak | Logging terstruktur: pemain, waktu, jenis pelanggaran |

## Prinsip

1. Jangan percaya client. Semua yang datang dari client dianggap tidak tepercaya.
2. Validasi di sisi server, sedekat mungkin dengan titik masuk.
3. Gunakan skor pelanggaran bertahap, bukan langsung ban, untuk mengurangi salah deteksi akibat lag.
4. Catat dulu, tindak kemudian. Tinjau log sebelum menyesuaikan ambang batas.
