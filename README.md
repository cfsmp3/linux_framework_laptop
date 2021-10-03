## Notes on running Linux on a framework laptop

These are just jotted down notes. Still a work on progress as I'm taking the opportunity to test more stuff I never had time to play with. It it not yet my daily driver.

### Hardware
Framework laptop, batch 3 (09 / 2021)

- CPU: Intel® Core™ i7-1165G7
- Memory: 64GB (2 x 32GB) DDR4-3200
- WiFi: Intel® Wi-Fi 6E AX210 No vPro®
- Storage: 2TB - WD_BLACK™ SN850 NVMe™
- Expansions card plugged: 2 USB-C, 1 USB-A, 1 HDMI
- Keyboard: US English

### Linux
```
Ubuntu 21.04
Linux framework 5.12.0-051200-generic #202104252130 SMP Sun Apr 25 21:33:13 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
Using Rogolith (i3 flavor). 

```
### Display
1 external monitor. Dell U3419W (3440 x 1440, ultrawide). Laptop runs in clamshell all the time.

### Dock
Anker 13-in-1 Thunderbolt 3

### Kernel
Tested kernel 5.11 (default on Ubuntu 21.04), 5.14, and 5.12 (currently in use).
5.14 is unusable: Sleep is broken (or wake up is broken) and the only way to get the system back is by hard rebooting.
5.12 works well but needs a bit of work, see below.

### Wi-Fi
Wi-Fi with kernel 5.12 by default "sort of works", but speeds are terrible, something like 8 Mbit/s on a good day. The good news is that just adding the correct firmware fixed it for me, no need for any magic incantation. 

Download the firmware from intel's website (I don't know if I can just copy it in this repo) and copy the file `iwlwifi-ty-a0-gf-a0-59.ucode` to `/usr/lib/firmware/iwlwifi-ty-a0-gf-a0-59.ucode`

https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-ty-59.601f3a66.0.tgz

### Fingerprint reader
It doesn't work by default but the community has already provided instructions and a simple script to build the required drivers. After that it works just fine, both to unlock the computer and even for sudo. 

You can find the pre-built .deb files in the fingerprint directory here if you don't want to build them yourself. Note that I just followed the instructions from the community.

### Dock
I've tested two: Dell's TB16, which is discontinued but can be gotten off eBay at very reasonable prices, and Anker's 13-in-1. Dell's doesn't work very well. Anker's is OK-ish. 

**Tested**
Audio (in/out works fine in zoom, for example)
Keyboard and mouse - work fine and can wake up the PC from sleep. I'm using the monitor's built-in KVM so there is only one cable for both the keyboard and the mouse going from the monitor to the dock, no problems.
Power on on AC: OK (needed it power on the laptop when in clamshell mode with having to open the lid, etc)
1 External monitor works too, but only after Ubuntu is ready, i.e. no BIOS or grub.

**Not tested**
SD reader
USB ports, except for the keyboard and mouse.
More than 1 monitor
