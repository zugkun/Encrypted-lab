# Tests

Pengujian untuk modul di `src/`. Modul saat ini masih rencana (lihat `about/README.md`), jadi dokumen ini menjadi acuan penulisan tes saat kodenya dibuat.

## Cara Menjalankan

1. Pasang TestEZ di project Roblox (Rojo atau Wally).
2. Taruh file tes di folder ini dengan nama `NamaModul.spec.lua`.
3. Jalankan runner TestEZ dari Roblox Studio (Command Bar atau script runner di `scripts/`).

## Konvensi

- Satu file spec per modul, nama mengikuti modul: `RemoteValidator.spec.lua`.
- Nama tes berupa kalimat Indonesia yang menjelaskan perilaku: "menolak argumen nil".
- Tes harus deterministik. Waktu dan acak dimasukkan lewat parameter, bukan dipanggil langsung.
- Setiap modul keamanan wajib punya tes untuk kasus ditolak, bukan hanya kasus lolos.
- Tes tidak memakai data pemain asli.

## Template Spec

Contoh bentuk (API modul hanya ilustrasi, sesuaikan saat modul dibuat):

```lua
return function()
	local RemoteValidator = require(script.Parent.Parent.src.server.RemoteValidator)

	describe("RemoteValidator", function()
		it("menolak argumen nil", function()
			expect(RemoteValidator.isValidNumber(nil, 0, 100)).to.equal(false)
		end)

		it("menerima angka di dalam rentang", function()
			expect(RemoteValidator.isValidNumber(50, 0, 100)).to.equal(true)
		end)

		it("menolak angka di luar rentang", function()
			expect(RemoteValidator.isValidNumber(101, 0, 100)).to.equal(false)
		end)
	end)
end
```

## Rencana Kasus Uji

Daftar kasus per modul ada di `tests/rencana-uji.md`.
