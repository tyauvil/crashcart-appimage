#!/bin/bash

set -eux

RELEASE_DATE="20150921"

cd /tmp
unzip -u notecons.zip
cd 'Linux Debian'
ar vx 'Linux Install 64bit.deb'
tar xf data.tar.gz
cd opt/usb-crash-cart-adapter/${RELEASE_DATE}
cp *.rules Copyright /artifacts
cd guts

# https://ubuntuforums.org/showthread.php?t=2303035
rm libz.so.1

# copy icon
cp images/icon128.png crashcart.png

# AppRun
cat << 'EOF' > AppRun
#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
EXEC ${HERE}/dover

EOF

# crashcart.desktop
cat << 'EOF' > crashcart.desktop
[Desktop Entry]
Name=Crashcart
Exec=crashcart
Icon=crashcart
Comment=USB Crash Cart Adapter
Version=1.0
Type=Application
Terminal=false
StartupWMClass=Dover

EOF

cd ..

mv guts crashcart.AppDir

appimagetool -n crashcart.AppDir

mv crashcart.AppImage /artifacts
