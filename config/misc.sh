#!/bin/vbash

# dns
set service dns forwarding domain 'noirprime.com' name-server '10.0.10.10'

# ntp
delete service ntp allow-client
delete service ntp server
set service ntp server 'time.cloudflare.com' nts
set service ntp listen-address '10.10.0.1'
set service ntp allow-client address '10.10.0.0/24'

# SSH
set service ssh port '2022'
set service ssh listen-address '10.0.0.1'
set service ssh disable-host-validation
set service ssh disable-password-authentication
set system login user vyos authentication public-keys 'Default' key "AAAAC3NzaC1lZDI1NTE5AAAAIB16hkZ4PM3ucd6spFVd2J2YB4NGpuuiXGM+gmL6mbpO"
set system login user vyos authentication public-keys 'Default' type ssh-ed25519

# system
set system host-name 'router'
set system domain-name 'homelab.internal'
set system time-zone 'Asia/Shanghai'
set system name-server '1.1.1.1'
set system name-server '1.0.0.1'
