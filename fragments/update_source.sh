#!/bin/sh

set -e

if [ "$SOURCES_LIST" != "default" ]; then
    echo Start to update custom Source.list from $SOURCES_LIST
    mv /etc/apt/sources.list /etc/apt/sources.list.backup
    wget $SOURCES_LIST --quiet -O /etc/apt/sources.list

    apt-get update
fi