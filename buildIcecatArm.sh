#!/bin/sh -xe



VER=52.6.0

bchroot=ice_chroot

[ ! -d build ] && mkdir build
cd build
[ ! -d $bchroot ] && qemu-debootstrap --arch=armhf --variant=buildd stretch $bchroot http://deb.debian.org/debian

cp ../icecat_mozconfig $bchroot/icecat_mozconfig
#Run a script in the chroot
cp ../nativeBuildIcecat.sh $bchroot/nativeBuildIcecat.sh
chroot $bchroot ./nativeBuildIcecat.sh

# SRC=$ROOT_DIR/build/icecat-$VEyR

# [ "$FRESH" = true ] && cat $ROOT_DIR/icecat_mozconfig >> $SRC/mozconfigy


# mkdir -p $SRC/browser/branding/unofficial/
# $SRC/configure --with-l10n-base=$SRC/l10n
# make -j `grep ^processor /proc/cpuinfo  | wc -l`  CROSS_COMPILE=arm-none-eabi- ARCH=arm

