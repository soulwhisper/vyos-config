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

## Firewall

- Allow All to WAN;
- Allow LAN to All;
- Allow All to DMZ; incl. DNAT from WAN;
- Allow DMZ to LAB;
- Drop others;

### Options

- **Zones**: more rules, slower speed; easily 100+ rules for a few subnets;
- **VRF**: routing based, switch friendly; preferred; [ref](https://docs.vyos.io/en/latest/configexamples/fwall-and-vrf.html);