#!/bin/sh -xe



VER=52.6.0

bchroot=ice_chroot

[ ! -d build ] && mkdir build
cd build
[ ! -d $bchroot ] && qemu-debootstrap --arch=armhf --variant=buildd stretch $bchroot

cp ../icecat_mozconfig $bchroot/icecat_mozconfig
#Run a script in the chroot
cat << EOF | chroot $bchroot
# apt install -y wget locales
# echo en_US.UTF-8 UTF-8 > /etc/locale.gen
# locale-gen
# apt update

# # Get prereqs
# #apt-get build-dep -a armhf -y firefox-esr
# #Does nothing as no "source" url are in sources.list

# apt install -y autoconf2.13
# apt install -y perl make libgtk2.0-dev libgtk-3-dev libxt-dev libidl-dev libx11-xcb-dev zip libfreetype6-dev fontconfig libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev pkg-config libdbus-glib-1-dev libasound2-dev libpulse-dev libasound2-dev libnotify-dev yasm libpython2.7-dev python2.7 python2.7-dev autoconf2.13 m4 binutils-avr libgl1-mesa-dev  libpango-1.0-0 libpangoxft-1.0-0 ibpangoft2-1.0-0 libfreetype6 libxft2 libgtk2.0-0 libx11-6 python-virtualenv python-pip lbzip2 libicu-dev gconf2 gir1.2-gconf-2.0 libgconf2-dev gconf2-common libgconf-2-4 libgconf2.0-cil libgconf2.0-cil-dev


# #get source, and setup dirs

# [ ! -d icecat ] && mkdir icecat
cd icecat

# [ ! -f icecat-$VER-gnu1.tar.bz2 ] && wget http://ftp.gnu.org/gnu/gnuzilla/$VER/icecat-$VER-gnu1.tar.bz2
# [ ! -d icecat-$VER ] && tar -xvjf icecat-$VER-gnu1.tar.bz2


# [ ! -f icecat-$VER/mozconfig ] && cp /icecat_mozconfig icecat-$VER/mozconfig


# [ ! -d obj ] && mkdir obj
cd obj

# #mkdir -p ../icecat-$VER/browser/branding/unofficial/
# #../icecat-$VER/configure
# #make

#now make the installer
cd browser/installer
make
EOF

# SRC=$ROOT_DIR/build/icecat-$VEyR

# [ "$FRESH" = true ] && cat $ROOT_DIR/icecat_mozconfig >> $SRC/mozconfigy


# mkdir -p $SRC/browser/branding/unofficial/
# $SRC/configure --with-l10n-base=$SRC/l10n
# make -j `grep ^processor /proc/cpuinfo  | wc -l`  CROSS_COMPILE=arm-none-eabi- ARCH=arm

