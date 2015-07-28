#!/bin/sh

set -e

if ["null" != $PRIVATE_REGISTRIES] ;then    
sudo sed -i '18i-insecureDockerRegistryList='$PRIVATE_REGISTRIES' \\' /etc/init/garden-linux.conf
sudo initctl stop garden-linux
sudo initctl start garden-linux
fi