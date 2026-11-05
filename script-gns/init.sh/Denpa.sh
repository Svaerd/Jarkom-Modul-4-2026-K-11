#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Denpa
set -e
ip link set lo up
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.4.3/22 dev eth0
ip route replace default via 10.69.4.1 dev eth0
echo CONFIGURED-Denpa
