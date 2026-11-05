# Tabel alamat CPT/VLSM

[Kembali ke laporan](../README.md)

Alamat aktual diambil dari [snapshot Packet Tracer](../evidence/packet-tracer-snapshot.json)
dan dicocokkan dengan workbook. `Fa` pada tabel berarti `FastEthernet`.
Versi mesin: [62 alamat](addresses.csv), [25 host beserta rentang kelompok](../configs/hosts.csv),
dan [51 kabel beserta port kedua ujung](cables.csv).

## Subnet

| ID | Network/prefix | Netmask | Rentang usable | Broadcast |
| --- | --- | --- | --- | --- |
| A1 | 10.69.0.0/22 | 255.255.252.0 | 10.69.0.1 - 10.69.3.254 | 10.69.3.255 |
| A2 | 10.69.4.0/22 | 255.255.252.0 | 10.69.4.1 - 10.69.7.254 | 10.69.7.255 |
| A3 | 10.69.8.0/23 | 255.255.254.0 | 10.69.8.1 - 10.69.9.254 | 10.69.9.255 |
| A4 | 10.69.10.0/23 | 255.255.254.0 | 10.69.10.1 - 10.69.11.254 | 10.69.11.255 |
| A5 | 10.69.12.0/24 | 255.255.255.0 | 10.69.12.1 - 10.69.12.254 | 10.69.12.255 |
| A6 | 10.69.13.0/24 | 255.255.255.0 | 10.69.13.1 - 10.69.13.254 | 10.69.13.255 |
| A7 | 10.69.14.0/25 | 255.255.255.128 | 10.69.14.1 - 10.69.14.126 | 10.69.14.127 |
| A8 | 10.69.15.0/25 | 255.255.255.128 | 10.69.15.1 - 10.69.15.126 | 10.69.15.127 |
| A9 | 10.69.14.128/26 | 255.255.255.192 | 10.69.14.129 - 10.69.14.190 | 10.69.14.191 |
| A10 | 10.69.15.192/26 | 255.255.255.192 | 10.69.15.193 - 10.69.15.254 | 10.69.15.255 |
| A11 | 10.69.16.0/26 | 255.255.255.192 | 10.69.16.1 - 10.69.16.62 | 10.69.16.63 |
| A12 | 10.69.15.128/26 | 255.255.255.192 | 10.69.15.129 - 10.69.15.190 | 10.69.15.191 |
| A13 | 10.69.16.96/27 | 255.255.255.224 | 10.69.16.97 - 10.69.16.126 | 10.69.16.127 |
| A14 | 10.69.16.128/29 | 255.255.255.248 | 10.69.16.129 - 10.69.16.134 | 10.69.16.135 |
| A15 | 10.69.16.136/29 | 255.255.255.248 | 10.69.16.137 - 10.69.16.142 | 10.69.16.143 |
| A16 | 10.69.16.144/29 | 255.255.255.248 | 10.69.16.145 - 10.69.16.150 | 10.69.16.151 |
| A17 | 10.69.16.152/30 | 255.255.255.252 | 10.69.16.153 - 10.69.16.154 | 10.69.16.155 |
| A18 | 10.69.16.156/30 | 255.255.255.252 | 10.69.16.157 - 10.69.16.158 | 10.69.16.159 |
| A19 | 10.69.16.160/30 | 255.255.255.252 | 10.69.16.161 - 10.69.16.162 | 10.69.16.163 |
| A20 | 10.69.16.164/30 | 255.255.255.252 | 10.69.16.165 - 10.69.16.166 | 10.69.16.167 |
| A21 | 10.69.16.168/30 | 255.255.255.252 | 10.69.16.169 - 10.69.16.170 | 10.69.16.171 |
| A22 | 10.69.16.172/30 | 255.255.255.252 | 10.69.16.173 - 10.69.16.174 | 10.69.16.175 |
| A23 | 10.69.16.176/30 | 255.255.255.252 | 10.69.16.177 - 10.69.16.178 | 10.69.16.179 |
| A24 | 10.69.16.180/30 | 255.255.255.252 | 10.69.16.181 - 10.69.16.182 | 10.69.16.183 |
| A25 | 10.69.16.184/30 | 255.255.255.252 | 10.69.16.185 - 10.69.16.186 | 10.69.16.187 |

## Interface router

Seluruh interface ber-IP pada tabel berstatus **up/up** saat verifikasi.
`Vlan1` yang tidak digunakan berstatus `administratively down` dan tidak diberi IP.

