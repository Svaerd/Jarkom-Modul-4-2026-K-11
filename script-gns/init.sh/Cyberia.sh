#!/bin/sh
# K-11-MODUL-4 — konfigurasi node Cyberia
set -e
ip link set lo up
sysctl -w net.ipv4.ip_forward=1 >/dev/null
sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 2>&1 || true
sysctl -w net.ipv4.conf.default.rp_filter=0 >/dev/null 2>&1 || true
iptables -P FORWARD ACCEPT >/dev/null 2>&1 || true
ip link set eth1 up
ip addr flush dev eth1
ip addr add 10.69.14.1/24 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 10.69.16.161/30 dev eth2
ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.168.122.10/24 dev eth0
ip route replace default via 192.168.122.1 dev eth0
ip route replace 10.69.0.0/19 via 10.69.16.162 dev eth2
iptables -t nat -C POSTROUTING -s 10.69.0.0/19 -o eth0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -s 10.69.0.0/19 -o eth0 -j MASQUERADE
echo CONFIGURED-Cyberia
