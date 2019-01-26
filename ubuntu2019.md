# Ubuntu 18.04 2019 Setup

## Installation
- Use full-disk encryption
- Automatic login (due to above - save time)
- Don't automatically install Nvidia drivers
- Still haven't solved Nvidia Optimus/Bumblebee yet, currently using Integrated Graphics only
- Install tlp for power management, default settings are fine

### Desktop Environment
- Sticking with GNOME because it's easy to setup and has great extensions
  - Alt-tab switcher popup delay removal
  - Alternate-tab (don't group by application)
  - Dash to panel (bottom task bar)
  - Frippery applications menu (don't really use this - just like the Ubuntu 'Start menu' icon)
  - Gsconnect: pair with Android phone, mount FS, read messages etc
  - Panel osd: move notifications to the bottom right
  - Power indicator: show wattage, ~5W idle, ~10W web browsing
  - Removable drive menu (unmount etc)
  - User themes
  
### Swapfile
Need ~4GB extra especially for Windows KVM
```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# edit /etc/fstab and add
/swapfile swap swap defaults 0 0
```

### Improving boot/shutdown performance
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

### Startup Applications
- **Albert** (launcher): https://github.com/albertlauncher/albert. Great launcher for apps and searches files very quickly. Has nice extensions to e.g. show IP, calculator. Have it mapped to Alt+Space.
- **MEGASync**: most generous cloud provider 50GB. The desktop app also has streaming functionality which is great.

## Windows on KVM
-- to be added --

Download ISO: https://www.microsoft.com/en-au/software-download/windows10ISO

## Miscellaneous Apps
- Joplin (note-taking), CherryTree (not md compatible)
- OnlyOffice Desktop Editors
- Sublime Text
- IntelliJ Idea
- Chromium (daily use) - still need to fix DRM playback
- Firefox (blank profile/when Chromium doesn't work)
