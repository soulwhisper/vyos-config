#!/bin/vbash

# VRF
set vrf bind-to-all

set vrf name WAN table '101'
set vrf name WAN protocols static route 10.0.0.0/24 interface eth1 vrf 'LAN'
set vrf name WAN protocols static route 10.0.10.0/24 interface bond0.10 vrf 'DMZ'
set vrf name WAN protocols static route 10.10.0.0/24 interface bond0.100 vrf 'LAB'
set vrf name WAN protocols static route 10.20.0.0/24 interface bond0.200 vrf 'WIFI'

set vrf name LAN table '102'
set vrf name LAN protocols static route 0.0.0.0/0 interface pppoe0 vrf 'WAN'
set vrf name LAN protocols static route 10.0.10.0/24 interface bond0.10 vrf 'DMZ'
set vrf name LAN protocols static route 10.10.0.0/24 interface bond0.100 vrf 'LAB'
set vrf name LAN protocols static route 10.20.0.0/24 interface bond0.200 vrf 'WIFI'

set vrf name DMZ table '103'
set vrf name DMZ protocols static route 0.0.0.0/0 interface pppoe0 vrf 'WAN'
set vrf name DMZ protocols static route 10.0.0.0/24 interface eth1 vrf 'LAN'
set vrf name DMZ protocols static route 10.10.0.0/24 interface bond0.100 vrf 'LAB'
set vrf name DMZ protocols static route 10.20.0.0/24 interface bond0.200 vrf 'WIFI'

set vrf name LAB table '104'
set vrf name LAB protocols static route 0.0.0.0/0 interface pppoe0 vrf 'WAN'
set vrf name LAB protocols static route 10.0.0.0/24 interface eth1 vrf 'LAN'
set vrf name LAB protocols static route 10.0.10.0/24 interface bond0.10 vrf 'DMZ'

set vrf name WIFI table '105'
set vrf name WIFI protocols static route 0.0.0.0/0 interface pppoe0 vrf 'WAN'
set vrf name WIFI protocols static route 10.0.0.0/24 interface eth1 vrf 'LAN'
set vrf name WIFI protocols static route 10.0.10.0/24 interface bond0.10 vrf 'DMZ'

# Firewall
set firewall global-options state-policy established action 'accept'
set firewall global-options state-policy related action 'accept'
set firewall global-options state-policy invalid action 'drop'
set firewall global-options state-policy invalid log
set firewall global-options all-ping enable
set firewall global-options broadcast-ping disable

set firewall ipv4 input filter default-action 'drop'
set firewall ipv4 input filter default-log
set firewall ipv4 input filter rule 10 action 'accept'
set firewall ipv4 input filter rule 10 description 'Allow LAN to Router'
set firewall ipv4 input filter rule 10 inbound-interface name 'LAN'

# `inbound-interface` use VRF name, `outbound-interface` use interface name;
set firewall ipv4 forward filter default-action 'drop'
set firewall ipv4 forward filter default-log
set firewall ipv4 forward filter rule 10 action 'accept'
set firewall ipv4 forward filter rule 10 description 'Allow ALL to WAN'
set firewall ipv4 forward filter rule 10 outbound-interface name 'pppoe0'
set firewall ipv4 forward filter rule 20 action 'accept'
set firewall ipv4 forward filter rule 20 description 'Allow LAN to STACK'
set firewall ipv4 forward filter rule 20 inbound-interface name 'LAN'
set firewall ipv4 forward filter rule 20 outbound-interface name 'bond0.*'
set firewall ipv4 forward filter rule 30 action 'accept'
set firewall ipv4 forward filter rule 30 description 'Allow ALL to DMZ'
set firewall ipv4 forward filter rule 30 outbound-interface name 'bond0.10'
set firewall ipv4 forward filter rule 100 action 'accept'
set firewall ipv4 forward filter rule 100 description 'Allow DMZ to LAB'
set firewall ipv4 forward filter rule 100 inbound-interface name 'DMZ'
set firewall ipv4 forward filter rule 100 outbound-interface name 'bond0.100'
