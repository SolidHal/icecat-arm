#!/bin/sh -xe

VER=52.6.0
BASEDIR=`pwd`

cd build/icecat/obj/browser/installer
make

cd build

[ ! -d installer ] && mkdir installer
cp build/icecat/obj/dist/icecat-$VER*.tar.bz2 installer/
