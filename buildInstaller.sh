
#!/bin/sh -xe



VER=52.6.0

bchroot=ice_chroot
cd build
cat << EOF | chroot $bchroot
cd build/icecat/obj/browser/installer
make
EOF
