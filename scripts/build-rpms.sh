#!/bin/bash
set -e

rm -rf ~/rpmbuild
rpmdev-setuptree

readonly SOURCE=src
readonly TARGET=~/rpmbuild/BUILD/

# Spec File
cp $SOURCE/RPMS/siakhooi-devutils.spec ~/rpmbuild/SPECS

# Man Pages
mkdir -p $TARGET/usr/share/man/man1/
pandoc $SOURCE/md/siakhooi-devutils.1.md -s -t man |
  gzip -9 >$TARGET/usr/share/man/man1/siakhooi-devutils.1.gz

# License
cp -vf ./LICENSE "$TARGET"

# build rpm file
rpmlint ~/rpmbuild/SPECS/siakhooi-devutils.spec
rpmbuild -bb -vv ~/rpmbuild/SPECS/siakhooi-devutils.spec
cp -vf ~/rpmbuild/RPMS/noarch/siakhooi-devutils-*.rpm .

# query
tree ~/rpmbuild/
rpm -ql ~/rpmbuild/RPMS/noarch/siakhooi-devutils-*.rpm

rpm_file=$(basename "$(ls ./siakhooi-devutils-*.rpm)")

sha256sum "$rpm_file" >"$rpm_file.sha256sum"
sha512sum "$rpm_file" >"$rpm_file.sha512sum"
