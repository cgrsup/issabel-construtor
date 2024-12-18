#!/bin/bash
iptables -I INPUT -s 10.0.0.0/8 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 10.0.0.0/8 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.64.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.64.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.66.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.66.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.81.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.81.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.82.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.82.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.83.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 100.83.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.62.64.0/20 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.62.80.0/20 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.90.96.0/20 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.105.128.0/20 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.96.128.0/20 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.96.144.0/20 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 191.242.48.0/21 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 170.83.200.0/22 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.205.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.148.128.0/17 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.232.0.0/17 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.153.0.0/17 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.168.160.0/19 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.168.192.0/18 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.171.192.0/19 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.206.0.0/17 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.159.0.0/18 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.159.64.0/18 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.28.0.0/17 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.28.128.0/17 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.63.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.91.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.20.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.44.0.0/16 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.56.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.108.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 187.8.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 187.50.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 187.92.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 186.200.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 186.238.0.0/15 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 168.227.192.0/22 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.25.0.0/18 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.61.128.0/18 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.84.160.0/19 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.215.128.0/19 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.245.64.0/19 -p tcp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.62.64.0/20 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.62.80.0/20 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.90.96.0/20 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.105.128.0/20 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.96.128.0/20 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.96.144.0/20 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 191.242.48.0/21 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 170.83.200.0/22 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.205.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.148.128.0/17 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.232.0.0/17 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.153.0.0/17 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.168.160.0/19 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.168.192.0/18 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.171.192.0/19 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.206.0.0/17 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.159.0.0/18 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 200.159.64.0/18 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.28.0.0/17 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.28.128.0/17 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.63.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 201.91.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.20.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.44.0.0/16 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.56.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 189.108.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 187.8.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 187.50.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 187.92.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 186.200.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 186.238.0.0/15 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 168.227.192.0/22 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.25.0.0/18 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.61.128.0/18 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.84.160.0/19 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 177.215.128.0/19 -p udp --dport 5060 -j ACCEPT
iptables -I INPUT -s 179.245.64.0/19 -p udp --dport 5060 -j ACCEPT
service iptables save
