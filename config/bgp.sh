#!/bin/vbash

set protocols bgp system-as 65510
set protocols bgp parameters router-id '10.10.0.1'
# set protocols bgp parameters ebgp-requires-policy # disabled by default, avoid route-map
set protocols bgp address-family ipv4-unicast maximum-paths ebgp 1
set protocols bgp address-family ipv4-unicast redistribute connected

set protocols bgp peer-group k8s
set protocols bgp peer-group k8s remote-as '65512'
set protocols bgp peer-group k8s address-family ipv4-unicast nexthop-self
set protocols bgp peer-group k8s address-family ipv4-unicast soft-reconfiguration inbound
set protocols bgp neighbor 10.10.0.101 peer-group k8s
set protocols bgp neighbor 10.10.0.102 peer-group k8s
set protocols bgp neighbor 10.10.0.103 peer-group k8s
