# Routing statis dan backup

[Kembali ke laporan](../README.md) | [Tabel alamat](alamat.md)

## Rancangan rute

Wired menjadi pusat routing internal. Router cabang menggunakan default route ke induk
dan rute spesifik ke subnet di bawahnya. Longest-prefix match memilih rute cabang yang lebih spesifik
sebelum default route.

Cyberia memiliki satu rute agregat internal menuju Wired. Wired memiliki rute spesifik A7 menuju Cyberia,
serta rute menuju seluruh cabang lain. Wired belum memiliki default route eksternal karena uplink ISP
belum ditentukan.

| Router | Default next-hop | Jumlah rute statis | Backup aktual |
| --- | --- | ---: | --- |
| Cyberia | Tidak ada; 10.69.0.0/19 via 10.69.16.154 | 1 | [Cyberia.cfg](../configs/routers/Cyberia.cfg) |
| Wired | Tidak ada | 18 | [Wired.cfg](../configs/routers/Wired.cfg) |
| Navi | 10.69.16.157 | 1 | [Navi.cfg](../configs/routers/Navi.cfg) |
| Psyche | 10.69.16.129 | 1 | [Psyche.cfg](../configs/routers/Psyche.cfg) |
| Copland | 10.69.16.129 | 1 | [Copland.cfg](../configs/routers/Copland.cfg) |
| Schumann | 10.69.16.129 | 2 | [Schumann.cfg](../configs/routers/Schumann.cfg) |
| Accela | 10.69.16.165 | 1 | [Accela.cfg](../configs/routers/Accela.cfg) |
| Tachibana | 10.69.16.161 | 9 | [Tachibana.cfg](../configs/routers/Tachibana.cfg) |
| Deus | 10.69.16.169 | 7 | [Deus.cfg](../configs/routers/Deus.cfg) |
| Protocol7 | 10.69.16.173 | 6 | [Protocol7.cfg](../configs/routers/Protocol7.cfg) |
| Knights | 10.69.16.177 | 4 | [Knights.cfg](../configs/routers/Knights.cfg) |
| Phantoma | 10.69.16.181 | 2 | [Phantoma.cfg](../configs/routers/Phantoma.cfg) |
| Shibuya | 10.69.16.185 | 1 | [Shibuya.cfg](../configs/routers/Shibuya.cfg) |
| **Total** | | **54** | |

Rute connected tidak memerlukan perintah `ip route`. Seluruh next-hop berada pada subnet yang tersambung langsung
ke router pengirim. Pemeriksaan model rute menelusuri 13 router menuju masing-masing dari 62 alamat,
sebanyak 806 jalur, tanpa loop pada alamat yang dialokasikan.
Hasil ping aktual tersedia pada [bukti pengujian](../evidence/README.md).

## Rute pada Wired

Berikut 18 perintah yang tercatat pada konfigurasi aktual Wired:

```text
ip route 10.69.14.0 255.255.255.128 10.69.16.153
ip route 10.69.10.0 255.255.254.0 10.69.16.162
ip route 10.69.15.0 255.255.255.128 10.69.16.162
ip route 10.69.15.128 255.255.255.192 10.69.16.162
ip route 10.69.16.0 255.255.255.192 10.69.16.162
ip route 10.69.16.96 255.255.255.224 10.69.16.162
ip route 10.69.16.144 255.255.255.248 10.69.16.162
ip route 10.69.16.168 255.255.255.248 10.69.16.162
ip route 10.69.16.176 255.255.255.248 10.69.16.162
ip route 10.69.16.184 255.255.255.252 10.69.16.162
ip route 10.69.12.0 255.255.254.0 10.69.16.158
ip route 10.69.15.192 255.255.255.192 10.69.16.158
ip route 10.69.0.0 255.255.252.0 10.69.16.130
ip route 10.69.8.0 255.255.254.0 10.69.16.131
ip route 10.69.14.128 255.255.255.192 10.69.16.131
ip route 10.69.4.0 255.255.252.0 10.69.16.132
ip route 10.69.16.136 255.255.255.248 10.69.16.132
ip route 10.69.16.164 255.255.255.252 10.69.16.132
```

