# Pop!_OS 19.04

## Installation
- NVIDIA image, works out of the box, GNOME integration or `system76-power graphics intel/nvidia` via CLI
- full disk enc. as prompted (nice to see)
- tlp default settings

### DNS over HTTPS
Install `dnscrypt-proxy`, set DNS to 127.0.2.1.

## DE
- GNOME by default
- Installed xfce4 + goodies, kept GNOME packages
- lightdm autologin
  ```
  [Seat:*]
  autologin-user=trishmapow
  ```
