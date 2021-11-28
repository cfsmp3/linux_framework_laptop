## Notes on running Linux on a framework laptop

These are just jotted down notes. Still a work on progress as I'm taking the opportunity to test more stuff I never had time to play with.

Almost everything comes from the framework community forums. Just compiled it here for convenience.

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
Ubuntu 21.10
Linux framework 5.12.0-051200-generic #202104252130 SMP Sun Apr 25 21:33:13 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
Using Rogolith (i3 flavor). 

```
### Display
1 external monitor. Dell U3419W (3440 x 1440, ultrawide). Laptop runs in clamshell all the time.

### Dock
Anker 13-in-1 Thunderbolt 3

### Kernel
Tested kernel 5.11 (default on Ubuntu 21.04), 5.14, and 5.12 (currently in use).  
5.14.00 and 5.14.13-051413 are unusable: Sleep is broken (or wake up is broken) and the only way to get the system back is by hard rebooting.  
5.12 works well but needs a bit of work, see below.  
Update: 5.14.21-051421 seems to finally have everything working. You can get it here: https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.14.21/

You can get 5.12 here: https://ubuntuhandbook.org/index.php/2021/04/linux-kernel-5-12-released/

### Wi-Fi
Wi-Fi with kernel 5.12 by default "sort of works", but speeds are terrible, something like 8 Mbit/s on a good day. The good news is that just adding the correct firmware fixed it for me, no need for any magic incantation. 

Download the firmware from intel's website (I don't know if I can just copy it in this repo) and copy the file `iwlwifi-ty-a0-gf-a0-59.ucode` to `/usr/lib/firmware/iwlwifi-ty-a0-gf-a0-59.ucode`

https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-ty-59.601f3a66.0.tgz

### Wi-Fi troubleshooting (for 5.12 - might not need this for 5.14)

For some reason I had to enable multiple SSIDs on my router (Amplifi) so I could easily select the 5G one. Wifi 6 was giving me very frequent disconnects.

With 5G it works OK-ish (but throughput is lower though).

I've seen microcode crashes under stress tests and they are actually common on this chipset, there's several reports about it.


### Fingerprint reader
It doesn't work by default but the community has already provided instructions and a simple script to build the required drivers. After that it works just fine, both to unlock the computer and even for sudo. 

You can find the pre-built .deb files in the fingerprint directory here if you don't want to build them yourself. Note that I just followed the instructions from the community.

Note that enabling the fingerprint reader means that for sudo and others, the fingerprinter reader takes priority. There's a short (I think, 5 seconds) timeout, and then you will be able to use your password. You will not be able to either type the password or use your finger at the same time. In your laptop is typically in clamshell mode (lid closed and you're using an external keyboard) this becomes annoying, as you can't use the finger and you need to wait every time.

### Dock
Tested: 
- Dell's TB16, which is discontinued but can be gotten off eBay at very reasonable prices. It doesn't work very well.
- Pluggable TBT3-UDV. It doesn't have a power button so it's useless in clamshell mode (if you want to have a way to wake up the laptop).
- Anker's 13-in-1. This is the one I'm currently using so comments are about it. 

**Tested**
- Audio (in/out works fine in zoom, for example)
- Keyboard and mouse - work fine and can wake up the PC from sleep. I'm using the monitor's built-in KVM so there is only one cable for both the keyboard and the mouse going from the monitor to the dock, no problems.
- Power on on AC: OK (needed it power on the laptop when in clamshell mode with having to open the lid, etc)
- 1 External monitor works too, but only after Ubuntu is ready, i.e. no BIOS or grub.

**Not tested**
- SD reader
- USB ports, except for the keyboard and mouse.
- More than 1 monitor

**More resources**
This repo https://github.com/lightrush/framework-laptop-formula/tree/main/framework-laptop for Ubuntu 20.04 seems fantastic. I'm using 21.10 so I haven't tried it personally yet and I don't want some of those changes anyway, but it seems to address all known pain points.
