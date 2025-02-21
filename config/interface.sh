#!/bin/vbash

# load /opt/vyatta/etc/config.boot.default

# Router.Gen1.interfaces: WAN(1), LAN(1), STACK(2), OPT(2);
# Router.Gen2.interfaces: WAN(1), LAN(1), STACK(2); STACK(2) = SFP x2;

set interfaces ethernet eth0 description 'WAN'
set interfaces pppoe pppoe0 description 'WAN pppoe'
set interfaces pppoe pppoe0 authentication username "${ISP_AUTH_USER}"
set interfaces pppoe pppoe0 authentication password "${ISP_AUTH_PASS}"
set interfaces pppoe pppoe0 source-interface 'eth0'
set interfaces pppoe pppoe0 ipv6 address autoconf

set interfaces ethernet eth1 description 'LAN'
set interfaces ethernet eth1 address '10.0.0.1/24'
set service router-advert interface eth1 link-mtu '1492'
set service router-advert interface eth1 name-server '2606:4700:4700::1111'
set service router-advert interface eth1 name-server '2606:4700:4700::1001'
set service router-advert interface eth1 prefix ::/64 valid-lifetime '172800'

set interfaces bonding bond0 description 'STACK'
set interfaces bonding bond0 member interface 'eth2'
set interfaces bonding bond0 member interface 'eth3'
set interfaces bonding bond0 hash-policy 'layer2+3'
set interfaces bonding bond0 mode '802.3ad'

set interfaces bonding bond0 vif 10 address '10.0.10.1/24'
set interfaces bonding bond0 vif 100 address '10.10.0.1/24'
set interfaces bonding bond0 vif 200 address '10.20.0.1/24'
