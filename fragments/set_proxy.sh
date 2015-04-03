#!/bin/sh

set -e

if [ "$PROXY" != "default" ]; then
echo Start to Set Proxy: $PROXY

export http_proxy=$PROXY
fi