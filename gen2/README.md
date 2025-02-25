## Vyos-config Generation 2nd

- vyos is the router;
- devices connected via L3 switches;

### Feature

- L3-Switch: gateway, vlan, acl;
- Vyos: nat, bgp;
- DMZ: dns, dhcp-server, check `dmz.md`;

### Usage

- install `ansible`, `python3-paramiko` and [`vyos.vyos`](https://docs.ansible.com/ansible/latest/collections/vyos/vyos/index.html) collection;
- change ip in `hosts`, fill vars in `vars/secrets.yaml`;
- run `ansible-playbook -i hosts main.yml`;