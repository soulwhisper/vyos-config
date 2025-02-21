#!/bin/vbash

# Container networks
set container network containers description 'Network for VyOS containers'
set container network containers prefix '192.168.101.0/24'

# monitor, ref:https://support.vyos.io/support/solutions/articles/103000290174-monitoring-vyos-with-prometheus-and-grafana
set system task-scheduler task ip-export interval 1h
set system task-scheduler task ip-export executable path '/config/container/node_exporter/textfile_collector:/export-ip-metrics.py'
set system task-scheduler task podman-export executable path '/config/container/node_exporter/textfile_collector:/export-podman-metrics.py'
set system task-scheduler task podman-export interval '1m'

## node-exporter
set container name node-exporter image quay.io/prometheus/node-exporter:v1.8.1
set container name node-exporter argument '--path.procfs /host/proc --path.sysfs /host/sys --path.rootfs /host/rootfs --collector.textfile.directory=/var/lib/node_exporter/textfile_collector --collector.filesystem.ignored-mount-points ^(sys|proc|dev|etc|host)'
set container name node-exporter restart on-failure
set container name node-exporter memory 256
set container name node-exporter allow-host-networks
set container name node-exporter volume osrelease source '/etc/os-release'
set container name node-exporter volume osrelease destination '/etc/os-release'
set container name node-exporter volume osrelease mode ro
set container name node-exporter volume procfs source '/proc'
set container name node-exporter volume procfs destination '/host/proc'
set container name node-exporter volume procfs mode ro
set container name node-exporter volume rootfs source '/'
set container name node-exporter volume rootfs destination '/host/rootfs'
set container name node-exporter volume rootfs mode ro
set container name node-exporter volume sysfs source '/sys'
set container name node-exporter volume sysfs destination '/host/sys'
set container name node-exporter volume sysfs mode ro
set container name node-exporter volume txtfile source '/config/container/node_exporter/textfile_collector'
set container name node-exporter volume txtfile destination '/var/lib/node_exporter/textfile_collector'
set container name node-exporter volume txtfile mode ro
set container name node-exporter environment 'TZ' value 'Asia/Shanghai'

## blackbox exporter
set container name blackbox-exporter image quay.io/prometheus/blackbox-exporter:v0.25.0
set container name blackbox-exporter argument '--config.file=/config/blackbox.yml'
set container name blackbox-exporter restart on-failure
set container name blackbox-exporter memory 128
set container name blackbox-exporter allow-host-networks
set container name blackbox-exporter capability net-raw
set container name blackbox-exporter volume config source '/config/container/blackbox_exporter/config'
set container name blackbox-exporter volume config destination '/config'
set container name blackbox-exporter environment 'TZ' value 'Asia/Shanghai'

# cloudflare ddns
set container name cloudflare-ddns image jeessy/ddns-go:v6.8.1
set container name cloudflare-ddns argument '-c /config/config.yml'
set container name cloudflare-ddns restart on-failure
set container name cloudflare-ddns memory 128
set container name cloudflare-ddns port web protocol tcp
set container name cloudflare-ddns port web source 9876
set container name cloudflare-ddns port web destination 9876
set container name cloudflare-ddns volume config source '/config/container/cloudflare_ddns/config'
set container name cloudflare-ddns volume config destination '/config'
set container name cloudflare-ddns environment 'TZ' value 'Asia/Shanghai'