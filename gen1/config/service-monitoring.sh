#!/bin/vbash

# use built-in services instead of containers, listen on DMZ

set service monitoring prometheus node-exporter listen-address 10.0.10.1
set service monitoring prometheus node-exporter port 9100
set service monitoring prometheus node-exporter vrf 'DMZ'
set service monitoring prometheus node-exporter collectors textfile

set service monitoring prometheus blackbox-exporter listen-address 10.0.10.1
set service monitoring prometheus blackbox-exporter port 9101
set service monitoring prometheus blackbox-exporter vrf 'DMZ'
set service monitoring prometheus blackbox-exporter modules dns name dns4 preferred-ip-protocol ip4
set service monitoring prometheus blackbox-exporter modules dns name dns4 query-name www.cloudflare.com
set service monitoring prometheus blackbox-exporter modules dns name dns4 query-type A

set service monitoring prometheus frr-exporter listen-address 10.0.10.1
set service monitoring prometheus frr-exporter port 9102
set service monitoring prometheus frr-exporter vrf 'DMZ'