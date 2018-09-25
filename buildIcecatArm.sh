#!/bin/sh -xe


ROOT_DIR=`pwd`

VER=52.6.0

bchroot=$(mktemp -d -p `pwd`)

debootstrap --arch=amd64 --variant=buildd stretch $bchroot
chroot $bchroot
mount -t proc proc /proc
chroot $bchroot dpkg --add-architecture armhf
chroot $bchroot apt update

#Setup source for building
#Cd into source in chroot, then run dpkg-buildpackage -us -uc -b --host-arch armhf?

# Get prereqs
apt-get build-dep -a armhf -y firefox-esr
#wget -O bootstrap.py https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py && python bootstrap.py

#get source, and setup dirs
[ ! -d build ] && mkdir build
cd build

[ ! -f icecat-$VER-gnu1.tar.bz2 ] && wget http://ftp.gnu.org/gnu/gnuzilla/$VER/icecat-$VER-gnu1.tar.bz2
[ ! -d icecat-$VER ] && tar -xvjf icecat-$VER-gnu1.tar.bz2 && FRESH=true

SRC=$ROOT_DIR/build/icecat-$VER

[ "$FRESH" = true ] && cat $ROOT_DIR/icecat_mozconfig >> $SRC/mozconfig

[ ! -d obj ] && mkdir obj
cd obj

mkdir -p $SRC/browser/branding/unofficial/
$SRC/configure --with-l10n-base=$SRC/l10n
make -j `grep ^processor /proc/cpuinfo  | wc -l`  CROSS_COMPILE=arm-none-eabi- ARCH=arm