A7 kini memakai `10.69.14.0/25` melalui Cyberia, sedangkan A9 memakai `10.69.14.128/26`
melalui Copland. Kedua tujuan membutuhkan rute tersendiri karena next-hop-nya berbeda.

Penggabungan yang digunakan:

- A5 `10.69.12.0/24` dan A6 `10.69.13.0/24` menjadi `10.69.12.0/23` melalui Navi.
- A21 `10.69.16.168/30` dan A22 `10.69.16.172/30` menjadi `10.69.16.168/29` melalui Tachibana.
- A23 `10.69.16.176/30` dan A24 `10.69.16.180/30` menjadi `10.69.16.176/29` melalui Tachibana.

Mask subnet pada interface tetap mengikuti VLSM. Agregasi tabel routing tidak mengubah A21 sampai A24 menjadi LAN `/29`.
Setiap rute gabungan hanya menutup blok yang dimiliki cabang dengan next-hop yang sama.

## Jalur Cyberia dan Lain

```text
Cyberia -> Wired -> Tachibana -> Deus -> Protocol7 -> Knights -> Phantoma -> Shibuya -> Lain
Lain -> Shibuya -> Phantoma -> Knights -> Protocol7 -> Deus -> Tachibana -> Wired -> Cyberia
```

Cyberia meneruskan tujuan `10.69.15.130` lewat rute agregat ke Wired.
Wired memilih `10.69.15.128/26` melalui `10.69.16.162`, lalu setiap router meneruskan ke anak
hingga Shibuya mengirim langsung ke LAN A12.

Untuk ping Lain ke Cyberia `10.69.14.1`, Lain mengirim melalui gateway Shibuya,
lalu router cabang memakai default menuju induk dan Wired memakai rute A7 menuju Cyberia.
Alamat interface Cyberia `10.69.16.153` dapat dicapai dari Wired melalui subnet connected A17.

## Memulihkan konfigurasi

Cara utama memulihkan seluruh lab adalah membuka [berkas .pkt](../cpt/K11-VLSM.pkt).
Backup teks disediakan untuk memeriksa atau membangun ulang perangkat jika berkas proyek bermasalah.

1. Siapkan router **2811** dengan modul sesuai koneksi:
   - `NM-2FE2W`: Wired dan Navi.
   - `NM-1FE-TX`: Cyberia, Copland, Schumann, Tachibana, Deus, Protocol7, Knights, dan Phantoma.
   - Tanpa modul tambahan: Psyche, Accela, dan Shibuya.
   Matikan daya router saat memasang modul, kemudian nyalakan kembali.
2. Hubungkan kabel mengikuti [inventaris port](cables.csv).
3. Masuk CLI `enable`, lalu `configure terminal`. Terapkan konfigurasi dari berkas `.cfg` router terkait.
4. Pada setiap interface fisik yang dipakai, jalankan `no shutdown`.
   Ekspor running-config tidak selalu menampilkan perintah ini untuk interface yang sudah aktif.
5. Jalankan `end`, kemudian `write memory`. Cocokkan `show ip interface brief` dan `show ip route`
   dengan [output aktual router](../evidence/routers/).
6. Untuk perangkat akhir, masukkan IP, mask, dan gateway melalui **Desktop > IP Configuration > Static**
   mengikuti [hosts.csv](../configs/hosts.csv).
7. Uji gateway lokal, cabang lain, dan Cyberia ke Lain dua arah, kemudian simpan `.pkt`.

Berkas `.cfg` berisi konfigurasi aktual mulai baris `version` sampai `end`, tanpa header perintah `show`.
Running-config dan startup-config telah dibandingkan sebelum ekspor.
