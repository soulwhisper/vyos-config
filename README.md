# vyos-config
-  **Latest LTS and Current, rolling**
- AMD64 w/ packages
- for NUC router ( CPU: Intel N100; NIC: i225-V )

## Packages
- moreutils
- tree
- vim
- jo
- jq
- [vyaml](https://github.com/p3lim/vyaml)
- [sops](https://github.com/getsops/sops)
- [age](https://github.com/FiloSottile/age)
- [bottom](https://github.com/ClementTsang/bottom)

## Usage
Copy this folder to USB then run 'apply-config.sh' when init

## Credits
- [onedr0p/vyos-build](https://github.com/onedr0p/vyos-build)
- [Ramblurr/vyos](https://github.com/Ramblurr/vyos)
- [bjw-s/vyos-config](https://github.com/bjw-s/vyos-config)

# TODO
- add container configs for adguard / dnsmasq / matchbox / kms / clash / haas
- change reference configs
- update age and sops secrets