# vyos-config
- re-open for vyos-stream
- AMD64 w/ packages
- for NUC router ( CPU: Intel N100; NIC: i225-V )

## Usage

- download this repo;
- fill vars in `config/example.env`, then rename it `.env`;

### bootstrap

- copy files to usb stick, mount it inside vyos;
- run `apply-config.sh`;
- reboot;

### update

- install `ansible`, `python3-paramiko` and `vyos.vyos` collection; [ref](https://docs.ansible.com/ansible/latest/collections/vyos/vyos/index.html);
- change ip in `hosts`;
- run `ansible-playbook -i hosts main.yml`;

## Credits
- [onedr0p/vyos-config](https://github.com/onedr0p/infra/tree/main/ansible/roles/vyos)
- [Ramblurr/vyos-config](https://github.com/Ramblurr/home-ops/tree/main/vyos)
- [bjw-s/vyos-config](https://github.com/bjw-s/vyos-config)
