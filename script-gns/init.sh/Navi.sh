#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Navi
set -e
ip link set lo up
sysctl -w net.ipv4.ip_forward=1 >/dev/null
sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 2>&1 || true
sysctl -w net.ipv4.conf.default.rp_filter=0 >/dev/null 2>&1 || true
iptables -P FORWARD ACCEPT >/dev/null 2>&1 || true
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.16.166/30 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 10.69.12.1/24 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 10.69.16.1/26 dev eth2
ip link set eth3 up
ip addr flush dev eth3
ip addr add 10.69.13.1/24 dev eth3
ip route replace default via 10.69.16.165 dev eth0
echo CONFIGURED-Navi
