#!/bin/bash

mkdir build_dir
cd build_dir

mkdir libfprint_dir
cd libfprint_dir

curl -O https://deb.debian.org/debian/pool/main/libf/libfprint/libfprint_1.90.7-2.debian.tar.xz
sudo apt build-dep libfprint
sudo apt-get install libgudev-1.0-dev
git clone https://github.com/freedesktop/libfprint.git 

cd libfprint
git checkout v1.94.1
tar -xJvf ../libfprint_1.90.7-2.debian.tar.xz

cd debian
rm changelog rules libfprint-2-2.install
curl -O https://drop.azokai.com/imlarqLc/libprintf/changelog
curl -O https://drop.azokai.com/euKUpCRh/libprintf/rules
curl -O https://drop.azokai.com/dwFRUFqi/libfprint-2-2.install
curl -O https://drop.azokai.com/cWcJRHAT/libfprint-2-2.symbols

cd ..
sudo dpkg-buildpackage -b -uc -us
sudo dpkg -i ../*.deb
cd ../..

mkdir fprintd_dir
cd fprintd_dir

apt source --download-only fprintd
sudo apt build-dep fprintd
git clone https://github.com/freedesktop/libfprint-fprintd.git

cd libfprint-fprintd
git checkout v1.94.0
tar -xJvf ../fprintd_1.90.9-1.debian.tar.xz

cd debian
rm changelog rules
curl -O https://drop.azokai.com/ClBYfZdx/fprintd/changelog
curl -O https://drop.azokai.com/yuOHuFgq/fprintd/rules

cd ..
sudo dpkg-buildpackage -b -uc -us

cd ..
sudo dpkg -i ./*.deb

sudo systemctl enable fprintd.service
sudo systemctl start fprintd.service


sudo pam-auth-update --enable fprintd

cd ../..
sudo rm -rf build_dir