| Router | Interface | Subnet | IP/prefix | Terhubung ke |
| --- | --- | --- | --- | --- |
| Cyberia | Fa0/0 | Uplink eksternal | Belum ditentukan | Cloud Ethernet6 |
| Cyberia | Fa0/1 | A7 | 10.69.14.1/25 | Switch1 |
| Cyberia | Fa1/0 | A17 | 10.69.16.153/30 | Wired Fa0/0 |
| Wired | Fa0/0 | A17 | 10.69.16.154/30 | Cyberia Fa1/0 |
| Wired | Fa0/1 | A14 | 10.69.16.129/29 | Switch2 |
| Wired | Fa1/0 | A18 | 10.69.16.157/30 | Navi Fa0/0 |
| Wired | Fa1/1 | A19 | 10.69.16.161/30 | Tachibana Fa0/0 |
| Navi | Fa0/0 | A18 | 10.69.16.158/30 | Wired Fa1/0 |
| Navi | Fa0/1 | A5 | 10.69.12.1/24 | Switch6 |
| Navi | Fa1/0 | A10 | 10.69.15.193/26 | Switch7 |
| Navi | Fa1/1 | A6 | 10.69.13.1/24 | Switch8 |
| Psyche | Fa0/0 | A14 | 10.69.16.130/29 | Switch2 |
| Psyche | Fa0/1 | A1 | 10.69.0.1/22 | Switch3 |
| Copland | Fa0/0 | A14 | 10.69.16.131/29 | Switch2 |
| Copland | Fa0/1 | A3 | 10.69.8.1/23 | Switch4 |
| Copland | Fa1/0 | A9 | 10.69.14.129/26 | Juri Fa0 |
| Schumann | Fa0/0 | A14 | 10.69.16.132/29 | Switch2 |
| Schumann | Fa0/1 | A15 | 10.69.16.137/29 | Akashic Fa0 |
| Schumann | Fa1/0 | A20 | 10.69.16.165/30 | Accela Fa0/0 |
| Accela | Fa0/0 | A20 | 10.69.16.166/30 | Schumann Fa1/0 |
| Accela | Fa0/1 | A2 | 10.69.4.1/22 | Switch5 |
| Tachibana | Fa0/0 | A19 | 10.69.16.162/30 | Wired Fa1/1 |
| Tachibana | Fa0/1 | A4 | 10.69.10.1/23 | Switch9 |
| Tachibana | Fa1/0 | A21 | 10.69.16.169/30 | Deus Fa0/0 |
| Deus | Fa0/0 | A21 | 10.69.16.170/30 | Tachibana Fa1/0 |
| Deus | Fa0/1 | A8 | 10.69.15.1/25 | Switch10 |
| Deus | Fa1/0 | A22 | 10.69.16.173/30 | Protocol7 Fa0/0 |
| Protocol7 | Fa0/0 | A22 | 10.69.16.174/30 | Deus Fa1/0 |
| Protocol7 | Fa0/1 | A11 | 10.69.16.1/26 | Switch11 |
| Protocol7 | Fa1/0 | A23 | 10.69.16.177/30 | Knights Fa0/0 |
| Knights | Fa0/0 | A23 | 10.69.16.178/30 | Protocol7 Fa1/0 |
| Knights | Fa0/1 | A16 | 10.69.16.145/29 | Eiri Fa0 |
| Knights | Fa1/0 | A24 | 10.69.16.181/30 | Phantoma Fa0/0 |
| Phantoma | Fa0/0 | A24 | 10.69.16.182/30 | Knights Fa1/0 |
| Phantoma | Fa0/1 | A13 | 10.69.16.97/27 | Switch12 |
| Phantoma | Fa1/0 | A25 | 10.69.16.185/30 | Shibuya Fa0/0 |
| Shibuya | Fa0/0 | A25 | 10.69.16.186/30 | Phantoma Fa1/0 |
| Shibuya | Fa0/1 | A12 | 10.69.15.129/26 | Switch13 |

## Perangkat akhir

Seluruh perangkat akhir memakai `FastEthernet0`. IP pada tabel adalah IP yang benar-benar dikonfigurasi di CPT.
Mask mengikuti prefix pada kolom IP dan tabel subnet di atas.

