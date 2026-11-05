#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Semi
set -e
ip link set lo up
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.16.98/27 dev eth0
ip route replace default via 10.69.16.97 dev eth0
echo CONFIGURED-Semi
