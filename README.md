# Buku Kas — Catatan Pengeluaran

Aplikasi pencatat pengeluaran statis (HTML/CSS/JS) dengan penyimpanan cloud via Supabase, siap deploy ke Vercel.

## 1. Setup Supabase (gratis)

1. Buat akun & project baru di [supabase.com](https://supabase.com) (pilih region Singapore biar cepat dari Indonesia).
2. Masuk ke **SQL Editor** → New query → tempel isi file `schema.sql` → **Run**.
   Ini membuat tabel `expenses` sekaligus mengaktifkan realtime & keamanan dasar.
3. Buka **Project Settings → API**, salin:
   - `Project URL`
   - `anon public` key
4. Buka file `config.js`, ganti dua baris ini dengan nilai kamu:
   ```js
   const SUPABASE_URL = "https://xxxxxxxx.supabase.co";
   const SUPABASE_ANON_KEY = "eyJhbGciOi....";
   ```

## 2. Coba lokal (opsional)

Buka `index.html` langsung di browser, atau jalankan server statis:
```bash
npx serve .
```

## 3. Deploy ke Vercel

**Cara termudah (tanpa install apapun):**
1. Push folder ini ke repo GitHub.
2. Buka [vercel.com](https://vercel.com) → **Add New Project** → import repo tersebut.
3. Framework preset pilih **Other** (karena ini static HTML biasa) → Deploy.
4. Selesai — dapat URL seperti `nama-app.vercel.app`, bisa dibuka dari HP & laptop, data otomatis sinkron karena disimpan di Supabase.

**Atau lewat CLI:**
```bash
npm i -g vercel
vercel
```

## Catatan keamanan

Karena aplikasi ini tanpa login (dipakai personal), `anon key` Supabase ditaruh langsung di `config.js` dan policy RLS mengizinkan akses penuh. Ini wajar untuk aplikasi pribadi, tapi ingat:

- Jangan share URL aplikasi ke orang lain kalau tidak mau mereka bisa lihat/edit data pengeluaranmu.
- Kalau butuh privasi lebih (misalnya mau dipakai banyak orang dengan datanya masing-masing), tambahkan **Supabase Auth** (login email/Google) dan ubah policy di `schema.sql` supaya dibatasi per `user_id`. Bilang saja kalau mau saya bantu setup itu.

## Fitur
- Input cepat: keypad angka + dropdown kategori/metode bayar, tanpa ketik panjang
- Tanggal & jam otomatis (bisa diedit manual)
- Riwayat dikelompokkan per hari
- Analitik: total hari ini/minggu/bulan, komposisi per kategori (donut chart), tren 14 hari
- Sinkron otomatis lintas device (realtime) selama pakai Supabase
- Responsive — nyaman dipakai di HP maupun laptop
