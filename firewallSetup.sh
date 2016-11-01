#!/bin/bash
#Delete any previous rules in the INPUT, FORWARD and OUTPUT tables
sudo iptables -F

#Enable ssh only from computers in the range 130.15.0.0 to 130.15.255.255
sudo iptables -A INPUT -p TCP --dport 22 -s 130.15.0.0/16 -j ACCEPT

#Enable ssh from computers in any private network
sudo iptables -A INPUT -p TCP --dport 22 -m iprange --src-range 10.0.0.0-130.255.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --dport 22 -m iprange --src-range 172.16.0.0-172.31.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --dport 22 -m iprange --src-range 192.168.0.0-192.168.255.255 -j ACCEPT

#Enable http and https from any IP
sudo iptables -A INPUT -p TCP -m multiport --dport 80,443 -j ACCEPT

#Drop any other incoming tcp traffic
sudo iptables -A INPUT -p TCP -j DROP

#Block connecting from your computer to any IP outside the range 130.15.0.0 to 130.15.255.255 
sudo iptables -A OUTPUT -p TCP -s 130.15.0.0/16 -j ACCEPT
sudo iptables -A OUTPUT -p TCP -m iprange --src-range 0.0.0.0-255.255.255.255 -j ACCEPT

#Only allow IP 130.15.100.100 to connect to your mysql running on port 3306
sudo iptables -A INPUT -p TCP --dport 3306 -s 130.15.100.100 -j ACCEPT

#Drop outgoing ssh traffic to all other computers
sudo iptables -A OUTPUT -p TCP --dport 22 -j DROP


#I can still ssh the VM from my host machine becuase I am connecting from a private IP.
