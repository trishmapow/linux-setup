# Pop!_OS 19.04

## Installation
- NVIDIA image, works out of the box, GNOME integration or `system76-power graphics intel/nvidia` via CLI
- full disk enc. as prompted (nice to see)
- tlp default settings

### DNS over HTTPS
Install `dnscrypt-proxy`, set DNS to 127.0.2.1.

### Scheduler
Show current: `cat /sys/block/sda/queue/scheduler`.

Change to `bfq`:
- `echo bfq | sudo tee /etc/modules-load.d/bfq.conf`
- `ACTION=="add|change", KERNEL=="sd*[!0-9]|sr*", ATTR{queue/scheduler}="bfq"` > `/etc/udev/rules.d/60-scheduler.rules`
- `sudo udevadm control --reload`
- `sudo udevadm trigger`

## DE
- GNOME by default
- Installed xfce4 + goodies, kept GNOME packages
- lightdm autologin
  ```
  [Seat:*]
  autologin-user=trishmapow
  ```

## Shell
- fish as default shell
- [fisher](https://github.com/jorgebucaran/fisher) package manager
  - `fisher add franciscolourenco/done` notify when command finishes
- `abbr --add copy 'rsync -avh --progress'` etc.
- fan control via asus-nb-wmi kernel module
```fish
function fan
  if test "$argv[1]" = "on"
    echo 255 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon2/pwm1 >/dev/null
  else if test "$argv[1]" = "off"
    echo 2 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon2/pwm1_enable >/dev/null
  else
    echo "Usage: fan [on|off]"
  end
end
