#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Juri
set -e
ip link set lo up
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.16.66/27 dev eth0
ip route replace default via 10.69.16.65 dev eth0
echo CONFIGURED-Juri
