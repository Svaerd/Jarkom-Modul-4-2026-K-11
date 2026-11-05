#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Shibuya
set -e
ip link set lo up
sysctl -w net.ipv4.ip_forward=1 >/dev/null
sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 2>&1 || true
sysctl -w net.ipv4.conf.default.rp_filter=0 >/dev/null 2>&1 || true
iptables -P FORWARD ACCEPT >/dev/null 2>&1 || true
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.16.138/30 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 10.69.15.193/26 dev eth1
ip route replace default via 10.69.16.137 dev eth0
echo CONFIGURED-Shibuya
