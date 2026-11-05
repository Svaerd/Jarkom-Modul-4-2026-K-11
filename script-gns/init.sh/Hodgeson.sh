#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Hodgeson
set -e
ip link set lo up
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.15.131/26 dev eth0
ip route replace default via 10.69.15.129 dev eth0
echo CONFIGURED-Hodgeson
