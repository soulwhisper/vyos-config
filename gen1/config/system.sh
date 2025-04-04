#!/bin/vbash

set system host-name 'router'
set system domain-name 'homelab.internal'

set system time-zone 'Asia/Shanghai'

set system name-server '1.1.1.1'
set system name-server '1.0.0.1'
set system name-server '2606:4700:4700::1111'
set system name-server '2606:4700:4700::1001'

set system login user vyos authentication public-keys 'Default' key "AAAAC3NzaC1lZDI1NTE5AAAAIB16hkZ4PM3ucd6spFVd2J2YB4NGpuuiXGM+gmL6mbpO"
set system login user vyos authentication public-keys 'Default' type ssh-ed25519

set system option startup-beep
set system option reboot-on-panic
set system option root-partition-auto-resize

# https://docs.vyos.io/en/latest/configuration/system/option.html#performance
set system option performance throughput

# until vyos-stream
# set system update-check auto-check
# set system update-check url 'https://raw.githubusercontent.com/vyos/public-images/main/version.json'