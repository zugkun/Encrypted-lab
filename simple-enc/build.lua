--[[
  Helper enkripsi untuk simple-enc POC.
  Jalankan di Lua biasa (atau executor) untuk menghasilkan payload.enc.
  Key TIDAK disimpan di repo -- taruh hasil KEY di Claude Artifact.
--]]

local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function b64encode(data)
  local out = {}
  for i = 1, #data, 3 do
    local a, b, c = data:byte(i, i + 2)
    b = b or 0; c = c or 0
    local n = a * 65536 + b * 256 + c
    local s = B64:sub(math.floor(n / 262144) % 64 + 1, math.floor(n / 262144) % 64 + 1)
             .. B64:sub(math.floor(n / 4096) % 64 + 1, math.floor(n / 4096) % 64 + 1)
             .. B64:sub(math.floor(n / 64) % 64 + 1, math.floor(n / 64) % 64 + 1)
             .. B64:sub(n % 64 + 1, n % 64 + 1)
    out[#out + 1] = s
  end
  local res = table.concat(out)
  local pad = #data % 3
  if pad == 1 then res = res:sub(1, -3) .. "=="
  elseif pad == 2 then res = res:sub(1, -2) .. "=" end
  return res
end

local function xor_encrypt(data, key)
  local kl, out = #key, {}
  for i = 1, #data do
    local b = string.byte(data, i)
    local k = string.byte(key, ((i - 1) % kl) + 1)
    out[i] = string.char(bit32 and bit32.bxor(b, k) or (b ~ k))
  end
  return table.concat(out)
end

-- === EDIT DI SINI ===
local PLAINTEXT = [[print("[Joevan simple-enc POC] payload berhasil didekripsi & dijalankan")]]
local KEY = "J0ev4n-K3y-2026!"   -- key kamu; JANGAN commit ke repo
-- =====================

local enc = xor_encrypt(PLAINTEXT, KEY)
local blob = b64encode(enc)
print("payload.enc =>")
print(blob)
print("")
print("KEY (base64, taruh di artifact sbg KEYSTART:<ini>:KEYEND) =>")
print(b64encode(KEY))
