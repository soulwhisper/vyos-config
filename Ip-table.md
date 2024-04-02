# Ip Table

| ip/subnet       | vlan | usage        | notes               |
| --------------- | ---- | ------------ | ------------------- |
| 10.0.0.0/16     | -    | homelab      | w/ clash proxy      |
| 10.0.0.10/24    | -    |              | truenas-scale       |
| 10.0.0.11/24    | -    |              | talos-node-01       |
| 10.0.0.12/24    | -    |              | talos-node-02       |
| 10.0.0.13/24    | -    |              | talos-node-03       |
| 10.0.10.0/24    | 10   |              | ipmi / wireguard    |
| 10.0.20.0/24    | 20   |              | storage / nas       |
| 10.0.30.0/24    | 30   |              | security            |
| 10.10.0.0/16    | 100  | wifi trusted | 5Ghz                |
| 10.20.0.0/16    | 200  | iot device   | include wifi 2.4Ghz |
| 10.30.0.0/16    | 300  | guest        |                     |
| 172.16.0.0/16   |      | talos        | pod                 |
| 172.17.0.0/16   |      |              | svc                 |
| 192.168.0.0/16  | -    | containers   |                     |