#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Tachibana
set -e
ip link set lo up
sysctl -w net.ipv4.ip_forward=1 >/dev/null
sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 2>&1 || true
sysctl -w net.ipv4.conf.default.rp_filter=0 >/dev/null 2>&1 || true
iptables -P FORWARD ACCEPT >/dev/null 2>&1 || true
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.10.1/23 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 10.69.16.170/30 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 10.69.16.177/30 dev eth2
ip route replace default via 10.69.16.169 dev eth1
ip route replace 10.69.15.0/24 via 10.69.16.178 dev eth2
ip route replace 10.69.16.136/30 via 10.69.16.178 dev eth2
ip route replace 10.69.16.152/29 via 10.69.16.178 dev eth2
ip route replace 10.69.16.180/30 via 10.69.16.178 dev eth2
ip route replace 10.69.16.184/29 via 10.69.16.178 dev eth2
ip route replace 10.69.16.96/27 via 10.69.16.178 dev eth2
echo CONFIGURED-Tachibana
