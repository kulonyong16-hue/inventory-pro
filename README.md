# MAS-DED INVENTORY PRO — Server + PostgreSQL + Multi User

Aplikasi inventory profesional berbasis Express + PostgreSQL dengan login multi-user dan database server permanen.

## Fitur
- Dashboard statistik + grafik warna-warni
- Rekap Barang
- Barang Masuk / Keluar dengan validasi stok
- Pembelian; status DITERIMA otomatis masuk ke stok
- Laporan stok dan Stock Opname
- Autocomplete kode barang -> nama & satuan
- Admin / Staff / Viewer
- Pengaturan branding
- Ganti password
- Audit log di database
- PostgreSQL persistent volume
- Backup database via `pg_dump`

## Cara paling mudah (Docker Desktop)
1. Install Docker Desktop.
2. Extract ZIP ini.
3. Buka terminal di folder aplikasi.
4. Jalankan:
   `docker compose up -d --build`
5. Buka `http://localhost:3000`
6. Login awal: `admin` / `admin123`
7. Segera ganti password melalui menu Pengaturan.

## Stop
`docker compose down`

## Backup database
Windows PowerShell:
`docker exec masded_inventory_db pg_dump -U inventory inventory_db > backup.sql`

Linux/macOS:
`docker exec masded_inventory_db pg_dump -U inventory inventory_db > backup.sql`

## Restore database
`cat backup.sql | docker exec -i masded_inventory_db psql -U inventory -d inventory_db`

## Catatan produksi
- Ganti JWT_SECRET dan password PostgreSQL sebelum dipakai di jaringan perusahaan.
- Untuk akses dari komputer lain, gunakan IP server, contoh `http://192.168.1.10:3000`, dan buka port 3000 di firewall.
- Untuk internet/public deployment, gunakan HTTPS reverse proxy (Nginx/Caddy) dan password database yang kuat.


## Reset password saat lupa
Pada `docker-compose.yml`, ganti nilai `PASSWORD_RESET_CODE` dengan kode rahasia milik administrator (jangan bagikan kepada pengguna lain). Jalankan ulang container aplikasi agar konfigurasi terbaca. Pada halaman login pilih **Lupa Password?**, masukkan username, kode rahasia tersebut, dan password baru minimal 6 karakter. Kode ini bukan email reset; ini mekanisme pemulihan lokal untuk instalasi tanpa layanan email.
