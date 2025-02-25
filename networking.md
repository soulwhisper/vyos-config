## Networking

### LAN
- Management, workstations;
- `10.0.0.0/24`, vlan=`1`, `eth1`;

### DMZ
- dmz network, web servers;
- `10.0.10.0/24`, vlan=`10`, `bond0.10`;

### LAB
- homelab network;
- `10.10.0.0/24`, vlan=`100`, `bond0.100`;

### WIFI
- wifi network, include iot;
- `10.20.0.0/24`, vlan=`200`, `bond0.200`;

## Firewall/ACL

- Allow All to WAN;
- Allow LAN to All;
- Allow 80/443/53/179 to DMZ;
- Drop others;
