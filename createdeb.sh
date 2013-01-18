#!/bin/sh
# A simple script that collects the files needed to create a debian installer.
# The script then creates a simple deb file.

echo "run make, make install before you run this script"
mkdir -p build/debian
#rm -R
mkdir -p build/debian/usr/local/lib/freerdp
mkdir -p build/debian/usr/local/lib
mkdir -p build/debian/usr/local/bin
mkdir -p build/debian/etc/ld.so.conf.d
mkdir -p build/debian/DEBIAN
#
echo "copy all libs"
cp /usr/local/lib/libfreerdp*.1.1.0 build/debian/usr/local/lib/
#cp /usr/local/lib/libfreerdp*.a build/debian/usr/local/lib/
#cp /usr/local/lib/libfreerdp*.la build/debian/usr/local/lib/
cp /usr/local/lib/libwinpr*.0.1.0 build/debian/usr/local/lib/
cp /usr/local/lib/freerdp/* build/debian/usr/local/lib/freerdp/
cp /usr/local/bin/xfreerdp build/debian/usr/local/bin/
cp freerdp.conf build/debian/etc/ld.so.conf.d/

#
cp DEBIAN/* build/debian/DEBIAN
chmod 0555 build/debian/DEBIAN/postinst
chmod 0555 build/debian/DEBIAN/prerm
cd build
echo "build installer"
dpkg-deb --build debian freerdp.deb
