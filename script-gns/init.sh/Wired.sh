#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Wired
set -e
ip link set lo up
sysctl -w net.ipv4.ip_forward=1 >/dev/null
sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 2>&1 || true
sysctl -w net.ipv4.conf.default.rp_filter=0 >/dev/null 2>&1 || true
iptables -P FORWARD ACCEPT >/dev/null 2>&1 || true
ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.69.16.129/29 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 10.69.16.162/30 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 10.69.16.165/30 dev eth2
ip link set eth3 up
ip addr flush dev eth3
ip addr add 10.69.16.169/30 dev eth3
ip route replace default via 10.69.16.161 dev eth1
ip route replace 10.69.0.0/22 via 10.69.16.130 dev eth0
ip route replace 10.69.10.0/23 via 10.69.16.170 dev eth3
ip route replace 10.69.12.0/23 via 10.69.16.166 dev eth2
ip route replace 10.69.15.0/24 via 10.69.16.170 dev eth3
ip route replace 10.69.16.0/26 via 10.69.16.166 dev eth2
ip route replace 10.69.16.136/30 via 10.69.16.170 dev eth3
ip route replace 10.69.16.144/29 via 10.69.16.132 dev eth0
ip route replace 10.69.16.152/29 via 10.69.16.170 dev eth3
ip route replace 10.69.16.172/30 via 10.69.16.132 dev eth0
ip route replace 10.69.16.176/28 via 10.69.16.170 dev eth3
ip route replace 10.69.16.64/27 via 10.69.16.131 dev eth0
ip route replace 10.69.16.96/27 via 10.69.16.170 dev eth3
ip route replace 10.69.4.0/22 via 10.69.16.132 dev eth0
ip route replace 10.69.8.0/23 via 10.69.16.131 dev eth0
echo CONFIGURED-Wired
