#!/bin/vbash

# DHCP Server
set service dhcp-server hostfile-update
set service dhcp-server shared-network-name HOMELAB authoritative
set service dhcp-server shared-network-name HOMELAB option domain-name 'homelab.internal'
set service dhcp-server shared-network-name HOMELAB option domain-search 'homelab.internal'

## LAN
set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 subnet-id '1'
set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 option default-router '10.0.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 option name-server '10.0.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 range 0 start '10.0.0.101'
set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 range 0 stop '10.0.0.250'

set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 static-mapping 'Homelab-PC' mac 2c:f0:5d:d9:ae:36
set service dhcp-server shared-network-name HOMELAB subnet 10.0.0.0/24 static-mapping 'Homelab-PC' ip-address 10.0.0.100

## LAB
set service dhcp-server shared-network-name HOMELAB subnet 10.10.0.0/24 subnet-id '2'
set service dhcp-server shared-network-name HOMELAB subnet 10.10.0.0/24 option default-router '10.10.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.10.0.0/24 option name-server '10.10.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.10.0.0/24 range 0 start '10.10.0.101'
set service dhcp-server shared-network-name HOMELAB subnet 10.10.0.0/24 range 0 stop '10.10.0.250'

## WIFI
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 subnet-id '3'
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 option default-router '10.20.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 option name-server '10.20.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 range 0 start '10.20.0.101'
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 range 0 stop '10.20.0.250'

set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Homelab-MBA' mac 50:a6:d8:dc:9f:c1
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Homelab-MBA' ip-address 10.20.0.100

set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Aqara-M3' mac 54:ef:44:64:89:12
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Aqara-M3' ip-address 10.20.0.90

set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Unifi-AP1' mac 9c:05:d6:a1:69:c7
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Unifi-AP1' ip-address 10.20.0.91

set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Unifi-AP2' mac 9c:05:d6:a1:62:77
set service dhcp-server shared-network-name HOMELAB subnet 10.20.0.0/24 static-mapping 'Unifi-AP2' ip-address 10.20.0.92

## DMZ:none
