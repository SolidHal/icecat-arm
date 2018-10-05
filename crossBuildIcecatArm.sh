#!/bin/sh -xe



VER=52.6.0

bchroot=ice_chroot

[ ! -d build ] && mkdir build
cd build
[ ! -d $bchroot ] && qemu-debootstrap --arch=armhf --variant=buildd stretch $bchroot http://deb.debian.org/debian

cp ../armhf_toolchain.patch $bchroot/armhf_toolchain.patch
cp ../icecat_mozconfig $bchroot/icecat_mozconfig
#Run a script in the chroot
cp ../nativeBuildIcecat.sh $bchroot/nativeBuildIcecat.sh
chroot $bchroot ./nativeBuildIcecat.sh
