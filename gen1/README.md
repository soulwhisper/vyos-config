## Vyos-config Generation 1st

- vyos is the main router;
- devices connected via L2 switches;

### Feature

- Vyos: gateway, vlan, nat, firewall, main-dns, bgp, dhcp-server;

### Usage

- copy this folder to usb stick;
- fill vars in `config/example.env`, then rename it `.env`;
- mount it inside vyos, run `apply-config.sh`;
- reboot;