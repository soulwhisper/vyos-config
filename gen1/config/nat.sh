#!/bin/vbash

# SNAT
set nat source rule 100 description 'ALL -> WAN'
set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'

# DNAT/Port-forward
set nat destination rule 10 description 'Port Forward: 11010 to 10.0.10.10'
set nat destination rule 10 destination port '11010'
set nat destination rule 10 inbound-interface name 'eth0'
set nat destination rule 10 protocol 'tcp_udp'
set nat destination rule 10 translation address '10.0.10.10'