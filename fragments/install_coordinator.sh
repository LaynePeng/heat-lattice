#!/bin/sh

set -e
echo Start to install Lattice-Coordinator
cp /var/lattice/setup/lattice-environment /vagrant/.lattice-environment
tar -xf "$PATH_TO_LATTICE_TAR" -C /tmp
/tmp/lattice-build/common/install-common
/tmp/lattice-build/coordinator/install-coordinator
