#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Schumann
set -e
ip link set lo up
sysctl -w net.ipv4.ip_forward=1 >/dev/null
sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 2>&1 || true
sysctl -w net.ipv4.conf.default.rp_filter=0 >/dev/null 2>&1 || true
iptables -P FORWARD ACCEPT >/dev/null 2>&1 || true
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.16.132/29 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 10.69.16.145/29 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 10.69.16.173/30 dev eth2
ip route replace default via 10.69.16.129 dev eth0
ip route replace 10.69.0.0/22 via 10.69.16.130 dev eth0
ip route replace 10.69.16.64/27 via 10.69.16.131 dev eth0
ip route replace 10.69.4.0/22 via 10.69.16.174 dev eth2
ip route replace 10.69.8.0/23 via 10.69.16.131 dev eth0
echo CONFIGURED-Schumann
