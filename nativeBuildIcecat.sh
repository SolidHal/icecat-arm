
#!/bin/sh -xe



VER=52.6.0
BASEDIR=`pwd`

[ ! -d build ] && mkdir build
cd build

apt install -y autoconf2.13
apt install -y perl make libgtk2.0-dev libgtk-3-dev libxt-dev libidl-dev libx11-xcb-dev zip libfreetype6-dev fontconfig libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev pkg-config libdbus-glib-1-dev libasound2-dev libpulse-dev libasound2-dev libnotify-dev yasm libpython2.7-dev python2.7 python2.7-dev autoconf2.13 m4 binutils-avr libgl1-mesa-dev  libpango-1.0-0 libpangoxft-1.0-0 ibpangoft2-1.0-0 libfreetype6 libxft2 libgtk2.0-0 libx11-6 python-virtualenv python-pip lbzip2 libicu-dev gconf2 gir1.2-gconf-2.0 libgconf2-dev gconf2-common libgconf-2-4 libgconf2.0-cil libgconf2.0-cil-dev pkg-config wget

apt-get build-dep -y firefox-esr


[ ! -d icecat ] && mkdir icecat
cd icecat

[ ! -f icecat-$VER-gnu1.tar.bz2 ] && wget http://ftp.gnu.org/gnu/gnuzilla/$VER/icecat-$VER-gnu1.tar.bz2
[ ! -d icecat-$VER ] && tar -xvjf icecat-$VER-gnu1.tar.bz2


[ ! -f icecat-$VER/mozconfig ] && cp $BASEDIR/icecat_mozconfig icecat-$VER/mozconfig


[ ! -d obj ] && mkdir obj
cd obj

#mkdir -p ../icecat-$VER/browser/branding/unofficial/
#touch ../icecat-$VER/browser/branding/unofficial/moz.build
#copy over the branding
cp -r ../icecat-$VER/browser/branding/official ../icecat-$VER/browser/branding/unofficial

../icecat-$VER/configure
#make -j $(nproc) -f ../icecat-$VER/client.mk
make -f ../icecat-$VER/client.mk 2>&1 | tee ../make_log.txt

#Copy over some things
#cp ../icecat-$VER/browser/branding/official/pref/icecat-branding.js dist/bin/browser/defaults/preferences/icecat-branding.js
#mkdir -p dist/bin/browser/chrome/icons/default/
#cp ../icecat-$VER/browser/branding/official/default*.png   dist/bin/browser/chrome/icons/default/
#mkdir -p dist/bin/browser/icons/
#cp ../icecat-$VER/browser/branding/official/default*.png   dist/bin/browser/icons/

#now make the installer
#cd browser/installer
#make
