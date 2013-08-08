#!/bin/bash
 
# Local Network
NETWORK=192.168.16.0
GW=192.168.16.1
 
# Server IP Address
SERVER=123.123.123.123
# Server External Interface
SERVER_IF=eth0
 
echo "Creating Connection..."
ssh -w 0:0 -f $SERVER "ifconfig tun0 10.0.2.1 netmask 255.255.255.252 pointopoint 10.0.2.2 ; echo 1 > /proc/sys/net/ipv4/ip_forward ;/sbin/iptables -t nat -A POSTROUTING -o $SERVER_IF -j MASQUERADE ;route add -net $NETWORK gw 10.0.2.2 dev tun0"
 
echo "Setting up local interface..."
ifconfig tun0 10.0.2.2 netmask 255.255.255.252 pointopoint 10.0.2.1
route add -net ${SERVER%.*}.0/24 gw 10.0.2.1 dev tun0
route add $SERVER gw $GW
route add default gw 10.0.2.1 tun0
route del default gw $GW
