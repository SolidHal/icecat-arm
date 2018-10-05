#!/bin/sh -xe



VER=52.6.0

bchroot=ice_chroot
cd build
#Enter the chroot, build the installer there
cat << EOF | chroot $bchroot
cd build/icecat/obj/browser/installer
make
EOF

[ ! -d installer ] && mkdir installer
cp $bchroot/build/icecat/obj/dist/icecat-$VER*.tar.bz2 installer/
