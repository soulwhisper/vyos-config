#!/usr/bin/env python3
import os
import netifaces

def get_ip_addresses(ifname):
    addresses = netifaces.ifaddresses(ifname)
    ipv4 = None
    ipv6 = None

    if netifaces.AF_INET in addresses:
        ipv4_info = addresses[netifaces.AF_INET][0]
        ipv4 = ipv4_info.get('addr')

    if netifaces.AF_INET6 in addresses:
        for addr in addresses[netifaces.AF_INET6]:
            ipv6_addr = addr.get('addr')
            if ipv6_addr and '%' in ipv6_addr:
                ipv6_addr = ipv6_addr.split('%')[0]  # Remove the interface identifier part
            if ipv6_addr and not ipv6_addr.startswith('fe80'):  # Skip link-local addresses
                ipv6 = ipv6_addr
                break

    return ipv4, ipv6

def main():
    interfaces = os.listdir('/sys/class/net/')
    metrics = []
    for iface in interfaces:
        ipv4, ipv6 = get_ip_addresses(iface)
        if ipv4 or ipv6:
            labels = []
            if ipv4:
                labels.append(f'ipv4="{ipv4}"')
            if ipv6:
                labels.append(f'ipv6="{ipv6}"')
            metrics.append(f'node_network_iface_ip{{device="{iface}", {", ".join(labels)}}} 1')

    with open('/config/container/node_exporter/textfile_collector/interface_ips.prom', 'w') as f:
        for metric in metrics:
            f.write(metric + '\n')

if __name__ == '__main__':
    main()