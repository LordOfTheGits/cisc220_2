#!/bin/bash
sudo iptables -F
sudo iptables -A INPUT -p TCP --dport 80 -m iprange --src-range 130.15.0.0-130.15.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --dport 80 -m iprange --src-range 10.0.0.0-130.255.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --dport 80 -m iprange --src-range 172.16.0.0-172.31.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --dport 80 -m iprange --src-range 192.168.0.0-192.168.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP -m multiport --dport 80,443 -j ACCEPT
sudo iptables -A INPUT -p TCP -j DROP
sudo iptables -A OUTPUT -p TCP --dport 80 -m iprange --src-range 130.15.0.0-130.15.255.255 -j DROP
sudo iptables -A INPUT -p TCP --dport 3306 -s 130.15.100.100 -j ACCEPT
sudo iptables -A OUTPUT -p TCP --dport 22 -j DROP
