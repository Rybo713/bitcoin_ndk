#!/bin/bash
set -eo pipefail
export NDK_VERSION=android-ndk-r23b
export NDK_FILENAME=${NDK_VERSION}-linux.zip

sha256_file=c6e97f9c8cfe5b7be0a9e6c15af8e7a179475b7ded23e2d1c1fa0945d6fb4382

apt-get -yqq update &> /dev/null
apt-get -yqq upgrade &> /dev/null
apt-get -yqq install python curl build-essential libtool autotools-dev automake pkg-config bsdmainutils unzip git &> /dev/null

mkdir -p /opt

cd /opt && curl -sSO https://dl.google.com/android/repository/${NDK_FILENAME} &> /dev/null
echo "${sha256_file}  ${NDK_FILENAME}" | shasum -a 256 --check
unzip -qq ${NDK_FILENAME} &> /dev/null
rm ${NDK_FILENAME}

if [ -f /.dockerenv ]; then
    apt-get -yqq --purge autoremove unzip
    apt-get -yqq clean
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /usr/share/locale/* /usr/share/man /usr/share/doc /lib/xtables/libip6*
fi
