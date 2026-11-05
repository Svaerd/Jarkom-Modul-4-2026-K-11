#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Yasuo
set -e
ip link set lo up
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.13.2/24 dev eth0
ip route replace default via 10.69.13.1 dev eth0
echo CONFIGURED-Yasuo
