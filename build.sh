#!/bin/sh
set -e

TARGET=target
SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET

# Man Pages
mkdir -p $TARGET/usr/share/man/man1/
pandoc $SOURCE/md/siakhooi-devutils.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/siakhooi-devutils.1.gz

dpkg-deb --build -Zxz $TARGET
dpkg-name ${TARGET}.deb

DEBFILE=$(ls ./*.deb)
dpkg --contents "$DEBFILE"
