#!/bin/bash
set -ex

# make working dir
mkdir temp
cd temp

# downlaod custom debs
curl -O https://drop.azokai.com/byZeJyvw/libfprint_v1.94.1_custom_debs.zip

# unzip archive
unzip ./libfprint_v1.94.1_custom_debs.zip

# install one dependency
sudo apt install -y gir1.2-gusb-1.0

# install .deb files
sudo dpkg -i ./libfprint-2-2_1.94.1-1_amd64.deb
sudo dpkg -i ./libfprint-2-doc_1.94.1-1_all.deb
sudo dpkg -i ./gir1.2-fprint-2.0_1.94.1-1_amd64.deb

# install .deb files
sudo dpkg -i ./fprintd_1.94.0-1_amd64.deb &&
sudo dpkg -i ./fprintd-doc_1.94.0-1_all.deb &&
sudo dpkg -i ./libpam-fprintd_1.94.0-1_amd64.deb

# enable service
sudo systemctl enable fprintd.service
sudo systemctl start fprintd.service

# enable pam module (sudo functionality)
sudo pam-auth-update --enable fprintd

# delete everything
cd ..
sudo rm -rf temp