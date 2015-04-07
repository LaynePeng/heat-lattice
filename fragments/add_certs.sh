#!/bin/sh

set -e

if [ "$CERTS_Files" != "default" ]; then
echo Start to install SSL Cert

wget $CERTS_Files --quiet -O /tmp/certs.tgz
mkdir /usr/share/ca-certificates/docker
tar -xf /tmp/certs.tgz -C /usr/share/ca-certificates/docker
cd /usr/share/ca-certificates && find ./docker/ -type f | sed 's/.\///' >> /etc/ca-certificates.conf
update-ca-certificates
fi