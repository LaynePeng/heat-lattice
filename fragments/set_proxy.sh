#!/bin/sh

set -e

if [ "$PROXY" != "default" ]; then
echo Start to Set Proxy: $PROXY

export http_proxy=$PROXY
export https_proxy=$PROXY

echo export http_proxy=$PROXY >> /etc/profile
echo export https_proxy=$PROXY >> /etc/profile
fi