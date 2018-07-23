#!/bin/sh

VERSION='1.5.8a'
MD5='e42a0b22b6c0ee0ea76c94d9d5262c34'

case "$1" in
verify)
        [ -f excavator ] && [ `md5sum excavator | awk '{print $1}'` == "$MD5" ]
        exit $?
        ;;
download)
        curl -L -O "https://github.com/nicehash/excavator/releases/download/v${VERSION}/excavator_${VERSION}_amd64.deb"
        ar x "excavator_${VERSION}_amd64.deb" data.tar.xz
        tar xf data.tar.xz --strip-components 4 ./opt/excavator/bin/excavator
        rm -f "excavator_${VERSION}_amd64.deb" data.tar.xz
        exit 0
        ;;
esac

