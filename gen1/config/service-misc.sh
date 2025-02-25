#!/bin/vbash

# DNS
set service dns forwarding domain 'noirprime.com' name-server '10.0.10.10'

# NTP
delete service ntp allow-client
delete service ntp server
set service ntp server 'time.cloudflare.com' nts
set service ntp listen-address '10.10.0.1'
set service ntp allow-client address '10.10.0.0/24'

# SSH
set service ssh port '22'
set service ssh listen-address '10.0.0.1'
set service ssh disable-host-validation
set service ssh disable-password-authentication

# DDNS
# username is literal word `token`, ref:https://github.com/ddclient/ddclient/issues/599#issuecomment-1886563471
set service dns dynamic name cloudflare description 'cloudflare ddns service'
set service dns dynamic name cloudflare username 'token'
set service dns dynamic name cloudflare password "${CLOUDFLARE_DNS_TOKEN}"
set service dns dynamic name cloudflare host-name 'opn.noirprime.com'
set service dns dynamic name cloudflare protocol 'cloudflare'
set service dns dynamic name cloudflare address interface 'eth0'