The original script source is

https://drop.azokai.com/JHqSJwhS/libfprint_v1.94.1_install_v2.sh

There's a copy here as well in case the original disappears.

Community instructions here

https://community.frame.work/t/fingerprint-scanner-compatibility-with-linux-ubuntu-fedora-etc/1501/131

I didn't do anything extra except solve a few missing dependencies. If you don't want to compile the source yourself you can install my .deb files from this repo.

If you want to follow the instructions (or just run that script, which is really crude but it works if you have all prerequites), keep this in mind:

- I had to edit /etc/apt/sources.list to include the deb-src (they are commented out by default, at least on my Ubuntu). The instructions require the source of one of the packages, so build will fail without it.

- A lot of packages are required. In a "lived-in" system they are probably there already. If you're just starting fresh you might have to install them now.

```
apt-get install build-essential gtk-doc-tools libcairo-dev libgirepository1.0-dev libgusb-dev libnss3-dev libpixman-1-dev meson  umockdev libglib2.0-doc libgusb-doc dh-exec libpam0g-dev libpolkit-gobject-1-dev libsystemd-dev python3-dbusmock python3-pypamtest libpam-wrapper
```


