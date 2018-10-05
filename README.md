## GNU icecat  arm hf cross compile scripts

To build icecat for armhf either run nativeBuildIcecat.sh if building on an armhf machine, or if crosscompiling on an x86-64 machine run buildIcecatArm.sh

When building natively, I found 4GB of RAM to be too little and needed to create a 4GB swap file. Pleanty of instructions online can be found to do this. 

#### Warning: This takes over 2 hours on my armhf machine and a bit longer than overnight on my x86-64 with decent processor and 16GB RAM so get some reading material ready. 

Then then bundle icecat up, if on an armhf machine navigate to build/icecat/obj/browser/installer
and run `make`
a compressed binary will then be available at build/icecat/obj/dist/

if cross compiling, run buildInstaller.sh
