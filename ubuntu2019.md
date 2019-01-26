# Ubuntu 18.04 2019 Setup

## Installation
- Use full-disk encryption
- Automatic login (due to above - save time)
- Don't automatically install Nvidia drivers
- Still haven't solved Nvidia Optimus/Bumblebee yet, currently using Integrated Graphics only

## Improving boot/shutdown performance
View last boot time with `systemd-analyze time`.
- Edit /etc/default/grub, remove timeout, force ACPI to fix shutdown hang problem. Remove `quiet splash` for easier diagnostics, and it looks better too :)
```bash
GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="acpi=force"
GRUB_CMDLINE_LINUX=""
```
- Fix systemd timeouts `/etc/systemd/system.conf`.
Uncomment and modify
```bash
DefaultTimeoutStartSec=10s
DefaultTimeoutStopSec=10s
```

Results (including ~2s to type encryption password):
```bash
trishmapow@tpc:~$ systemd-analyze time
Startup finished in 2.646s (firmware) + 4.504s (loader) + 8.394s (kernel) + 6.761s (userspace) = 22.306s
graphical.target reached after 6.556s in userspace
```
