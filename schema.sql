-- Jalankan script ini di Supabase Dashboard → SQL Editor → New query → Run
-- Kolom `payment` berisi salah satu: tunai, transfer, qris, ewallet

create table if not exists public.expenses (
  id text primary key,
  amount numeric not null,
  category text not null,
  payment text not null,
  note text,
  datetime timestamp not null,
  created_at timestamp with time zone default now()
);

-- Aktifkan Row Level Security
alter table public.expenses enable row level security;

-- Karena ini aplikasi personal tanpa login, kita izinkan akses penuh
-- lewat anon key. Cukup untuk pemakaian pribadi, tapi ingat: siapa pun
-- yang tahu URL Supabase + anon key kamu bisa baca/tulis data ini.
-- Kalau nanti mau lebih aman, tambahkan Supabase Auth dan ganti policy
-- di bawah ini supaya dibatasi per user_id.

create policy "Izinkan semua akses (anon)"
on public.expenses
for all
to anon
using (true)
with check (true);

-- Aktifkan realtime supaya data sinkron otomatis antar device
alter publication supabase_realtime add table public.expenses;