| Node | Jenis | Subnet | IP/prefix | Default gateway |
| --- | --- | --- | --- | --- |
| Karl | Server-PT | A1 | 10.69.0.2/22 | 10.69.0.1 |
| Lin | Server-PT | A1 | 10.69.2.190/22 | 10.69.0.1 |
| Omnipresence | PC-PT | A2 | 10.69.4.2/22 | 10.69.4.1 |
| Denpa | Laptop-PT | A2 | 10.69.6.0/22 | 10.69.4.1 |
| Masayuki | Laptop-PT | A3 | 10.69.8.2/23 | 10.69.8.1 |
| Collective | Server-PT | A4 | 10.69.10.2/23 | 10.69.10.1 |
| Ghost | PC-PT | A4 | 10.69.11.6/23 | 10.69.10.1 |
| Alice | Laptop-PT | A5 | 10.69.12.2/24 | 10.69.12.1 |
| Reika | PC-PT | A5 | 10.69.12.210/24 | 10.69.12.1 |
| Yasuo | PC-PT | A6 | 10.69.13.2/24 | 10.69.13.1 |
| Miho | Laptop-PT | A6 | 10.69.13.122/24 | 10.69.13.1 |
| Kuma | Server-PT | A6 | 10.69.13.140/24 | 10.69.13.1 |
| JJ | PC-PT | A7 | 10.69.14.2/25 | 10.69.14.1 |
| MyuMyu | Laptop-PT | A7 | 10.69.14.97/25 | 10.69.14.1 |
| Lilith | Laptop-PT | A8 | 10.69.15.2/25 | 10.69.15.1 |
| Specter | PC-PT | A8 | 10.69.15.79/25 | 10.69.15.1 |
| Juri | Laptop-PT | A9 | 10.69.14.130/26 | 10.69.14.129 |
| Taro | PC-PT | A10 | 10.69.15.194/26 | 10.69.15.193 |
| Chisa | Laptop-PT | A11 | 10.69.16.2/26 | 10.69.16.1 |
| Hodgeson | PC-PT | A11 | 10.69.16.25/26 | 10.69.16.1 |
| Lain | Laptop-PT | A12 | 10.69.15.130/26 | 10.69.15.129 |
| Mika | PC-PT | A12 | 10.69.15.187/26 | 10.69.15.129 |
| Semi | PC-PT | A13 | 10.69.16.98/27 | 10.69.16.97 |
| Akashic | Server-PT | A15 | 10.69.16.138/29 | 10.69.16.137 |
| Eiri | Server-PT | A16 | 10.69.16.146/29 | 10.69.16.145 |

### Rentang kelompok host

Rentang berikut dicadangkan untuk jumlah host pada soal; satu ikon CPT mewakili setiap kelompok.
IP perwakilan selalu merupakan alamat awal rentang. Tidak ada subnet baru di antara kelompok yang berbagi switch.

| Node | Jumlah host | Alamat awal | Alamat akhir |
| --- | ---: | --- | --- |
| Karl | 700 | 10.69.0.2 | 10.69.2.189 |
| Lin | 180 | 10.69.2.190 | 10.69.3.113 |
| Omnipresence | 510 | 10.69.4.2 | 10.69.5.255 |
| Denpa | 3 | 10.69.6.0 | 10.69.6.2 |
| Masayuki | 300 | 10.69.8.2 | 10.69.9.45 |
| Collective | 260 | 10.69.10.2 | 10.69.11.5 |
| Ghost | 6 | 10.69.11.6 | 10.69.11.11 |
| Alice | 208 | 10.69.12.2 | 10.69.12.209 |
| Reika | 45 | 10.69.12.210 | 10.69.12.254 |
| Yasuo | 120 | 10.69.13.2 | 10.69.13.121 |
| Miho | 18 | 10.69.13.122 | 10.69.13.139 |
| Kuma | 4 | 10.69.13.140 | 10.69.13.143 |
| JJ | 95 | 10.69.14.2 | 10.69.14.96 |
| MyuMyu | 30 | 10.69.14.97 | 10.69.14.126 |
| Lilith | 77 | 10.69.15.2 | 10.69.15.78 |
| Specter | 21 | 10.69.15.79 | 10.69.15.99 |
| Lain | 57 | 10.69.15.130 | 10.69.15.186 |
| Mika | 4 | 10.69.15.187 | 10.69.15.190 |
| Taro | 57 | 10.69.15.194 | 10.69.15.250 |
| Chisa | 23 | 10.69.16.2 | 10.69.16.24 |
| Hodgeson | 9 | 10.69.16.25 | 10.69.16.33 |
| Juri | 31 | 10.69.14.130 | 10.69.14.160 |
| Semi | 14 | 10.69.16.98 | 10.69.16.111 |
| Akashic | 3 | 10.69.16.138 | 10.69.16.140 |
| Eiri | 2 | 10.69.16.146 | 10.69.16.147 |

**Alamat berakhiran `.0` atau `.255` tidak selalu terlarang.** Denpa `10.69.6.0` dan
alamat terakhir kelompok Omnipresence `10.69.5.255` merupakan alamat host sah pada `10.69.4.0/22`.
Network subnet tersebut adalah `10.69.4.0`, sedangkan broadcast-nya `10.69.7.255`.

## Port switch dan jenis kabel

Pada setiap LAN biasa, router memakai port switch `FastEthernet0/1`;
host pertama, kedua, dan ketiga memakai `FastEthernet1/1`, `FastEthernet2/1`, dan `FastEthernet3/1`.
Pasangan host dan port tercatat dalam [inventaris kabel](cables.csv).

Switch2 menggunakan `Fa0/1` untuk Wired, `Fa1/1` untuk Psyche, `Fa2/1` untuk Copland,
dan `Fa3/1` untuk Schumann. Seluruhnya tetap satu broadcast domain A14.

- Router ke switch, switch ke host, dan Cloud ke Cyberia: **Copper Straight-Through**.
- Router ke router serta router langsung ke Juri, Akashic, dan Eiri: **Copper Cross-Over**.

[CSV kabel](cables.csv) menyimpan semua pasangan port aktual beserta status kedua ujung.
