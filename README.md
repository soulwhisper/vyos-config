# vyos-config
- re-open for vyos-stream
- AMD64 w/ packages
- for NUC router ( CPU: Intel N100; NIC: i225-V )

## Usage
1. copy this folder to USB stick;
2. add intel nic drivers if needed, [ref](https://support.vyos.io/support/solutions/articles/103000063901-updating-intel-nic-firmware-nvm-and-drivers-on-vyos);
3. copy config files to `/config`;
4. run 'apply-config.sh' to init;

## Credits
- [onedr0p/vyos-config](https://github.com/onedr0p/infra/tree/main/ansible/roles/vyos)
- [Ramblurr/vyos-config](https://github.com/Ramblurr/home-ops/tree/main/vyos)
- [bjw-s/vyos-config](https://github.com/bjw-s/vyos-config)
