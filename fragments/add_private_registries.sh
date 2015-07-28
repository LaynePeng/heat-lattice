#!/bin/sh

set -e

if [ $PRIVATE_REGISTRIES != 'null' ]
then
line=$((`sudo sed -n '$=' /etc/init/garden-linux.conf`-5))
sudo sed -i $line'i-insecureDockerRegistryList='$PRIVATE_REGISTRIES' \\' /etc/init/garden-linux.conf
sudo initctl stop garden-linux
sudo initctl start garden-linux
fi