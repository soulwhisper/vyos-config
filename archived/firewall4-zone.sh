#!/bin/vbash

# Groups
set firewall group network-group dmz address '10.0.10.0/24'
set firewall group network-group lan network '10.0.0.0/24'
set firewall group network-group lab network '10.10.0.0/24'
set firewall group network-group wifi network '10.20.0.0/24'

# Zones
## WAN
set firewall zone wan default-action 'drop'
set firewall zone wan from lan firewall name 'lan-wan'
set firewall zone wan from dmz firewall name 'dmz-wan'
set firewall zone wan from lab firewall name 'lab-wan'
set firewall zone wan from wifi firewall name 'wifi-wan'
set firewall zone wan interface 'pppoe0'

## LAN
set firewall zone lan default-action 'drop'
set firewall zone lan from dmz firewall name 'dmz-lan'
set firewall zone lan from lab firewall name 'lab-lan'
set firewall zone lan from wifi firewall name 'wifi-lan'
set firewall zone lan from wan firewall name 'wan-lan'
set firewall zone lan interface 'eth1'

## DMZ
set firewall zone dmz default-action 'drop'
set firewall zone dmz from lan firewall name 'lan-dmz'
set firewall zone dmz from lab firewall name 'lab-dmz'
set firewall zone dmz from wifi firewall name 'wifi-dmz'
set firewall zone dmz from wan firewall name 'wan-dmz'
set firewall zone dmz interface 'bond0.10'

## LAB
set firewall zone lab default-action 'drop'
set firewall zone lab from lan firewall name 'lan-lab'
set firewall zone lab from dmz firewall name 'dmz-lab'
set firewall zone lab from wifi firewall name 'wifi-lab'
set firewall zone lab from wan firewall name 'wan-lab'
set firewall zone lab interface 'bond0.100'

## WIFI
set firewall zone wifi default-action 'drop'
set firewall zone wifi from lan firewall name 'lan-wifi'
set firewall zone wifi from dmz firewall name 'dmz-wifi'
set firewall zone wifi from lab firewall name 'lab-wifi'
set firewall zone wifi from wan firewall name 'wan-wifi'
set firewall zone wifi interface 'bond0.200'

# Firewall
set firewall global-options state-policy established action 'accept'
set firewall global-options state-policy related action 'accept'
set firewall global-options state-policy invalid action 'drop'
set firewall global-options state-policy invalid log
set firewall global-options all-ping enable
set firewall global-options broadcast-ping disable

## Allow ALL to WAN
set firewall ipv4 name lan-wan default-action 'accept'
set firewall ipv4 name dmz-wan default-action 'accept'
set firewall ipv4 name lab-wan default-action 'accept'
set firewall ipv4 name wifi-wan default-action 'accept'

## Allow ALL to DMZ
set firewall ipv4 name wan-dmz default-action 'accept'
set firewall ipv4 name lan-dmz default-action 'accept'
set firewall ipv4 name lab-dmz default-action 'accept'
set firewall ipv4 name wifi-dmz default-action 'accept'

## Allow LAN to ALL
set firewall ipv4 name lan-dmz default-action 'accept'
set firewall ipv4 name lan-lab default-action 'accept'
set firewall ipv4 name lan-wifi default-action 'accept'
set firewall ipv4 name lan-wan default-action 'accept'

## Allow DMZ to LAB
set firewall ipv4 name dmz-lab default-action 'accept'

## Drop others
set firewall ipv4 name wan-lan default-action 'drop'
set firewall ipv4 name dmz-lan default-action 'drop'
set firewall ipv4 name lab-lan default-action 'drop'
set firewall ipv4 name wifi-lan default-action 'drop'

set firewall ipv4 name wan-lab default-action 'drop'
set firewall ipv4 name wifi-lab default-action 'drop'

set firewall ipv4 name wan-wifi default-action 'drop'
set firewall ipv4 name lab-wifi default-action 'drop'
set firewall ipv4 name dmz-wifi default-action 'drop'
