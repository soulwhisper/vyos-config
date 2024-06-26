#!/bin/bash

load /opt/vyatta/etc/config.boot.default

set interfaces ethernet eth0 description 'LAN'
set interfaces ethernet eth0 address '10.0.0.1/24'
set interfaces ethernet eth0 hw-id '00:10:00:00:00:01'

set interfaces ethernet eth3 description 'WAN - Cable'
set interfaces ethernet eth3 address 'dhcp'
set interfaces ethernet eth3 hw-id '00:10:00:00:00:04'

set system login user vyos authentication public-keys personal key ''
set system login user vyos authentication public-keys personal type 'ssh-ed25519'

set service ssh disable-password-authentication
set service ssh port '22'

delete system host-name
set system host-name 'gateway'
set system domain-name 'homelab.internal'

set system ipv6 disable-forwarding

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

set system time-zone 'Asia/Shanghai'

set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 default-router '10.0.0.1'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 lease '86400'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 start '10.0.0.200'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 stop '10.0.0.254'

# ALL -> WAN masquerade
set nat source rule 100 description 'LAN -> WAN'
set nat source rule 100 outbound-interface 'eth3'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'
