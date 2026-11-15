#!/bin/bash

#dpkg-deb -Zxz -z9 -Sextreme --root-owner-group --build calamares-settings-kebianos calamares-settings-kebianos_1.4_amd64.deb


ver=$(awk '/^Version:/{print $2; exit}' kebianos-defaults/DEBIAN/control)
echo "$ver"



if [ "$1" = "-u" ]; then
    dpkg-deb -Zxz -z9 -Sextreme --root-owner-group --build kebianos_defaults kebianos_defaults_"$ver"_amd64.deb
    git add .
    git commit -m "$ver"
    git push origin main
    mv *.deb build/
    exit 0
fi


dpkg-deb -Zxz -z9 -Sextreme --root-owner-group --build kebianos-defaults kebianos_defaults_"$ver"_amd64.deb


mv *.deb build/
